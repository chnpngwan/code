package xyz.hjzyhh.back_end.admin.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.hjzyhh.back_end.admin.PO.UserSelector;
import xyz.hjzyhh.back_end.admin.mapper.UserAdminMapper;
import xyz.hjzyhh.back_end.admin.service.UserAdminService;
import xyz.hjzyhh.back_end.pojo.UserPO;

import java.util.List;

@Service
public class UserAdminserviceImpl implements UserAdminService {

    @Autowired
    UserAdminMapper userAdminMapper;

    @Override
    public List<UserPO> getUsers(long offset, int limit) {
        return userAdminMapper.getUsers(limit, offset);
    }

    @Override
    public List<UserPO> getUsersBySelector(UserSelector userSelector,int limit ,long offset) {
        return userAdminMapper.getUserBySeletor(userSelector,limit, offset);
    }

    @Override
    public int ban(long id) {
        return userAdminMapper.ban(id);
    }

    @Override
    public int unban(long id) {
        return userAdminMapper.unban(id);
    }

    @Override
    public int delete(long id) {
        return userAdminMapper.delete(id);
    }

    @Override
    public int undelete(long id) {
        return userAdminMapper.undelete(id);
    }

}
