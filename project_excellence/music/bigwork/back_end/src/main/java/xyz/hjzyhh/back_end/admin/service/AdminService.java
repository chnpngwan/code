package xyz.hjzyhh.back_end.admin.service;

import xyz.hjzyhh.back_end.admin.PO.AdminPO;

public interface AdminService {
    public AdminPO login(String username, String password);
    public AdminPO getById(int aid);
}
