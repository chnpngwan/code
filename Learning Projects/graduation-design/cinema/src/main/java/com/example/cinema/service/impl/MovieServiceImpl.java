package com.example.cinema.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.constant.CommonConstant;
import com.example.cinema.constant.RedisPreFixConstant;
import com.example.cinema.enums.OrderStatusEnum;
import com.example.cinema.mapper.*;
import com.example.cinema.service.RedisService;
import com.example.cinema.utils.MinioUtil;
import com.example.cinema.dto.MovieDTO;
import com.example.cinema.entity.*;
import com.example.cinema.service.MovieService;
import com.example.cinema.utils.BeanCopyUtil;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;

import javax.annotation.PostConstruct;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

import static com.example.cinema.constant.RedisPreFixConstant.*;
import static com.example.cinema.constant.RedisPreFixConstant.RANK_TOP100;

@Service
public class MovieServiceImpl extends ServiceImpl<MovieMapper, Movie> implements MovieService {

    @Autowired
    private RedisService redisService;
    @Autowired
    private MovieCategoryMapper movieCategoryMapper;
    @Autowired
    private MovieActorDutyMapper movieActorDutyMapper;
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private LaminationMapper laminationMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private MinioUtil minioUtil;

    @Override
    public PageResult<MovieVO> getMovieVOPage(String keywords) {
        // 获取movie
        Page<Movie> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<Movie> moviePage = baseMapper.selectPage(page, new LambdaQueryWrapper<Movie>()
                .like(!StrUtil.isEmpty(keywords), Movie::getNameCn, keywords)
                .or()
                .like(!StrUtil.isEmpty(keywords), Movie::getNameEn, keywords)
                .or()
                .like(!StrUtil.isEmpty(keywords), Movie::getIntro, keywords));
        List<Integer> movieIdList = moviePage.getRecords().stream()
                .map(Movie::getId)
                .collect(Collectors.toList());
        return new PageResult<>(getMovieVOListByMovieIdList(movieIdList), moviePage.getTotal());
    }

    @Override
    public List<MovieSimpleVO> getMovieSimpleVOPage() {
        return this.list().stream().map(i -> MovieSimpleVO.builder()
                        .id(i.getId())
                        .name(i.getNameCn())
                        .build())
                .collect(Collectors.toList());
    }

