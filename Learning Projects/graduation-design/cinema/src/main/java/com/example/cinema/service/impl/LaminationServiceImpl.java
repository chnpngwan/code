package com.example.cinema.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.entity.*;
import com.example.cinema.mapper.*;
import com.example.cinema.service.LaminationService;
import com.example.cinema.service.MovieService;
import com.example.cinema.utils.BeanCopyUtil;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class LaminationServiceImpl extends ServiceImpl<LaminationMapper, Lamination> implements LaminationService {

    @Autowired
    private MovieMapper movieMapper;
    @Autowired
    private HallMapper hallMapper;
    @Autowired
    private CinemaMapper cinemaMapper;
    @Autowired
    private MovieService movieService;
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public PageResult<LaminationVO> getLaminationPage(String keywords) {
        List<LaminationVO> laminationPage = baseMapper.getLaminationPage(keywords,
                PageUtil.getLimitCurrent(), PageUtil.getSize());
        Long total = baseMapper.getLaminationPageTotal(keywords);
        return new PageResult<>(laminationPage, total);
    }

    @Override
    public List<LaminationDetailVO> getLaminationDetail(Integer cinemaId, Integer movieId) {
        List<Lamination> laminationList = baseMapper.selectList(new LambdaQueryWrapper<Lamination>()
                .eq(Lamination::getCinemaId, cinemaId)
                .eq(Lamination::getMovieId, movieId)
                .ge(Lamination::getStartDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))));
        return laminationList.stream().map(lamination -> {
            LaminationDetailVO laminationDetailVO = BeanCopyUtil.copyObject(lamination, LaminationDetailVO.class);
            Hall hall = hallMapper.selectById(lamination.getHallId());
            HallSimpleVO hallSimpleVO = BeanCopyUtil.copyObject(hall, HallSimpleVO.class);
            laminationDetailVO.setHall(hallSimpleVO);
            return laminationDetailVO;
        }).collect(Collectors.toList());
    }

    @Override
    public LaminationOrderVO getLaminationOrderById(Integer laminationId) {
        Lamination lamination = baseMapper.selectById(laminationId);
        if (Objects.isNull(lamination)) {
            return new LaminationOrderVO();
        }
        LaminationOrderVO laminationOrderVO = BeanCopyUtil.copyObject(lamination, LaminationOrderVO.class);
        List<MovieVO> movieVOList = movieService
                .getMovieVOListByMovieIdList(Collections.singletonList(lamination.getMovieId()));
        Cinema cinema = cinemaMapper.selectById(lamination.getCinemaId());
        CinemaSimpleVO cinemaSimpleVO = BeanCopyUtil.copyObject(cinema, CinemaSimpleVO.class);
        Hall hall = hallMapper.selectById(lamination.getHallId());
        HallSimpleVO hallSimpleVO = BeanCopyUtil.copyObject(hall, HallSimpleVO.class);
        laminationOrderVO.setCinema(cinemaSimpleVO);
        laminationOrderVO.setMovie(movieVOList.get(0));
        laminationOrderVO.setHall(hallSimpleVO);
        return laminationOrderVO;
    }

    @Override
    public String getSeatsByLaminationId(Integer laminationId) {
        return baseMapper.selectById(laminationId).getSeatJson();
    }

    @Override
    public boolean saveOrUpdateLamination(Lamination lamination) {
        // 计算结束时间
        Movie movie = movieMapper.selectOne(new LambdaQueryWrapper<Movie>()
                .eq(Movie::getId, lamination.getMovieId()));
        String endTime = getEndTime(lamination.getStartTime(), movie.getTime());
        lamination.setEndTime(endTime);
        // 检查同一日期、影院、影厅区间是否存在碰撞
        List<Lamination> laminationList = baseMapper.selectList(new LambdaQueryWrapper<Lamination>()
                .eq(Lamination::getCinemaId, lamination.getCinemaId())
                .eq(Lamination::getHallId, lamination.getHallId())
                .eq(Lamination::getStartDate, lamination.getStartDate()));
        List<Integer> startTimeList = getIntegerTimeListByStringTimeList(laminationList.stream()
                .filter(item -> Objects.isNull(lamination.getId()) || !lamination.getId().equals(item.getId()))
                .map(Lamination::getStartTime)
                .collect(Collectors.toList()));
        List<Integer> endTimeList = getIntegerTimeListByStringTimeList(laminationList.stream()
                .filter(item -> Objects.isNull(lamination.getId()) || !lamination.getId().equals(item.getId()))
                .map(Lamination::getEndTime)
                .collect(Collectors.toList()));
        int start = getIntegerTimeByString(lamination.getStartTime());
        int end = getIntegerTimeByString(lamination.getEndTime());
        for (int i = 0; i < startTimeList.size(); i++) {
            if (start <= startTimeList.get(i) && startTimeList.get(i) <= end) {
                throw new RuntimeException("时间安排存在冲突");
            }
            if (start <= endTimeList.get(i) && endTimeList.get(i) <= end) {
                throw new RuntimeException("时间安排存在冲突");
            }
        }
        // 检查昨天的结束场次里面结束时间是否含有+1
        Date yesterday = DateUtil.offsetDay(lamination.getStartDate(), -1);
        List<Lamination> yesterdayLaminationList = baseMapper.selectList(new LambdaQueryWrapper<Lamination>()
                .eq(Lamination::getCinemaId, lamination.getCinemaId())
                .eq(Lamination::getHallId, lamination.getHallId())
                .eq(Lamination::getStartDate, yesterday)
                .like(Lamination::getEndTime, " +1"));
        if (!CollectionUtil.isEmpty(yesterdayLaminationList)) {
            List<Integer> timeList = yesterdayLaminationList.stream()
                    .map(i -> getIntegerTimeByString(i.getEndTime()))
                    .collect(Collectors.toList());
            for (Integer time : timeList) {
                if (start <= time && time <= end) {
                    throw new RuntimeException("时间安排存在冲突");
                }
            }
        }
        if (Objects.isNull(lamination.getId())) {
            lamination.setSeatJson(hallMapper.selectById(lamination.getHallId()).getSeatJson());
        }
        return this.saveOrUpdate(lamination);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteLamination(List<Integer> ids) {
        ids.forEach(id -> {
            List<Order> orderList = orderMapper.selectList(new LambdaQueryWrapper<Order>()
                    .eq(Order::getLaminationId, id));
            if (!CollectionUtils.isEmpty(orderList)) {
                throw new RuntimeException("该场次中存在订单无法删除！");
            }
            baseMapper.deleteById(id);
        });
        return true;
    }

    /**
     * 根据开始时间的电影时长获取结束时间
     * @param startTime 开始时间
     * @param time 电影时长
     * @return 结束时间
     */
    private String getEndTime(String startTime, Integer time) {
        String[] data = startTime.split(":");
        int hour = Integer.parseInt(data[0]);
        int min = Integer.parseInt(data[1]) + time;
        hour += min / 60;
        min %= 60;
        String minStr = min + "";
        if (min < 10) {
            minStr = "0" + min;
        }
        if (hour >= 24) {
            return (hour - 24) + ":" + minStr + " +1";
        }
        return hour + ":" + minStr;
    }

    /**
     * 将String类型的时间转化为Integer便于比较
     * @param time 时间
     * @return 总的分钟
     */
    private Integer getIntegerTimeByString(String time) {
        String[] split = time.split(":");
        if (split[1].contains(" ")) {
            split[1] = split[1].substring(0, split[1].indexOf(' '));
            return Integer.parseInt(split[0]) * 60 + Integer.parseInt(split[1]) + 24 * 60;
        }
        return Integer.parseInt(split[0]) * 60 + Integer.parseInt(split[1]);
    }

    private List<Integer> getIntegerTimeListByStringTimeList(List<String> timeList) {
        return timeList.stream()
                .map(this::getIntegerTimeByString)
                .collect(Collectors.toList());
    }
}
