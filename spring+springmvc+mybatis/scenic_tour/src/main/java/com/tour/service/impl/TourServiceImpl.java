package com.tour.service.impl;

import com.tour.mapper.TourMapper;
import com.tour.model.Tour;
import com.tour.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ProjectName:  ssm
 * PackageName:  com.tour.service.impl
 * ClassName:    TourServiceImpl
 *
 * @Author chnpngwng
 * @Date 2023 06 19 16 01
 **/

@Service
public class TourServiceImpl implements TourService {
    @Autowired
    private TourMapper tourMapper;
    @Override
    public List<Tour> queryThings(String name, String sex, int type) {
        return tourMapper.queryThings(name,sex,type);
    }

    @Override
    public int deleteById(int id) {
        return tourMapper.deleteById(id);
    }

    @Override
    public int insertTour(Tour tour) {
        return tourMapper.insertTour(tour);
    }
}
