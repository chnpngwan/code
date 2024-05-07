package com.sofftem.service;

import com.sofftem.bean.CartItem;
import com.sofftem.utils.Page;

public interface CartItemService {
    int addItem(Integer pid, Integer count, Integer uid);

    int deleteItemById(Integer id);

    void deleteItemByUid(Integer uid);

    int findByUidCount(Integer uid);

    CartItem findItemById(Integer id);

    void updateItemCountById(Integer id, Integer count);

    Page<CartItem> page(Integer pageNo ,Integer pageSize , Integer uid );

}
