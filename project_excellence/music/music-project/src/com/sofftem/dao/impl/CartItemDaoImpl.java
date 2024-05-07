package com.sofftem.dao.impl;

import com.sofftem.bean.CartItem;
import com.sofftem.dao.CartItemDao;
import com.sofftem.utils.BaseDao;

import java.util.List;

public class CartItemDaoImpl extends BaseDao<CartItem> implements CartItemDao {
    @Override
    public CartItem findCartById(Integer id) {
        return this.getBean("select * from cart_item where id = ?", id);
    }

    @Override
    public Integer addCart(Integer pid, Integer count, Integer uid) {
        return this.update("insert into cart_item values(null,?,?,?)", pid, count, uid);
    }

    @Override
    public int deleteCartById(Integer id) {
        return this.update("delete from cart_item where id=?", id);
    }

    @Override
    public int deleteCartByUid(Integer uid) {
        return this.update("delete from cart_item where uid=?", uid);
    }

    @Override
    public Integer findByUidCount(Integer uid) {
        return this.getValue("select count(*) from cart_item where uid=?", uid).intValue();
    }


    @Override
    public List<CartItem> findCartByUid(int begin, int pageSize, Integer uid) {
        return this.getBeanList("select * from cart_item where uid=? order by id desc limit ?,?", uid, begin, pageSize);
    }

    @Override
    public int updateCartCountById(Integer id, Integer count) {
        return this.update("update cart_item set count = ? where id = ?", count, id);
    }

    @Override
    public CartItem findCartByPidAndUid(Integer pid, Integer uid) {
        return this.getBean("select * from cart_item where pid = ? and uid = ?", pid, uid);
    }
}
