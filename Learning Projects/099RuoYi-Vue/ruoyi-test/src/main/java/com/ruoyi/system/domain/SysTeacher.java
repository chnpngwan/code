package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 老师列表对象 sys_teacher
 * 
 * @author 李博文
 * @date 2024-03-16
 */
public class SysTeacher extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long teacherId;

    /** 老师姓名 */
    @Excel(name = "老师姓名")
    private String teacherName;

    /** 老师性别 */
    @Excel(name = "老师性别")
    private String teacherSex;

    /** 老师头像 */
    @Excel(name = "老师头像")
    private String teacherImg;

    public void setTeacherId(Long teacherId) 
    {
        this.teacherId = teacherId;
    }

    public Long getTeacherId() 
    {
        return teacherId;
    }
    public void setTeacherName(String teacherName) 
    {
        this.teacherName = teacherName;
    }

    public String getTeacherName() 
    {
        return teacherName;
    }
    public void setTeacherSex(String teacherSex) 
    {
        this.teacherSex = teacherSex;
    }

    public String getTeacherSex() 
    {
        return teacherSex;
    }
    public void setTeacherImg(String teacherImg) 
    {
        this.teacherImg = teacherImg;
    }

    public String getTeacherImg() 
    {
        return teacherImg;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("teacherId", getTeacherId())
            .append("teacherName", getTeacherName())
            .append("teacherSex", getTeacherSex())
            .append("teacherImg", getTeacherImg())
            .append("remark", getRemark())
            .toString();
    }
}
