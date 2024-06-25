package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AssetCompanyMapper;
import com.ruoyi.system.domain.AssetCompany;
import com.ruoyi.system.service.IAssetCompanyService;

/**
 * 组织架构Service业务层处理
 * 
 * @author 李博文
 * @date 2024-03-16
 */
@Service
public class AssetCompanyServiceImpl implements IAssetCompanyService 
{
    @Autowired
    private AssetCompanyMapper assetCompanyMapper;

    /**
     * 查询组织架构
     * 
     * @param id 组织架构主键
     * @return 组织架构
     */
    @Override
    public AssetCompany selectAssetCompanyById(Long id)
    {
        return assetCompanyMapper.selectAssetCompanyById(id);
    }

    /**
     * 查询组织架构列表
     * 
     * @param assetCompany 组织架构
     * @return 组织架构
     */
    @Override
    public List<AssetCompany> selectAssetCompanyList(AssetCompany assetCompany)
    {
        return assetCompanyMapper.selectAssetCompanyList(assetCompany);
    }

    /**
     * 新增组织架构
     * 
     * @param assetCompany 组织架构
     * @return 结果
     */
    @Override
    public int insertAssetCompany(AssetCompany assetCompany)
    {
        return assetCompanyMapper.insertAssetCompany(assetCompany);
    }

    /**
     * 修改组织架构
     * 
     * @param assetCompany 组织架构
     * @return 结果
     */
    @Override
    public int updateAssetCompany(AssetCompany assetCompany)
    {
        return assetCompanyMapper.updateAssetCompany(assetCompany);
    }

    /**
     * 批量删除组织架构
     * 
     * @param ids 需要删除的组织架构主键
     * @return 结果
     */
    @Override
    public int deleteAssetCompanyByIds(Long[] ids)
    {
        return assetCompanyMapper.deleteAssetCompanyByIds(ids);
    }

    /**
     * 删除组织架构信息
     * 
     * @param id 组织架构主键
     * @return 结果
     */
    @Override
    public int deleteAssetCompanyById(Long id)
    {
        return assetCompanyMapper.deleteAssetCompanyById(id);
    }
}
