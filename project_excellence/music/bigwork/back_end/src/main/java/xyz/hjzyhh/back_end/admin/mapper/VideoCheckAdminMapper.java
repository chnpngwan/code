package xyz.hjzyhh.back_end.admin.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.hjzyhh.back_end.admin.PO.VideoCheckPO;
import xyz.hjzyhh.back_end.pojo.VideoPO;

import java.util.List;

@Mapper
public interface VideoCheckAdminMapper {
    public List<VideoCheckPO> getVideoChecks(@Param("limit") int limit, @Param("offset") long offset);
    List<VideoCheckPO> getChecking(@Param("aid") int aid);
    VideoCheckPO getCheck(@Param("id") long id);
    int changeStatus(@Param("id")long id, @Param("status") int status,@Param("aid")int aid);
    int publishVideo(@Param("vid")long vid);
    VideoPO findById(@Param("vid") long id);

}
