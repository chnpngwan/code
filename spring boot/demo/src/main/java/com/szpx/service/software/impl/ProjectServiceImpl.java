package com.szpx.service.software.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.szpx.entity.software.ProjectTask;
import com.szpx.entity.software.StuProjectBasicInfo;
import com.szpx.mapper.software.ProjectMapper;
import com.szpx.service.software.ProjectService;
import com.szpx.utils.pageutils.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Resource
    ProjectMapper projectMapper;

    @Override
    public PageInfo<StuProjectBasicInfo> getBasicProjectInfo(PageUtil pageUtil) {
        PageHelper.startPage(pageUtil.getPageNum(), pageUtil.getPageSize());
        return new PageInfo<StuProjectBasicInfo>(projectMapper.getBasicProjectInfo(pageUtil));
    }

    @Override
    public List<ProjectTask> getAllProjectTaskByStuId(long stuId) {
        return projectMapper.getAllProjectTaskByStuId(stuId);
    }
}
