package com.mdx.storage.repository;

import com.mdx.storage.entity.StorageTbl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * @author : jiagang
 * @date : Created in 2023/1/16 15:44
 */
@Repository
public interface StorageRepository extends JpaRepository<StorageTbl,Integer> {

    /**
     * 通过商品code查询库存
     * @param commodityCode
     * @return
     */
    @Query
    StorageTbl findByCommodityCode(String commodityCode);
}