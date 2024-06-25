package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AssetCompany;

/**
 * 组织架构Service接口
 * 
 * @author 李博文
 * @date 2024-03-16
 */
public interface IAssetCompanyService 
{
    /**
     * 查询组织架构
     * 
     * @param id 组织架构主键
     * @return 组织架构
     */
    public AssetCompany selectAssetCompanyById(Long id);

    /**
     * 查询组织架构列表
     * 
     * @param assetCompany 组织架构
     * @return 组织架构集合
     */
    public List<AssetCompany> selectAssetCompanyList(AssetCompany assetCompany);

    /**
     * 新增组织架构
     * 
     * @param assetCompany 组织架构
     * @return 结果
     */
    public int insertAssetCompany(AssetCompany assetCompany);

    /**
     * 修改组织架构
     * 
     * @param assetCompany 组织架构
     * @return 结果
     */
    public int updateAssetCompany(AssetCompany assetCompany);

    /**
     * 批量删除组织架构
     * 
     * @param ids 需要删除的组织架构主键集合
     * @return 结果
     */
    public int deleteAssetCompanyByIds(Long[] ids);

    /**
     * 删除组织架构信息
     * 
     * @param id 组织架构主键
     * @return 结果
     */
    public int deleteAssetCompanyById(Long id);
}
