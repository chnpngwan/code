package wng.example.service.impl;

import wng.example.base.BaseDao;
import wng.example.base.BaseServiceImpl;
import wng.example.mapper.ItemOrderMapper;
import wng.example.po.ItemOrder;
import wng.example.service.ItemOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemOrderServiceImpl extends BaseServiceImpl<ItemOrder> implements ItemOrderService {

    @Autowired
    private ItemOrderMapper itemOrderMapper;

    @Override
    public BaseDao<ItemOrder> getBaseDao() {
        return itemOrderMapper;
    }
}
