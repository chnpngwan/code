package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.dto.HallStateDTO;
import com.example.cinema.dto.HallSeatDTO;
import com.example.cinema.entity.Hall;
import com.example.cinema.vo.HallSimpleVO;
import com.example.cinema.vo.HallVO;
import com.example.cinema.vo.PageResult;

import java.util.List;

public interface HallService extends IService<Hall> {
    PageResult<HallVO> getHallPage(String keywords);
    boolean updateSeatById(HallSeatDTO hallSeatDTO);
    boolean updateStateById(HallStateDTO hallStateDTO);
    boolean saveOrUpdateHall(Hall hall);
    List<HallSimpleVO> getHallList(Integer cinemaId);
}
