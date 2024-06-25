package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.AssetInfo;
import com.ruoyi.system.service.IAssetInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 资产入库Controller
 * 
 * @author 李博文
 * @date 2024-03-25
 */
@RestController
@RequestMapping("/asset/assetinfo")
public class AssetInfoController extends BaseController
{
    @Autowired
    private IAssetInfoService assetInfoService;

    /**
     * 查询资产入库列表
     */
    @PreAuthorize("@ss.hasPermi('asset:assetinfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(AssetInfo assetInfo)
    {
        startPage();
        List<AssetInfo> list = assetInfoService.selectAssetInfoList(assetInfo);
        return getDataTable(list);
    }

    /**
     * 导出资产入库列表
     */
    @PreAuthorize("@ss.hasPermi('asset:assetinfo:export')")
    @Log(title = "资产入库", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AssetInfo assetInfo)
    {
        List<AssetInfo> list = assetInfoService.selectAssetInfoList(assetInfo);
        ExcelUtil<AssetInfo> util = new ExcelUtil<AssetInfo>(AssetInfo.class);
        util.exportExcel(response, list, "资产入库数据");
    }

    /**
     * 获取资产入库详细信息
     */
    @PreAuthorize("@ss.hasPermi('asset:assetinfo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(assetInfoService.selectAssetInfoById(id));
    }

    /**
     * 新增资产入库
     */
    @PreAuthorize("@ss.hasPermi('asset:assetinfo:add')")
    @Log(title = "资产入库", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AssetInfo assetInfo)
    {
        return toAjax(assetInfoService.insertAssetInfo(assetInfo));
    }

    /**
     * 修改资产入库
     */
    @PreAuthorize("@ss.hasPermi('asset:assetinfo:edit')")
    @Log(title = "资产入库", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AssetInfo assetInfo)
    {
        return toAjax(assetInfoService.updateAssetInfo(assetInfo));
    }

    /**
     * 删除资产入库
     */
    @PreAuthorize("@ss.hasPermi('asset:assetinfo:remove')")
    @Log(title = "资产入库", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(assetInfoService.deleteAssetInfoByIds(ids));
    }
}
