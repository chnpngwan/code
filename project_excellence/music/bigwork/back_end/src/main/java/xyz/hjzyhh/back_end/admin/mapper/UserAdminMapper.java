package xyz.hjzyhh.back_end.admin.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.hjzyhh.back_end.admin.PO.UserSelector;
import xyz.hjzyhh.back_end.pojo.UserPO;

import java.util.List;

@Mapper
public interface UserAdminMapper {
    public List<UserPO> getUsers(@Param("limit") int limit, @Param("offset") long offset);

    public List<UserPO> getUserBySeletor(@Param("selector") UserSelector selector, @Param("limit") int limit, @Param("offset") long offset);

    public int delete(@Param("id") long id);

    public int ban(@Param("id") long id);

    public int unban(@Param("id") long id);

    public int undelete(@Param("id") long id);
}
