package com.example.cinema.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.cinema.dto.CinemaServeDTO;
import com.example.cinema.entity.*;
import com.example.cinema.mapper.*;
import com.example.cinema.service.CinemaService;
import com.example.cinema.service.MovieService;
import com.example.cinema.utils.BeanCopyUtil;
import com.example.cinema.utils.PageUtil;
import com.example.cinema.vo.*;
import javafx.scene.effect.SepiaTone;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class CinemaServiceImpl extends ServiceImpl<CinemaMapper, Cinema> implements CinemaService {

    @Autowired
    private CinemaServeMapper cinemaServeMapper;
    @Autowired
    private ServeMapper serveMapper;
    @Autowired
    private HallMapper hallMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private BrandMapper brandMapper;
    @Autowired
    private DistrictMapper districtMapper;
    @Autowired
    private LaminationMapper laminationMapper;
    @Autowired
    private MovieService movieService;

    @Override
    public PageResult<CinemaVO> getCinemaPage(String keywords) {
        List<CinemaVO> cinemaPage = baseMapper.getCinemaPage(keywords,
                PageUtil.getLimitCurrent(), PageUtil.getSize());
        Long total = baseMapper.getCinemaPageTotal(keywords);
        return new PageResult<>(cinemaPage, total);
    }

    @Override
    public PageResult<CinemaFrontVO> getCinemaPageByCondition(Integer brandId, Integer districtId, Integer typeId, Integer serveId) {
        List<Integer> cinemaIdList = baseMapper.getCinemaIdByCondition(PageUtil.getLimitCurrent(), PageUtil.getSize(),
                brandId, districtId, typeId, serveId);
        Long total = baseMapper.getCinemaIdTotalByCondition(brandId, districtId, typeId, serveId);
        List<CinemaFrontVO> cinemaFrontVOList = getCinemaFrontVOByCinemaId(cinemaIdList);
        return new PageResult<>(cinemaFrontVOList, total);
    }

    @Override
    public PageResult<CinemaFrontVO> search(String keywords) {
        Page<Cinema> page = new Page<>(PageUtil.getCurrent(), PageUtil.getSize());
        Page<Cinema> cinemaPage = baseMapper.selectPage(page, new LambdaQueryWrapper<Cinema>()
                .like(!StrUtil.isEmpty(keywords), Cinema::getName, keywords)
                .or()
                .like(!StrUtil.isEmpty(keywords), Cinema::getAddress, keywords));
        List<Integer> cinemaIdList = cinemaPage.getRecords().stream()
                .map(Cinema::getId)
                .collect(Collectors.toList());
        List<CinemaFrontVO> cinemaFrontVOList = getCinemaFrontVOByCinemaId(cinemaIdList);
        return new PageResult<>(cinemaFrontVOList, cinemaPage.getTotal());
    }

    @Override
    public CinemaDetailVO getCinemaDetailByCinemaId(Integer cinemaId) {
        Cinema cinema = baseMapper.selectById(cinemaId);
        CinemaDetailVO cinemaDetailVO = BeanCopyUtil.copyObject(cinema, CinemaDetailVO.class);
        List<CinemaServeVO> serveList = getCinemaServe(cinemaId);
        Brand brand = brandMapper.selectById(cinema.getBrandId());
        BrandVO brandVO = BeanCopyUtil.copyObject(brand, BrandVO.class);
        District district = districtMapper.selectById(cinema.getDistrictId());
        DistrictVO districtVO = BeanCopyUtil.copyObject(district, DistrictVO.class);
        List<Lamination> laminationList = laminationMapper.selectList(new LambdaQueryWrapper<Lamination>()
                .eq(Lamination::getCinemaId, cinemaId)
                .ge(Lamination::getStartDate, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))));
        Set<Integer> movieIdSet = laminationList.stream()
                .map(Lamination::getMovieId)
                .collect(Collectors.toSet());
        List<MovieFrontVO> movieList = movieService.getMovieFrOntVOByMovieId(new ArrayList<>(movieIdSet));
        cinemaDetailVO.setBrand(brandVO);
        cinemaDetailVO.setDistrict(districtVO);
        cinemaDetailVO.setServeList(serveList);
        cinemaDetailVO.setMovieList(movieList);
        return cinemaDetailVO;
    }

    @Override
    public List<CinemaServeVO> getCinemaServe(Integer cinemaId) {
        List<CinemaServe> cinemaServeList = cinemaServeMapper.selectList(new LambdaQueryWrapper<CinemaServe>()
                .eq(CinemaServe::getCinemaId, cinemaId));
        return cinemaServeList.stream().map(cinemaServe -> {
            Serve serve = serveMapper.selectOne(new LambdaQueryWrapper<Serve>()
                    .eq(Serve::getId, cinemaServe.getServeId()));
            return CinemaServeVO.builder()
                    .id(cinemaServe.getId())
                    .information(cinemaServe.getInformation())
                    .name(serve.getName())
                    .build();
        }).collect(Collectors.toList());
    }

    @Override
    public List<CinemaSimpleVO> getCinemaList() {
        return this.list().stream().map(i -> CinemaSimpleVO.builder()
                    .id(i.getId())
                    .name(i.getName())
                    .build())
                .collect(Collectors.toList());
    }

    @Override
    public List<CinemaHallVO> getCinemaHall(Integer cinemaId) {
        List<Hall> hallList = hallMapper.selectList(new LambdaQueryWrapper<Hall>()
                .eq(Hall::getCinemaId, cinemaId));
        return hallList.stream().map(hall -> {
            Type type = typeMapper.selectOne(new LambdaQueryWrapper<Type>()
                    .eq(Type::getId, hall.getTypeId()));
            TypeVO typeVO = BeanCopyUtil.copyObject(type, TypeVO.class);
            return CinemaHallVO.builder()
                    .id(hall.getId())
                    .type(typeVO)
                    .name(hall.getName())
                    .state(hall.getState())
                    .seatCol(hall.getSeatCol())
                    .seatRow(hall.getSeatRow())
                    .seatJson(hall.getSeatJson())
                    .build();
        }).collect(Collectors.toList());
    }

    @Override
    public boolean saveOrUpdateCinemaServe(CinemaServeDTO cinemaServeDTO) {
        CinemaServe cinemaServe = BeanCopyUtil.copyObject(cinemaServeDTO, CinemaServe.class);
        if (Objects.isNull(cinemaServe.getId())) {
            return cinemaServeMapper.insert(cinemaServe) == 1;
        }
        return cinemaServeMapper.updateById(cinemaServe) == 1;
    }

    @Override
    public boolean deleteCinemaServe(List<Integer> ids) {
        return cinemaServeMapper.deleteBatchIds(ids) == ids.size();
    }

    private List<CinemaFrontVO> getCinemaFrontVOByCinemaId(List<Integer> cinemaIdList) {
        return cinemaIdList.stream().map(cinemaId -> {
            Cinema cinema = baseMapper.selectById(cinemaId);
            CinemaFrontVO cinemaFrontVO = BeanCopyUtil.copyObject(cinema, CinemaFrontVO.class);
            List<CinemaServe> cinemaServeList = cinemaServeMapper.selectList(new LambdaQueryWrapper<CinemaServe>()
                    .eq(CinemaServe::getCinemaId, cinemaId));
            List<ServeVO> serveVOList = cinemaServeList.stream().map(i -> {
                Serve serve = serveMapper.selectById(i.getServeId());
                return BeanCopyUtil.copyObject(serve, ServeVO.class);
            }).collect(Collectors.toList());
            List<Hall> hallList = hallMapper.selectList(new LambdaQueryWrapper<Hall>()
                    .eq(Hall::getCinemaId, cinemaId));
            List<TypeVO> typeVOList = hallList.stream().map(i -> {
                Type type = typeMapper.selectById(i.getTypeId());
                return BeanCopyUtil.copyObject(type, TypeVO.class);
            }).collect(Collectors.toList());
            cinemaFrontVO.setServeList(serveVOList);
            cinemaFrontVO.setTypeList(typeVOList);
            return cinemaFrontVO;
        }).collect(Collectors.toList());
    }
}
