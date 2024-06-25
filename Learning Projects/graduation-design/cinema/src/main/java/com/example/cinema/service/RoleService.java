package com.example.cinema.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.dto.RoleAbleDTO;
import com.example.cinema.dto.RoleDTO;
import com.example.cinema.entity.Role;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.RoleSimpleVO;
import com.example.cinema.vo.RoleVO;

import java.util.List;


public interface RoleService extends IService<Role> {
    PageResult<RoleVO> getRolePage(String keywords);
    List<RoleSimpleVO> getRoleList();
    Boolean updateAbleFlag(RoleAbleDTO roleAbleDTO);
    Boolean saveOrUpdateRole(RoleDTO roleDTO);
    Boolean deleteRole(List<Integer> roleIdList);
}
