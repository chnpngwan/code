package com.mdx.storage.service.impl;
import com.mdx.common.exception.BizException;
import com.mdx.common.utils.StringUtils;
import com.mdx.storage.entity.StorageTbl;
import com.mdx.storage.repository.StorageRepository;
import com.mdx.storage.service.StorageService;
import io.seata.core.context.RootContext;
import io.seata.spring.annotation.GlobalTransactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author : jiagang
 * @date : Created in 2022/7/1 18:42
 */
@Service
public class StorageServiceImpl implements StorageService {

    @Autowired
    private StorageRepository storageRepository;

    /**
     * 扣减库存
     * @param commodityCode
     * @param count
     */
    @Override
    public void deduct(String commodityCode, int count) {
        System.out.println("事务id---------------------->" + RootContext.getXID());
        StorageTbl storageTbl = storageRepository.findByCommodityCode(commodityCode);
        if (storageTbl == null){
            throw new BizException("storageTbl is null");
        }

        // 模拟异常
        System.out.println(1 / 0);

        // 这里先不考虑超卖的情况
        storageTbl.setCount(storageTbl.getCount() - count);
        // 使用jpa 存在就更新
        storageRepository.save(storageTbl);
    }
}
