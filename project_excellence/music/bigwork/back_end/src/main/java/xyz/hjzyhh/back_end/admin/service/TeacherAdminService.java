package xyz.hjzyhh.back_end.admin.service;

import xyz.hjzyhh.back_end.pojo.AuthTeacherPO;

import java.util.List;

public interface TeacherAdminService {
    List<AuthTeacherPO> get(int aid);
    int pass(long id, int aid);
    int unpass(long id,int aid);
    int exit(int aid);
}
