package xyz.hjzyhh.back_end.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.hjzyhh.back_end.mapper.TagMapper;
import xyz.hjzyhh.back_end.pojo.TagPO;
import xyz.hjzyhh.back_end.service.TagService;

import java.util.List;

@Service
public class TagServiceImpl implements TagService {
    @Autowired
    TagMapper tagMapper;

    @Override
    public boolean addTag(String name) {
        TagPO tag = tagMapper.findByName(name);
        if(tag != null){
            return false;
        }
        return tagMapper.addTag(name) == 1;
    }

    @Override
    public boolean deleteTag(int id) {
        return tagMapper.deleteTag(id) == 1;
    }

    @Override
    public List<TagPO> recommend(String keyword) {
        return tagMapper.recommendTag(keyword);
    }

    @Override
    public TagPO findOne(int tid) {
        return tagMapper.findOne(tid);
    }

    private final int PAGE_LIMIT = 20;

    @Override
    public List<TagPO> get(int page) {
        int offset = PAGE_LIMIT*(page-1);
        return tagMapper.get(PAGE_LIMIT,offset);
    }
}
