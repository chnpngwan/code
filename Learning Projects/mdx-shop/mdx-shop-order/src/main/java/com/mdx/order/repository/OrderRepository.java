package com.mdx.order.repository;

import com.mdx.order.entity.OrderTbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * @author : jiagang
 * @date : Created in 2023/1/16 15:44
 */
@Repository
public interface OrderRepository extends JpaRepository<OrderTbl,Integer> {
}
