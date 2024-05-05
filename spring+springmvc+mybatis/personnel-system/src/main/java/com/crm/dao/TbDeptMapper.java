package com.crm.dao;

import com.crm.entity.TbDept;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.crm.dao
 * ClassName:     TbDeptMapper
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 24 10 29
 **/
public interface TbDeptMapper {
    int deleteByPrimaryKey(Integer deptId);

    int insert(TbDept record);

    TbDept selectByPrimaryKey(Integer deptId);

    List<TbDept> selectAll();

    int updateByPrimaryKey(TbDept record);
}
