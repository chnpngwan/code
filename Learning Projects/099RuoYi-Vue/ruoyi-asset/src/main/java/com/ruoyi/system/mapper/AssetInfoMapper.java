package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.AssetInfo;

/**
 * 资产入库Mapper接口
 * 
 * @author 李博文
 * @date 2024-03-25
 */
public interface AssetInfoMapper 
{
    /**
     * 查询资产入库
     * 
     * @param id 资产入库主键
     * @return 资产入库
     */
    public AssetInfo selectAssetInfoById(Long id);

    /**
     * 查询资产入库列表
     * 
     * @param assetInfo 资产入库
     * @return 资产入库集合
     */
    public List<AssetInfo> selectAssetInfoList(AssetInfo assetInfo);

    /**
     * 新增资产入库
     * 
     * @param assetInfo 资产入库
     * @return 结果
     */
    public int insertAssetInfo(AssetInfo assetInfo);

    /**
     * 修改资产入库
     * 
     * @param assetInfo 资产入库
     * @return 结果
     */
    public int updateAssetInfo(AssetInfo assetInfo);

    /**
     * 删除资产入库
     * 
     * @param id 资产入库主键
     * @return 结果
     */
    public int deleteAssetInfoById(Long id);

    /**
     * 批量删除资产入库
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAssetInfoByIds(Long[] ids);
}
