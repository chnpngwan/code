package xyz.hjzyhh.back_end.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.hjzyhh.back_end.pojo.UserPO;

import java.util.List;

/**
 * 用户的DAO操作
 * 增删改查
 */
@Mapper
public interface UserMapper {
    int registUser(@Param("user") UserPO userPO, @Param("password") String password);

    int deleteUser(@Param("id") long id);

    int modifyUser(@Param("user") UserPO user);

    int modifyPassword(@Param("id") long id, @Param("password") String password, @Param("salt") String salt);

    UserPO login(@Param("username") String username, @Param("password") String password);

    UserPO findOne(@Param("id") long id);

    UserPO findByUsername(@Param("username") String username);

    int uploadAvatar(@Param("avatar") String avatarUrl, @Param("id") long uid);

    int updateWorks(@Param("uid")long uid,@Param("works")int works);

    int updateCollections(@Param("uid")long uid,@Param("collections")int collections);
}
