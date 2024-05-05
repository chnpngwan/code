package com.szpx.service.software;

import com.github.pagehelper.PageInfo;;
import com.szpx.entity.software.ProjectTask;
import com.szpx.entity.software.StuProjectBasicInfo;
import com.szpx.utils.pageutils.PageUtil;

import java.util.List;

public interface ProjectService {
    PageInfo<StuProjectBasicInfo> getBasicProjectInfo(PageUtil pageUtil);

    List<ProjectTask> getAllProjectTaskByStuId(long stuId);
}
