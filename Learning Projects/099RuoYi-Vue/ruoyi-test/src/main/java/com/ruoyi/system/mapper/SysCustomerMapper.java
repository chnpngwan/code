package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysCustomer;
import com.ruoyi.system.domain.SysGoods;

/**
 * 客户列表Mapper接口
 * 
 * @author 李博文
 * @date 2024-03-16
 */
public interface SysCustomerMapper 
{
    /**
     * 查询客户列表
     * 
     * @param customerId 客户列表主键
     * @return 客户列表
     */
    public SysCustomer selectSysCustomerByCustomerId(Long customerId);

    /**
     * 查询客户列表列表
     * 
     * @param sysCustomer 客户列表
     * @return 客户列表集合
     */
    public List<SysCustomer> selectSysCustomerList(SysCustomer sysCustomer);

    /**
     * 新增客户列表
     * 
     * @param sysCustomer 客户列表
     * @return 结果
     */
    public int insertSysCustomer(SysCustomer sysCustomer);

    /**
     * 修改客户列表
     * 
     * @param sysCustomer 客户列表
     * @return 结果
     */
    public int updateSysCustomer(SysCustomer sysCustomer);

    /**
     * 删除客户列表
     * 
     * @param customerId 客户列表主键
     * @return 结果
     */
    public int deleteSysCustomerByCustomerId(Long customerId);

    /**
     * 批量删除客户列表
     * 
     * @param customerIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysCustomerByCustomerIds(Long[] customerIds);

    /**
     * 批量删除商品
     * 
     * @param customerIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysGoodsByCustomerIds(Long[] customerIds);
    
    /**
     * 批量新增商品
     * 
     * @param sysGoodsList 商品列表
     * @return 结果
     */
    public int batchSysGoods(List<SysGoods> sysGoodsList);
    

    /**
     * 通过客户列表主键删除商品信息
     * 
     * @param customerId 客户列表ID
     * @return 结果
     */
    public int deleteSysGoodsByCustomerId(Long customerId);
}
