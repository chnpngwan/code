package com.sofftem.dao;

import com.sofftem.bean.CartItem;

import java.sql.SQLException;
import java.util.List;

public interface CartItemDao {
    Integer addCart(Integer pid, Integer count, Integer uid) ;

    int deleteCartById(Integer id) ;

    int deleteCartByUid(Integer uid) ;

    Integer findByUidCount(Integer uid) ;

    CartItem findCartById(Integer id) ;

    List<CartItem> findCartByUid(int begin, int pageSize, Integer uid) ;

    int updateCartCountById(Integer id, Integer count) ;

    CartItem findCartByPidAndUid(Integer pid, Integer uid) ;
}
