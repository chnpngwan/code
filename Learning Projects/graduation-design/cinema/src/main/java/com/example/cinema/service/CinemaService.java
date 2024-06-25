package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.dto.CinemaServeDTO;
import com.example.cinema.entity.Cinema;
import com.example.cinema.vo.*;

import java.util.List;

public interface CinemaService extends IService<Cinema> {
    PageResult<CinemaVO> getCinemaPage(String keywords);
    PageResult<CinemaFrontVO> getCinemaPageByCondition(Integer brandId, Integer districtId,
                                                       Integer typeId, Integer serveId);
    PageResult<CinemaFrontVO> search(String keywords);
    CinemaDetailVO getCinemaDetailByCinemaId(Integer cinemaId);
    List<CinemaServeVO> getCinemaServe(Integer cinemaId);
    List<CinemaSimpleVO> getCinemaList();
    List<CinemaHallVO> getCinemaHall(Integer cinemaId);
    boolean saveOrUpdateCinemaServe(CinemaServeDTO cinemaServeDTO);
    boolean deleteCinemaServe(List<Integer> ids);
}
