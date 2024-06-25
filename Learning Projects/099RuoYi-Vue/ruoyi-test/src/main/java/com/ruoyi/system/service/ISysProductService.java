package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysProduct;

/**
 * 产品列表Service接口
 * 
 * @author 李博文
 * @date 2024-03-16
 */
public interface ISysProductService 
{
    /**
     * 查询产品列表
     * 
     * @param productId 产品列表主键
     * @return 产品列表
     */
    public SysProduct selectSysProductByProductId(Long productId);

    /**
     * 查询产品列表列表
     * 
     * @param sysProduct 产品列表
     * @return 产品列表集合
     */
    public List<SysProduct> selectSysProductList(SysProduct sysProduct);

    /**
     * 新增产品列表
     * 
     * @param sysProduct 产品列表
     * @return 结果
     */
    public int insertSysProduct(SysProduct sysProduct);

    /**
     * 修改产品列表
     * 
     * @param sysProduct 产品列表
     * @return 结果
     */
    public int updateSysProduct(SysProduct sysProduct);

    /**
     * 批量删除产品列表
     * 
     * @param productIds 需要删除的产品列表主键集合
     * @return 结果
     */
    public int deleteSysProductByProductIds(Long[] productIds);

    /**
     * 删除产品列表信息
     * 
     * @param productId 产品列表主键
     * @return 结果
     */
    public int deleteSysProductByProductId(Long productId);
}
