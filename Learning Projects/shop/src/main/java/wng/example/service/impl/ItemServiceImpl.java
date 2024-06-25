package wng.example.service.impl;

import wng.example.base.BaseDao;
import wng.example.base.BaseServiceImpl;
import wng.example.mapper.ItemMapper;
import wng.example.po.Item;
import wng.example.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl extends BaseServiceImpl<Item> implements ItemService {

    @Autowired
    private ItemMapper itemMapper;
    @Override
    public BaseDao<Item> getBaseDao() {
        return itemMapper;
    }
}
