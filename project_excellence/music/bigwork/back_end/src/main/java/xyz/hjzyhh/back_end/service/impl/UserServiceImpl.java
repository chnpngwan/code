package xyz.hjzyhh.back_end.service.impl;

import org.apache.catalina.core.ApplicationContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.web.multipart.MultipartFile;
import xyz.hjzyhh.back_end.mapper.UserMapper;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.service.UserService;
import xyz.hjzyhh.back_end.utils.FileUtils;
import xyz.hjzyhh.back_end.utils.RandomUtil;
import xyz.hjzyhh.back_end.utils.RedisUtil;
import xyz.hjzyhh.back_end.utils.VOUtil;
import xyz.hjzyhh.back_end.vo.UserVO;

import javax.servlet.ServletContext;
import java.nio.charset.StandardCharsets;

/**
 * 用户服务处实现
 * 初始化用户：
 * id在redis取，
 * salt随机生成，
 * nickname给个默认 user_${id}，
 * description空字符,
 * avatar 默认头像;
 */
@Service
public class UserServiceImpl implements UserService {

    private final String USER_DEFAULT_AVATAR = "avatars/default.jpeg";

    @Autowired
    UserMapper userMapper;

    private UserPO noUser;

    public UserServiceImpl() {
        noUser = new UserPO();
        noUser.setNickname("用户不存在");
        noUser.setUsername("用户不存在");
        noUser.setAvatar("/videoapi/avatars/default.jpeg");
    }


    private final String redisPrefix = "video_";

    private String getRedisKey(String key) {
        return redisPrefix + key;
    }

    private UserPO getNewUser(String username) {
        // 构建新的用户对象
        long id = RedisUtil.getId("userID");
        UserPO user = new UserPO();
        user.setId(id);
        user.setUsername(username);
        user.setNickname("user_" + id);
        user.setDescription("");

        user.setAvatar(USER_DEFAULT_AVATAR);
        return user;
    }

    @Override
    public String getScurityPassword(String password, String salt) {
        return DigestUtils.md5DigestAsHex((password + salt).getBytes(StandardCharsets.UTF_8));
    }

    private String getNewSalt() {
        return RandomUtil.randomString(8);
    }

    @Override
    public boolean registUser(String username, String password) {
        String salt = RandomUtil.randomString(8);
        UserPO user = userMapper.findByUsername(username);
        if (user != null) {
            return false;
        }
        user = getNewUser(username);
        user.setSalt(salt);
        password = getScurityPassword(password, salt);
        int i = userMapper.registUser(user, password);
        if (i == 0) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public UserVO login(String username, String password) {
        // 按用户名查询用户
        UserPO user = userMapper.findByUsername(username);
        if (user == null) {
            throw new RuntimeException("用户名或密码错误");
        }
        // 校验密码
        if (!user.getPassword().equals(getScurityPassword(password, user.getSalt()))) {
            throw new RuntimeException("用户名或密码错误");
        }
        // 加入缓存
        RedisUtil.setUser(String.valueOf(user.getId()), user);
        // 生成新的盐
        String salt = getNewSalt();
        password = getScurityPassword(password, salt);
        // 更新数据库中的密码与盐
        userMapper.modifyPassword(user.getId(), password, salt);
        // 返回用户对象
        return VOUtil.of(user);
    }

    @Override
    public boolean deleteUser(Long id) {
        return false;
    }

    @Override
    public UserVO modifyUser(UserVO user) {
        UserPO userPO = VOUtil.swap(user, UserPO.class);

        int i = userMapper.modifyUser(userPO);
        if (i == 1) {
            userPO = userMapper.findOne(user.getId());
            RedisUtil.setUser(String.valueOf(user.getId()), userPO);
            return VOUtil.of(userPO);
        }
        return null;
    }

    @Override
    public boolean modifyPassword(long id, String old_password, String new_password) {
        UserPO user = RedisUtil.getUser(String.valueOf(id));
        if (user == null) {
            user = userMapper.findOne(id);
        }
        if (user.getPassword().equals(getScurityPassword(old_password, user.getSalt()))) {
            String newSalt = getNewSalt();
            String scurityPassword = getScurityPassword(new_password, newSalt);
            int i = userMapper.modifyPassword(id, scurityPassword, newSalt);
            if (i == 1) {
                return true;
            }
            throw new RuntimeException("修改异常");
        }
        throw new RuntimeException("密码不正确");
    }


    @Override
    public UserPO findOne(Long id) {
        UserPO user = RedisUtil.getUser(String.valueOf(id));
        if (user == null) {
            user = userMapper.findOne(id);
        }
        if (user == null) {
            return noUser;
        }
        return user;
    }

    @Override
    public String uploadAvatar(MultipartFile avatar, long id) {
        String avatarUrl = FileUtils.saveAvatar(avatar);
        int rows = userMapper.uploadAvatar(avatarUrl, id);
        if (rows != 0) {
            RedisUtil.delUser(String.valueOf(id));
            return avatarUrl;
        }
        throw new RuntimeException("修改失败");
    }
}
