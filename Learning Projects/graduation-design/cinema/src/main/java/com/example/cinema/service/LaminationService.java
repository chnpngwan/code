package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.entity.Lamination;
import com.example.cinema.vo.LaminationDetailVO;
import com.example.cinema.vo.LaminationOrderVO;
import com.example.cinema.vo.LaminationVO;
import com.example.cinema.vo.PageResult;

import java.util.List;

public interface LaminationService extends IService<Lamination> {
    PageResult<LaminationVO> getLaminationPage(String keywords);
    List<LaminationDetailVO> getLaminationDetail(Integer cinemaId, Integer movieId);
    LaminationOrderVO getLaminationOrderById(Integer laminationId);
    String getSeatsByLaminationId(Integer laminationId);
    boolean saveOrUpdateLamination(Lamination lamination);
    boolean deleteLamination(List<Integer> ids);
}
