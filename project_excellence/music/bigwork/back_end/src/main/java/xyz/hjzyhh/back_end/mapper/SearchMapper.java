package xyz.hjzyhh.back_end.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.hjzyhh.back_end.pojo.ClassPO;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.pojo.VideoPO;

import java.util.List;

@Mapper
public interface SearchMapper {
    List<VideoPO> searchVideoByKeyword(@Param("keyword") List<String> keyword, @Param("limit") int limit, @Param("offset") long offset);

    List<UserPO> searchUserByKeyword(@Param("keyword") List<String> keyword, @Param("limit") int limit, @Param("offset") long offset);

    List<ClassPO> searchClassByKeyword(@Param("keyword") List<String> keyword, @Param("limit") int limit, @Param("offset") long offset);
}
