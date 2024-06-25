package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysCustomer;

/**
 * 客户列表Service接口
 * 
 * @author 李博文
 * @date 2024-03-16
 */
public interface ISysCustomerService 
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
     * 批量删除客户列表
     * 
     * @param customerIds 需要删除的客户列表主键集合
     * @return 结果
     */
    public int deleteSysCustomerByCustomerIds(Long[] customerIds);

    /**
     * 删除客户列表信息
     * 
     * @param customerId 客户列表主键
     * @return 结果
     */
    public int deleteSysCustomerByCustomerId(Long customerId);
}
