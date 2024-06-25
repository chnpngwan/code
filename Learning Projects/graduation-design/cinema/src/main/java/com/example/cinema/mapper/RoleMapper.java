package com.example.cinema.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.cinema.dto.ResourceRoleDTO;
import com.example.cinema.dto.RoleDTO;
import com.example.cinema.entity.Role;
import com.example.cinema.vo.RoleVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RoleMapper extends BaseMapper<Role> {
    List<ResourceRoleDTO> getResourceRoleList();
    List<String> getRoleListByUserId(Integer userId);
}
