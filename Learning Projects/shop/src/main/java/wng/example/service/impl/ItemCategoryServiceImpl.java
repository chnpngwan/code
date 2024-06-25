package wng.example.service.impl;

import wng.example.base.BaseDao;
import wng.example.base.BaseServiceImpl;
import wng.example.mapper.ItemCategoryMapper;
import wng.example.po.ItemCategory;
import wng.example.service.ItemCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemCategoryServiceImpl extends BaseServiceImpl<ItemCategory> implements ItemCategoryService {
    @Autowired
    ItemCategoryMapper itemCategoryMapper;

    @Override
    public BaseDao<ItemCategory> getBaseDao() {
        return itemCategoryMapper;
    }
}
