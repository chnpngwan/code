package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysTeacherMapper;
import com.ruoyi.system.domain.SysTeacher;
import com.ruoyi.system.service.ISysTeacherService;

/**
 * 老师列表Service业务层处理
 * 
 * @author 李博文
 * @date 2024-03-16
 */
@Service
public class SysTeacherServiceImpl implements ISysTeacherService 
{
    @Autowired
    private SysTeacherMapper sysTeacherMapper;

    /**
     * 查询老师列表
     * 
     * @param teacherId 老师列表主键
     * @return 老师列表
     */
    @Override
    public SysTeacher selectSysTeacherByTeacherId(Long teacherId)
    {
        return sysTeacherMapper.selectSysTeacherByTeacherId(teacherId);
    }

    /**
     * 查询老师列表列表
     * 
     * @param sysTeacher 老师列表
     * @return 老师列表
     */
    @Override
    public List<SysTeacher> selectSysTeacherList(SysTeacher sysTeacher)
    {
        return sysTeacherMapper.selectSysTeacherList(sysTeacher);
    }

    /**
     * 新增老师列表
     * 
     * @param sysTeacher 老师列表
     * @return 结果
     */
    @Override
    public int insertSysTeacher(SysTeacher sysTeacher)
    {
        return sysTeacherMapper.insertSysTeacher(sysTeacher);
    }

    /**
     * 修改老师列表
     * 
     * @param sysTeacher 老师列表
     * @return 结果
     */
    @Override
    public int updateSysTeacher(SysTeacher sysTeacher)
    {
        return sysTeacherMapper.updateSysTeacher(sysTeacher);
    }

    /**
     * 批量删除老师列表
     * 
     * @param teacherIds 需要删除的老师列表主键
     * @return 结果
     */
    @Override
    public int deleteSysTeacherByTeacherIds(Long[] teacherIds)
    {
        return sysTeacherMapper.deleteSysTeacherByTeacherIds(teacherIds);
    }

    /**
     * 删除老师列表信息
     * 
     * @param teacherId 老师列表主键
     * @return 结果
     */
    @Override
    public int deleteSysTeacherByTeacherId(Long teacherId)
    {
        return sysTeacherMapper.deleteSysTeacherByTeacherId(teacherId);
    }
}
