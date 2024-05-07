package com.project.demo.controller;

import com.project.demo.entity.AuctionOrder;
import com.project.demo.service.AuctionOrderService;
import com.project.demo.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 *拍卖订单：(AuctionOrder)表控制层
 *
 */
@RestController
@RequestMapping("/auction_order")
public class AuctionOrderController extends BaseController<AuctionOrder,AuctionOrderService> {

    /**
     *拍卖订单对象
     */
    @Autowired
    public AuctionOrderController(AuctionOrderService service) {
        setService(service);
    }

    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        String sql = "SELECT MAX(auction_order_id) AS max FROM "+"auction_order";
        Query select = service.runCountSql(sql);
        Integer max = (Integer) select.getSingleResult();
        sql = "UPDATE `secondhand_car` INNER JOIN `auction_order` ON secondhand_car.auction_number=auction_order.auction_number SET secondhand_car.current_price = secondhand_car.current_price + auction_order.mark_up_amount WHERE auction_order.auction_order_id="+max;
        select = service.runCountSql(sql);
        select.executeUpdate();
        return success(1);
    }

}
