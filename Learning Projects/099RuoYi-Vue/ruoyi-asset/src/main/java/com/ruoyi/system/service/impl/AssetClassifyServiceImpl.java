package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AssetClassifyMapper;
import com.ruoyi.system.domain.AssetClassify;
import com.ruoyi.system.service.IAssetClassifyService;

/**
 * 资产分类Service业务层处理
 * 
 * @author 李博文
 * @date 2024-03-16
 */
@Service
public class AssetClassifyServiceImpl implements IAssetClassifyService 
{
    @Autowired
    private AssetClassifyMapper assetClassifyMapper;

    /**
     * 查询资产分类
     * 
     * @param id 资产分类主键
     * @return 资产分类
     */
    @Override
    public AssetClassify selectAssetClassifyById(Long id)
    {
        return assetClassifyMapper.selectAssetClassifyById(id);
    }

    /**
     * 查询资产分类列表
     * 
     * @param assetClassify 资产分类
     * @return 资产分类
     */
    @Override
    public List<AssetClassify> selectAssetClassifyList(AssetClassify assetClassify)
    {
        return assetClassifyMapper.selectAssetClassifyList(assetClassify);
    }

    /**
     * 新增资产分类
     * 
     * @param assetClassify 资产分类
     * @return 结果
     */
    @Override
    public int insertAssetClassify(AssetClassify assetClassify)
    {
        return assetClassifyMapper.insertAssetClassify(assetClassify);
    }

    /**
     * 修改资产分类
     * 
     * @param assetClassify 资产分类
     * @return 结果
     */
    @Override
    public int updateAssetClassify(AssetClassify assetClassify)
    {
        return assetClassifyMapper.updateAssetClassify(assetClassify);
    }

    /**
     * 批量删除资产分类
     * 
     * @param ids 需要删除的资产分类主键
     * @return 结果
     */
    @Override
    public int deleteAssetClassifyByIds(Long[] ids)
    {
        return assetClassifyMapper.deleteAssetClassifyByIds(ids);
    }

    /**
     * 删除资产分类信息
     * 
     * @param id 资产分类主键
     * @return 结果
     */
    @Override
    public int deleteAssetClassifyById(Long id)
    {
        return assetClassifyMapper.deleteAssetClassifyById(id);
    }
}
