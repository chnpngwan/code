package com.example.cinema.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.dto.HallStateDTO;
import com.example.cinema.dto.HallSeatDTO;
import com.example.cinema.entity.Hall;
import com.example.cinema.mapper.HallMapper;
import com.example.cinema.service.HallService;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.HallSimpleVO;
import com.example.cinema.vo.HallVO;
import com.example.cinema.vo.PageResult;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class HallServiceImpl extends ServiceImpl<HallMapper, Hall> implements HallService {
    @Override
    public PageResult<HallVO> getHallPage(String keywords) {
        Long total = baseMapper.getHallVOPageTotal(keywords).longValue();
        List<HallVO> hallVOPage = baseMapper.getHallVOPage(keywords,
                PageUtil.getLimitCurrent(),
                PageUtil.getSize());
        return new PageResult<>(hallVOPage, total);
    }

    @Override
    public boolean updateSeatById(HallSeatDTO hallSeatDTO) {
        Hall hall = baseMapper.selectOne(new LambdaQueryWrapper<Hall>()
                .eq(Hall::getId, hallSeatDTO.getId()));
        if (Objects.isNull(hall)) {
            throw new RuntimeException("服务端错误");
        }
        hall.setSeatJson(hallSeatDTO.getSeatJson());
        return baseMapper.updateById(hall) == 1;
    }

    @Override
    public boolean updateStateById(HallStateDTO hallStateDTO) {
        Hall hall = baseMapper.selectOne(new LambdaQueryWrapper<Hall>()
                .eq(Hall::getId, hallStateDTO.getId()));
        hall.setState(hallStateDTO.getState());
        return baseMapper.updateById(hall) == 1;
    }

    @Override
    public boolean saveOrUpdateHall(Hall hall) {
        // 新增
        if (Objects.isNull(hall.getId())) {
            return this.saveOrUpdate(hall);
        }
        // 更新要注意检查seatRow、seatCol是否改变，若改变则更新seatJson
        Hall oldHall = baseMapper.selectOne(new LambdaQueryWrapper<Hall>()
                .eq(Hall::getId, hall.getId()));
        if (oldHall.getSeatRow().equals(hall.getSeatRow())
                && oldHall.getSeatCol().equals(hall.getSeatCol())) {
            // 不进行改变;
            hall.setSeatJson(oldHall.getSeatJson());
        }
        return this.saveOrUpdate(hall);
    }

    @Override
    public List<HallSimpleVO> getHallList(Integer cinemaId) {
        return this.list(new LambdaQueryWrapper<Hall>()
                        .eq(Hall::getCinemaId, cinemaId)
                        .eq(Hall::getState, 1)
                ).stream().map(i -> HallSimpleVO.builder()
                        .id(i.getId())
                        .name(i.getName())
                        .build())
                .collect(Collectors.toList());
    }
}
