package xyz.hjzyhh.back_end.service;

import org.springframework.web.multipart.MultipartFile;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.vo.UserVO;

/**
 *  针对功能实现方法
 *      增删改查
 */
public interface UserService {
    String getScurityPassword(String password, String salt);
    boolean registUser(String username, String password);
    boolean deleteUser(Long id);
    UserVO modifyUser(UserVO user);
    boolean modifyPassword(long id, String old_password, String new_password);
    UserVO login(String username, String password);
    UserPO findOne(Long id);
    String uploadAvatar(MultipartFile avatar,long id);
}
