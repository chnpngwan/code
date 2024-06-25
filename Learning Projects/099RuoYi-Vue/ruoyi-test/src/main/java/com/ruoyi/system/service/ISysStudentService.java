package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysStudent;

/**
 * 学生列表Service接口
 * 
 * @author 李博文
 * @date 2024-03-16
 */
public interface ISysStudentService 
{
    /**
     * 查询学生列表
     * 
     * @param studentId 学生列表主键
     * @return 学生列表
     */
    public SysStudent selectSysStudentByStudentId(Long studentId);

    /**
     * 查询学生列表列表
     * 
     * @param sysStudent 学生列表
     * @return 学生列表集合
     */
    public List<SysStudent> selectSysStudentList(SysStudent sysStudent);

    /**
     * 新增学生列表
     * 
     * @param sysStudent 学生列表
     * @return 结果
     */
    public int insertSysStudent(SysStudent sysStudent);

    /**
     * 修改学生列表
     * 
     * @param sysStudent 学生列表
     * @return 结果
     */
    public int updateSysStudent(SysStudent sysStudent);

    /**
     * 批量删除学生列表
     * 
     * @param studentIds 需要删除的学生列表主键集合
     * @return 结果
     */
    public int deleteSysStudentByStudentIds(Long[] studentIds);

    /**
     * 删除学生列表信息
     * 
     * @param studentId 学生列表主键
     * @return 结果
     */
    public int deleteSysStudentByStudentId(Long studentId);
}
