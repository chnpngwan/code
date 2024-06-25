package com.example.cinema.service.impl;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.cinema.constant.MailConstant;
import com.example.cinema.constant.RedisPreFixConstant;
import com.example.cinema.entity.Movie;
import com.example.cinema.entity.Order;
import com.example.cinema.mapper.*;
import com.example.cinema.service.CommonService;
import com.example.cinema.service.MailService;
import com.example.cinema.service.RedisService;
import com.example.cinema.utils.BeanCopyUtil;
import com.example.cinema.utils.CommonUtil;
import com.example.cinema.vo.HomePageVO;
import com.example.cinema.vo.MovieCategoryVO;
import com.example.cinema.vo.MovieViewVO;
import com.example.cinema.vo.WeekGrossVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class CommonServiceImpl implements CommonService {
    @Autowired
    private RedisService redisService;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private MovieMapper movieMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private MailService mailService;
    @Value("${spring.redis.expire}")
    private long time;

    @Override
    public String getToken() {
        String uuid = UUID.randomUUID().toString();
        redisService.sAdd(RedisPreFixConstant.ORDER_TOKEN, uuid);
        return uuid;
    }

    @Override
    public HomePageVO getHomePageVO() {
        Long userCount = userMapper.selectCount(null);
        Long commentCount = commentMapper.selectCount(null);
        Long movieCount = movieMapper.selectCount(null);
        List<WeekGrossVO> weekGrossVOList = new ArrayList<>();
        for (int i = 0; i < 7; i++) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String date = dateFormat.format(DateUtil.offsetDay(new Date(), -i).toJdkDate());
            List<Double> grossList = orderMapper.getOrderListByDate(date).stream()
                    .map(Order::getTotalPrice)
                    .collect(Collectors.toList());
            BigDecimal totalGross = new BigDecimal("0");
            for (Double gross : grossList) {
                totalGross = totalGross.add(new BigDecimal(gross.toString()));
            }
            WeekGrossVO build = WeekGrossVO.builder()
                    .day(date)
                    .gross(totalGross.doubleValue())
                    .build();
            weekGrossVOList.add(build);
        }
        Page<Movie> moviePage = movieMapper.selectPage(new Page<Movie>(0L, 5L), new LambdaQueryWrapper<Movie>()
                .orderByDesc(Movie::getViewCount));
        List<MovieViewVO> movieViewVOList = moviePage.getRecords().stream()
                .map(movie -> BeanCopyUtil.copyObject(movie, MovieViewVO.class))
                .collect(Collectors.toList());
        List<MovieCategoryVO> movieCategoryVOList = categoryMapper.getMovieCategoryVOList();
        return HomePageVO.builder()
                .viewCount((Integer) redisService.get(RedisPreFixConstant.CINEMA_VIEW_COUNT))
                .userCount(userCount)
                .movieCount(movieCount)
                .commentCount(commentCount)
                .weekGrossList(weekGrossVOList)
                .movieViewVOList(movieViewVOList)
                .movieCategoryVOList(movieCategoryVOList)
                .build();
    }

    @Override
    public void getForgetCode(String to) {
        String code = CommonUtil.getCode();
        redisService.set(RedisPreFixConstant.FORGET + ":" + to, code, time);
        String text = String.format(MailConstant.TEXT, code, time / 60);
        mailService.sendMessage(to, MailConstant.SUBJECT_FORGET, text);
    }

    @Override
    public void incrViewCount() {
        redisService.incr(RedisPreFixConstant.CINEMA_VIEW_COUNT);
    }

    @Override
    public void getRegisterCode(String to) {
        String code = CommonUtil.getCode();
        redisService.set(RedisPreFixConstant.REGISTER + ":" + to, code, time);
        String text = String.format(MailConstant.TEXT, code, time / 60);
        mailService.sendMessage(to, MailConstant.SUBJECT_REGISTER, text);
    }
}
