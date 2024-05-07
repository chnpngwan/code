package xyz.hjzyhh.back_end.admin.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.hjzyhh.back_end.admin.PO.AdminPO;
import xyz.hjzyhh.back_end.admin.mapper.AdminMapper;
import xyz.hjzyhh.back_end.admin.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;

    @Override
    public AdminPO login(String username, String password) {
        return adminMapper.login(username,password);
    }

    @Override
    public AdminPO getById(int aid) {
        return adminMapper.getById(aid);
    }
}
