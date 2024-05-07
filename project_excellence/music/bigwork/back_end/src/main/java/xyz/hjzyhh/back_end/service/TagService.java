package xyz.hjzyhh.back_end.service;


import xyz.hjzyhh.back_end.pojo.TagPO;

import java.util.List;

public interface TagService {
    boolean addTag(String name);
    boolean deleteTag(int id);
    List<TagPO> recommend(String keyword);
    TagPO findOne(int tid);
    List<TagPO> get(int page);
}
