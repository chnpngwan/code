package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AssetRegionMapper;
import com.ruoyi.system.domain.AssetRegion;
import com.ruoyi.system.service.IAssetRegionService;

/**
 * 区域管理Service业务层处理
 * 
 * @author 李博文
 * @date 2024-03-16
 */
@Service
public class AssetRegionServiceImpl implements IAssetRegionService 
{
    @Autowired
    private AssetRegionMapper assetRegionMapper;

    /**
     * 查询区域管理
     * 
     * @param id 区域管理主键
     * @return 区域管理
     */
    @Override
    public AssetRegion selectAssetRegionById(Integer id)
    {
        return assetRegionMapper.selectAssetRegionById(id);
    }

    /**
     * 查询区域管理列表
     * 
     * @param assetRegion 区域管理
     * @return 区域管理
     */
    @Override
    public List<AssetRegion> selectAssetRegionList(AssetRegion assetRegion)
    {
        return assetRegionMapper.selectAssetRegionList(assetRegion);
    }

    /**
     * 新增区域管理
     * 
     * @param assetRegion 区域管理
     * @return 结果
     */
    @Override
    public int insertAssetRegion(AssetRegion assetRegion)
    {
        return assetRegionMapper.insertAssetRegion(assetRegion);
    }

    /**
     * 修改区域管理
     * 
     * @param assetRegion 区域管理
     * @return 结果
     */
    @Override
    public int updateAssetRegion(AssetRegion assetRegion)
    {
        return assetRegionMapper.updateAssetRegion(assetRegion);
    }

    /**
     * 批量删除区域管理
     * 
     * @param ids 需要删除的区域管理主键
     * @return 结果
     */
    @Override
    public int deleteAssetRegionByIds(Integer[] ids)
    {
        return assetRegionMapper.deleteAssetRegionByIds(ids);
    }

    /**
     * 删除区域管理信息
     * 
     * @param id 区域管理主键
     * @return 结果
     */
    @Override
    public int deleteAssetRegionById(Integer id)
    {
        return assetRegionMapper.deleteAssetRegionById(id);
    }
}
