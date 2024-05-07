package xyz.hjzyhh.back_end.admin.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.hjzyhh.back_end.admin.PO.UserSelector;
import xyz.hjzyhh.back_end.admin.PO.VideoSelector;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.pojo.VideoPO;

import java.util.List;

@Mapper
public interface VideoAdminMapper {
    public List<VideoPO> getUserBySeletor(@Param("selector") VideoSelector selector, @Param("limit") int limit, @Param("offset") long offset);

    public int delete(@Param("id") long id);

    public int ban(@Param("id") long id);

    public int unban(@Param("id") long id);

    public int undelete(@Param("id") long id);

    VideoPO getVideoPOById(@Param("vid")long vid);
}
