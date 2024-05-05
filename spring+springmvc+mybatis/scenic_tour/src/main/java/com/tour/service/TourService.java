package com.tour.service;

import com.tour.model.Tour;

import java.util.List;

/**
 * ProjectName:  ssm
 * PackageName:  com.tour.service
 * ClassName:    TourService
 *
 * @Author chnpngwng
 * @Date 2023 06 19 16 00
 **/


public interface TourService {
    List<Tour> queryThings(String name, String sex, int type);

    //删除
    public int deleteById(int id);

    //添加
    public int insertTour(Tour tour);
}
