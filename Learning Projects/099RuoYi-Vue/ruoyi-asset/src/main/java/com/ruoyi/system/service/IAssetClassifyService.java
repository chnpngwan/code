package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.AssetClassify;

/**
 * 资产分类Service接口
 * 
 * @author 李博文
 * @date 2024-03-16
 */
public interface IAssetClassifyService 
{
    /**
     * 查询资产分类
     * 
     * @param id 资产分类主键
     * @return 资产分类
     */
    public AssetClassify selectAssetClassifyById(Long id);

    /**
     * 查询资产分类列表
     * 
     * @param assetClassify 资产分类
     * @return 资产分类集合
     */
    public List<AssetClassify> selectAssetClassifyList(AssetClassify assetClassify);

    /**
     * 新增资产分类
     * 
     * @param assetClassify 资产分类
     * @return 结果
     */
    public int insertAssetClassify(AssetClassify assetClassify);

    /**
     * 修改资产分类
     * 
     * @param assetClassify 资产分类
     * @return 结果
     */
    public int updateAssetClassify(AssetClassify assetClassify);

    /**
     * 批量删除资产分类
     * 
     * @param ids 需要删除的资产分类主键集合
     * @return 结果
     */
    public int deleteAssetClassifyByIds(Long[] ids);

    /**
     * 删除资产分类信息
     * 
     * @param id 资产分类主键
     * @return 结果
     */
    public int deleteAssetClassifyById(Long id);
}
