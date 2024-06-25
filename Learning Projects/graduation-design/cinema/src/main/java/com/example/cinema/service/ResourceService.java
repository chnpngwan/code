package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.dto.ResourceDTO;
import com.example.cinema.entity.Resource;
import com.example.cinema.vo.LabelOptionVO;
import com.example.cinema.vo.ResourceVO;

import java.util.List;

public interface ResourceService extends IService<Resource> {
    void saveOrUpdateResource(ResourceDTO resourceDTO);
    void deleteResource(Integer resourceId);
    List<ResourceVO> resourceList(String keywords);
    List<LabelOptionVO> resourceOptionList();

}
