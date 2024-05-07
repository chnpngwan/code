package xyz.hjzyhh.back_end.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.hjzyhh.back_end.pojo.TagPO;

import java.util.List;

@Mapper
public interface TagMapper {
    // 创建tag
    int addTag(@Param("name")String name);
    // 删除tag
    int deleteTag(@Param("tid")int tid);
    // 根据关键词推荐tag
    List<TagPO> recommendTag(@Param("keyword")String keyword);
    // 根据tid获取tag
    TagPO findOne(@Param("tid")int tid);
    // 根据name查找tag
    TagPO findByName(@Param("name")String name);
    // 获取首页tag
    List<TagPO> get(@Param("limit")int limit,@Param("offset")int offset);

}
