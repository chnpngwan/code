package xyz.hjzyhh.back_end.admin.service;

import xyz.hjzyhh.back_end.admin.PO.UserSelector;
import xyz.hjzyhh.back_end.pojo.UserPO;

import java.util.List;

public interface UserAdminService {
    List<UserPO> getUsers(long offset, int limit);
    List<UserPO> getUsersBySelector(UserSelector userSelector,int limit, long offset);
    int ban(long id);
    int unban(long id);
    int delete(long id);
    int undelete(long id);
}
