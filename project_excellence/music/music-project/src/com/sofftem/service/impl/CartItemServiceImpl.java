package com.sofftem.service.impl;

import com.sofftem.bean.CartItem;
import com.sofftem.bean.Produce;
import com.sofftem.dao.CartItemDao;
import com.sofftem.dao.impl.CartItemDaoImpl;
import com.sofftem.service.CartItemService;
import com.sofftem.utils.Page;

import java.util.List;

public class CartItemServiceImpl implements CartItemService {
    CartItemDao cartItemDao = new CartItemDaoImpl();

    @Override
    public CartItem findItemById(Integer id) {
        CartItem cartItem = cartItemDao.findCartById(id);
        cartItem.setTotalPrice(new ProduceServiceImpl().queryProduceById(cartItem.getPid()).getPrice() * cartItem.getCount());
        return cartItem;
    }

    @Override
    public int addItem(Integer pid, Integer count, Integer uid) {
        CartItem cartItem = cartItemDao.findCartByPidAndUid(pid, uid);
        if (cartItem != null) {
//            Integer id = cartItem.getId();
//            Integer count1 = cartItem.getCount();
//            cartItemDao.updateCartCountById(id, count + count1);
            return 0;
        } else
            return cartItemDao.addCart(pid, count, uid);
    }

    @Override
    public int deleteItemById(Integer id) {
        return cartItemDao.deleteCartById(id);
    }

    @Override
    public void deleteItemByUid(Integer uid) {
        cartItemDao.deleteCartByUid(uid);
    }

    @Override
    public int findByUidCount(Integer uid) {
        return cartItemDao.findByUidCount(uid);
    }

    @Override
    public void updateItemCountById(Integer id, Integer count) {
        cartItemDao.updateCartCountById(id, count);
    }

    @Override
    public Page<CartItem> page(Integer pageNo, Integer pageSize, Integer uid) {
        Page<CartItem> page = new Page<>();
        page.setPageNo(pageNo);//将参数pageNo保存到page对象
        page.setPageSize(pageSize);//将参数pageSize保存到page对象

        //获取t_book表的总记数 , 并将总记数封装到page对象中
        page.setPageTotalCount(cartItemDao.findByUidCount(uid));
        //求出最大页
        if (page.getPageTotalCount() % page.getPageSize() == 0) {
            //使用  [总记录数 / 当前页显示数量 = 总页数]
            page.setPageTotal(page.getPageTotalCount() / pageSize);
        } else {
            //如果除不净的话,就需要+1  [总记录数 / 当前页显示数量 = 总页数 + 1]
            page.setPageTotal(page.getPageTotalCount() / pageSize + 1);
        }

        //如果当前页大于最大页
        if (page.getPageNo() > page.getPageTotal()) {
            page.setPageNo(page.getPageTotal());//就将最大页设置给当前页
        }
        //如果当前页小于最小页
        if (page.getPageNo() < 1) {
            page.setPageNo(1);//就将第一页设置给当前页
        }

        //通过当前网与每页显示数 求出 起始页
        int begin = (page.getPageNo() - 1) * page.getPageSize();
        List<CartItem> cartList = cartItemDao.findCartByUid(begin, page.getPageSize(), uid);
        ProduceServiceImpl produceService = new ProduceServiceImpl();
        for (CartItem cartItem : cartList) {
            Produce produce = produceService.queryProduceById(cartItem.getPid());
            cartItem.setPname(produce.getPname());
            cartItem.setPrice(produce.getPrice());
            cartItem.setOldprice(produce.getOldprice());
            cartItem.setFaceimg(produce.getImga());
            cartItem.setTotalPrice(produce.getPrice() * cartItem.getCount());
        }
        page.setItems(cartList);//将查询出来的结果集对象保存到page中
        return page;
    }
}
