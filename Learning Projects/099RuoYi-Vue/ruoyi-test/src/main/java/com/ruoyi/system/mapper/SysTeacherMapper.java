package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysTeacher;

/**
 * 老师列表Mapper接口
 * 
 * @author 李博文
 * @date 2024-03-16
 */
public interface SysTeacherMapper 
{
    /**
     * 查询老师列表
     * 
     * @param teacherId 老师列表主键
     * @return 老师列表
     */
    public SysTeacher selectSysTeacherByTeacherId(Long teacherId);

    /**
     * 查询老师列表列表
     * 
     * @param sysTeacher 老师列表
     * @return 老师列表集合
     */
    public List<SysTeacher> selectSysTeacherList(SysTeacher sysTeacher);

    /**
     * 新增老师列表
     * 
     * @param sysTeacher 老师列表
     * @return 结果
     */
    public int insertSysTeacher(SysTeacher sysTeacher);

    /**
     * 修改老师列表
     * 
     * @param sysTeacher 老师列表
     * @return 结果
     */
    public int updateSysTeacher(SysTeacher sysTeacher);

    /**
     * 删除老师列表
     * 
     * @param teacherId 老师列表主键
     * @return 结果
     */
    public int deleteSysTeacherByTeacherId(Long teacherId);

    /**
     * 批量删除老师列表
     * 
     * @param teacherIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysTeacherByTeacherIds(Long[] teacherIds);
}
