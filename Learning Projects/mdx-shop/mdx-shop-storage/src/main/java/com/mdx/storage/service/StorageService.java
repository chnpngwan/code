package com.mdx.storage.service;

/**
 * @author : jiagang
 * @date : Created in 2022/7/1 18:40
 */
public interface StorageService {

    /**
     * 扣除存储数量
     */
    void deduct(String commodityCode, int count);
}
