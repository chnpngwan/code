package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.AssetRegion;

/**
 * 区域管理Mapper接口
 * 
 * @author 李博文
 * @date 2024-03-16
 */
public interface AssetRegionMapper 
{
    /**
     * 查询区域管理
     * 
     * @param id 区域管理主键
     * @return 区域管理
     */
    public AssetRegion selectAssetRegionById(Integer id);

    /**
     * 查询区域管理列表
     * 
     * @param assetRegion 区域管理
     * @return 区域管理集合
     */
    public List<AssetRegion> selectAssetRegionList(AssetRegion assetRegion);

    /**
     * 新增区域管理
     * 
     * @param assetRegion 区域管理
     * @return 结果
     */
    public int insertAssetRegion(AssetRegion assetRegion);

    /**
     * 修改区域管理
     * 
     * @param assetRegion 区域管理
     * @return 结果
     */
    public int updateAssetRegion(AssetRegion assetRegion);

    /**
     * 删除区域管理
     * 
     * @param id 区域管理主键
     * @return 结果
     */
    public int deleteAssetRegionById(Integer id);

    /**
     * 批量删除区域管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAssetRegionByIds(Integer[] ids);
}
