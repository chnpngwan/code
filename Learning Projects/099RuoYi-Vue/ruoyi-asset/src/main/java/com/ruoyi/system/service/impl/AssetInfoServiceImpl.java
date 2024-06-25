package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AssetInfoMapper;
import com.ruoyi.system.domain.AssetInfo;
import com.ruoyi.system.service.IAssetInfoService;

/**
 * 资产入库Service业务层处理
 * 
 * @author 李博文
 * @date 2024-03-25
 */
@Service
public class AssetInfoServiceImpl implements IAssetInfoService 
{
    @Autowired
    private AssetInfoMapper assetInfoMapper;

    /**
     * 查询资产入库
     * 
     * @param id 资产入库主键
     * @return 资产入库
     */
    @Override
    public AssetInfo selectAssetInfoById(Long id)
    {
        return assetInfoMapper.selectAssetInfoById(id);
    }

    /**
     * 查询资产入库列表
     * 
     * @param assetInfo 资产入库
     * @return 资产入库
     */
    @Override
    public List<AssetInfo> selectAssetInfoList(AssetInfo assetInfo)
    {
        return assetInfoMapper.selectAssetInfoList(assetInfo);
    }

    /**
     * 新增资产入库
     * 
     * @param assetInfo 资产入库
     * @return 结果
     */
    @Override
    public int insertAssetInfo(AssetInfo assetInfo)
    {
        assetInfo.setCreateTime(DateUtils.getNowDate());
        return assetInfoMapper.insertAssetInfo(assetInfo);
    }

    /**
     * 修改资产入库
     * 
     * @param assetInfo 资产入库
     * @return 结果
     */
    @Override
    public int updateAssetInfo(AssetInfo assetInfo)
    {
        return assetInfoMapper.updateAssetInfo(assetInfo);
    }

    /**
     * 批量删除资产入库
     * 
     * @param ids 需要删除的资产入库主键
     * @return 结果
     */
    @Override
    public int deleteAssetInfoByIds(Long[] ids)
    {
        return assetInfoMapper.deleteAssetInfoByIds(ids);
    }

    /**
     * 删除资产入库信息
     * 
     * @param id 资产入库主键
     * @return 结果
     */
    @Override
    public int deleteAssetInfoById(Long id)
    {
        return assetInfoMapper.deleteAssetInfoById(id);
    }
}