    @Override
    public MovieDetailVO getMovieDetailByMovieId(Integer movieId) {
        Movie movie = baseMapper.selectById(movieId);
        MovieDetailVO movieDetailVO = BeanCopyUtil.copyObject(movie, MovieDetailVO.class);
        Area area = baseMapper.getAreaByMovieId(movieId);
        AreaVO areaVO = BeanCopyUtil.copyObject(area, AreaVO.class);
        List<Category> categoryList = baseMapper.getCategoryListByMovieId(movieId);
        List<CategoryVO> categoryVOList = BeanCopyUtil.copyList(categoryList, CategoryVO.class);
        List<MovieActorVO> dutyList = getMovieActorByMovieId(movieId);
        movieDetailVO.setArea(areaVO);
        movieDetailVO.setCategoryList(categoryVOList);
        movieDetailVO.setDutyList(dutyList);
        return movieDetailVO;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean saveOrUpdateMovie(MovieDTO movieDTO) {
        System.out.println(movieDTO);
        // 保存或者更新电影信息
        Movie movie = BeanCopyUtil.copyObject(movieDTO, Movie.class);
        System.out.println(movie);
        if (Objects.nonNull(movie.getId())) {
            // 如果是更新操作先删除旧的category
            movieCategoryMapper.delete(new LambdaQueryWrapper<MovieCategory>()
                    .eq(MovieCategory::getMovieId, movie.getId()));
        }
        this.saveOrUpdate(movie);
        // 保存或者更新movie_category
        movieDTO.getCategoryIdList().forEach(i -> {
            MovieCategory movieCategory = MovieCategory.builder()
                    .movieId(movie.getId())
                    .categoryId(i)
                    .build();
            movieCategoryMapper.insert(movieCategory);
        });
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteMovie(List<Integer> ids) {
        if (CollectionUtil.isEmpty(ids)) {
            return true;
        }
        // 首先删除电影信息
        int count = baseMapper.deleteBatchIds(ids);
        if (count != ids.size()) {
            throw new RuntimeException("删除电影失败");
        }
        // 删除movie、category关联表中的信息
        List<MovieCategory> movieCategoryList = movieCategoryMapper
                .selectList(new LambdaQueryWrapper<MovieCategory>()
                .in(MovieCategory::getMovieId, ids));
        List<Integer> collect = movieCategoryList.stream()
                .map(MovieCategory::getId).collect(Collectors.toList());
        count = movieCategoryMapper.deleteBatchIds(collect);
        if (count != collect.size()) {
            throw new RuntimeException("删除电影失败");
        }
        // 删除movie、actor关联表中的信息
        List<MovieActorDuty> movieActorDutyList = movieActorDutyMapper
                .selectList(new LambdaQueryWrapper<MovieActorDuty>()
                .in(MovieActorDuty::getMovieId, ids));
        // 该电影无关联演员，无需进行后续删除操作
        if (CollectionUtil.isEmpty(movieActorDutyList)) {
            return true;
        }
        List<Integer> collect1 = movieActorDutyList.stream()
                .map(MovieActorDuty::getId).collect(Collectors.toList());
        count = movieActorDutyMapper.deleteBatchIds(collect1);
        if (count != collect1.size()) {
            throw new RuntimeException("删除电影失败");
        }
        return true;
    }

    @Override
    public List<MovieActorVO> getMovieActorByMovieId(Integer movieId) {
        return baseMapper.getMovieActorListByMovieId(movieId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean saveMovieActorDuty(MovieActorDutyDTO movieActorDutyDTO) {
        movieActorDutyDTO.getActorIdList().forEach(item -> {
            MovieActorDuty movieActorDuty = MovieActorDuty.builder()
                    .movieId(movieActorDutyDTO.getMovieId())
                    .dutyId(movieActorDutyDTO.getDutyId())
                    .actorId(item)
                    .build();
            movieActorDutyMapper.insert(movieActorDuty);
        });
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteMovieActorDuty(MovieActorDutyDTO movieActorDutyDTO) {
        movieActorDutyDTO.getActorIdList().forEach(item -> {
            movieActorDutyMapper.delete(new LambdaQueryWrapper<MovieActorDuty>()
                    .eq(MovieActorDuty::getMovieId, movieActorDutyDTO.getMovieId())
                    .eq(MovieActorDuty::getActorId, item)
                    .eq(MovieActorDuty::getDutyId, movieActorDutyDTO.getDutyId()));
        });
        return true;
    }

    @Override
    public boolean deleteMovieImage(Integer movieId) {
//        String image = movie.getImage();
//        int index = image.lastIndexOf('/');
//        String filename = image.substring(index + 1);
        // 删除minio上的文件
//        if (!minioUtil.deleteFile(filename)) {
//            throw new RuntimeException("文件服务器删除失败");
//        }
        return baseMapper.updateMovieImageByMovieId(movieId) == 1;
    }

    @Override
    public PageResult<MovieFrontVO> getOngoingMovie(Integer categoryId,Integer areaId, Integer ageId,Integer orderType) {
        List<Integer> movieIdList = baseMapper.getOngoingMovieIdByCondition(PageUtil.getLimitCurrent(),
                PageUtil.getSize(), categoryId, areaId, ageId, orderType);
        Long total = baseMapper.getOngoingMovieTotalByCondition(categoryId, areaId, ageId);
        List<MovieFrontVO> movieFrontVOList = getMovieFrOntVOByMovieId(movieIdList);
        return new PageResult<>(movieFrontVOList, total);
    }

    @Override
    public PageResult<MovieFrontVO> getUpcomingMovie(Integer categoryId,Integer areaId, Integer ageId,Integer orderType) {
        List<Integer> movieIdList = baseMapper.getUpcomingMovieIdByCondition(PageUtil.getLimitCurrent(), PageUtil.getSize(),
                categoryId, areaId, ageId, orderType);
        Long total = baseMapper.getUpcomingMovieTotalByCondition(categoryId, areaId, ageId);
        List<MovieFrontVO> movieFrontVOList = getMovieFrOntVOByMovieId(movieIdList);
        return new PageResult<>(movieFrontVOList, total);
    }

    @Override
    public PageResult<MovieFrontVO> getClassicMovie(Integer categoryId, Integer areaId, Integer ageId, Integer orderType) {
        List<Integer> movieIdList = baseMapper.getClassicMovieIdByCondition(PageUtil.getLimitCurrent(), PageUtil.getSize(),
                categoryId, areaId, ageId, orderType);
        Long total = baseMapper.getClassicMovieTotalByCondition(categoryId, areaId, ageId);
        List<MovieFrontVO> movieFrontVOList = getMovieFrOntVOByMovieId(movieIdList);
        return new PageResult<>(movieFrontVOList, total);
    }

    @Override
    public List<MovieFrontVO> getMovieFrOntVOByMovieId(List<Integer> movieIdList) {
        return movieIdList.stream().map(id -> {
            Movie movie = baseMapper.selectById(id);
            List<Category> categoryList = baseMapper.getCategoryListByMovieId(id);
            List<CategoryVO> categoryVOList = BeanCopyUtil.copyList(categoryList, CategoryVO.class);
            List<MovieActorVO> movieActorList = baseMapper.getMovieActorListByMovieId(id);
            List<ActorVO> actorVOList = new ArrayList<>();
            movieActorList.forEach(item -> actorVOList.addAll(item.getActorList()));
            return MovieFrontVO.builder()
                    .id(id)
                    .nameCn(movie.getNameCn())
                    .image(movie.getImage())
                    .releaseTime(movie.getReleaseTime())
                    .actorList(actorVOList.subList(0, Math.min(3, actorVOList.size())))
                    .categoryList(categoryVOList)
                    .score(movie.getScore())
                    .build();
        }).collect(Collectors.toList());
    }

    @Override
    public List<MovieVO> getMovieVOListByMovieIdList(List<Integer> movieIdList) {
        return movieIdList.stream().map(movieId -> {
            Movie movie = baseMapper.selectById(movieId);
            MovieVO movieVO = BeanCopyUtil.copyObject(movie, MovieVO.class);
            Age age = baseMapper.getAgeByMovieId(movieId);
            Area area = baseMapper.getAreaByMovieId(movieId);
            List<Category> categoryList = baseMapper.getCategoryListByMovieId(movieId);
            movieVO.setAge(age);
            movieVO.setArea(area);
            movieVO.setCategoryList(categoryList);
            return movieVO;
        }).collect(Collectors.toList());
    }

    @Override
    public void incrMovieViewCount(Integer movieId) {
        if (!redisService.hExists(RedisPreFixConstant.VIEW_COUNT, movieId + "")) {
            Movie movie = baseMapper.selectById(movieId);
            redisService.hSet(RedisPreFixConstant.VIEW_COUNT, movieId + "", movie.getViewCount());
        }
        redisService.hIncr(RedisPreFixConstant.VIEW_COUNT, movieId + "", 1L);
    }

    private double getAvgScoreByMovieId(Integer movieId) {
        List<Double> scoreList = commentMapper.selectList(new LambdaQueryWrapper<Comment>()
                        .eq(Comment::getMovieId, movieId)
                        .eq(Comment::getReviewFlag, CommonConstant.TRUE)).stream()
                .map(Comment::getScore)
                .collect(Collectors.toList());
        BigDecimal totalScore = new BigDecimal("0.0");
        if (!CollectionUtil.isEmpty(scoreList)) {
            for (Double score : scoreList) {
                totalScore = totalScore.add(new BigDecimal(score.toString()));
            }
            totalScore = totalScore.divide(new BigDecimal(scoreList.size() + ""), 1, RoundingMode.HALF_UP);
        }
        return totalScore.doubleValue();
    }

    private double getGrossByMovieId(Integer movieId) {
        List<Integer> laminationIds = laminationMapper.selectList(new LambdaQueryWrapper<Lamination>()
                        .eq(Lamination::getMovieId, movieId))
                .stream()
                .map(Lamination::getId)
                .collect(Collectors.toList());
        List<Order> orderList = new ArrayList<>();
        for (Integer laminationId : laminationIds) {
            List<Order> list = orderMapper.selectList(new LambdaQueryWrapper<Order>()
                    .eq(Order::getLaminationId, laminationId)
                    .eq(Order::getOrderStatus, OrderStatusEnum.PAID.getCode()));
            orderList.addAll(list);
        }
        BigDecimal gross = new BigDecimal("0");
        if (!CollectionUtils.isEmpty(orderList)) {
            for (Order order : orderList) {
                gross = gross.add(new BigDecimal(order.getTotalPrice().toString()));
            }
        }
        return gross.doubleValue();
    }

    @PostConstruct
    public void sync() {
        // 同步信息
        List<Movie> movieList = baseMapper.selectList(null);
        movieList.forEach(movie -> {
            double score = getAvgScoreByMovieId(movie.getId());
            double gross = getGrossByMovieId(movie.getId());
            movie.setScore(score);
            movie.setGross(gross);
            if (redisService.hExists(RedisPreFixConstant.VIEW_COUNT, movie.getId() + "")) {
                Integer viewCount = (Integer) redisService.hGet(RedisPreFixConstant.VIEW_COUNT, movie.getId() + "");
                movie.setViewCount(viewCount);
            }
            movie.setUpdateTime(LocalDateTime.now());
        });
        this.updateBatchById(movieList);
        // 删除键
        redisService.delete(RANK_REPUTATION);
        redisService.delete(RANK_TOP100);
        redisService.delete(RANK_GROSS);
        redisService.delete(RANK_TODAY_GROSS);
        // 初始化热映口碑榜
        baseMapper.getReputationMovieIdList().forEach(item -> {
            Double score = item.getScore();
            if (ObjectUtils.isEmpty(score)) {
                score = 0.0;
            }
            redisService.zAdd(RANK_REPUTATION, score, item.getId());
        });
        // 初始化票房榜
        Page<Movie> page = new Page<>(0, 100);
        Page<Movie> movieGrossPage = baseMapper.selectPage(page, new LambdaQueryWrapper<Movie>()
                .orderByDesc(Movie::getGross)
                .orderByAsc(Movie::getId));
        movieGrossPage.getRecords().forEach(movie -> redisService.zAdd(RANK_GROSS, movie.getGross(), movie.getId()));
        // 初始化top100榜
        baseMapper.getTop100MovieIdList().forEach(item -> {
            Double score = item.getScore();
            if (ObjectUtils.isEmpty(score)) {
                score = 0.0;
            }
            redisService.zAdd(RANK_TOP100, score, item.getId());
        });
        // 初始化今日票房
        baseMapper.getTodayGross().forEach(item -> redisService.zAdd(RANK_TODAY_GROSS, item.getScore(), item.getId()));
    }
}
