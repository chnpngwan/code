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
import com.ruoyi.system.domain.AssetRegion;
import com.ruoyi.system.service.IAssetRegionService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 区域管理Controller
 * 
 * @author 李博文
 * @date 2024-03-16
 */
@RestController
@RequestMapping("/asset/region")
public class AssetRegionController extends BaseController
{
    @Autowired
    private IAssetRegionService assetRegionService;

    /**
     * 查询区域管理列表
     */
    @PreAuthorize("@ss.hasPermi('asset:region:list')")
    @GetMapping("/list")
    public AjaxResult list(AssetRegion assetRegion)
    {
        List<AssetRegion> list = assetRegionService.selectAssetRegionList(assetRegion);
        return success(list);
    }

    /**
     * 导出区域管理列表
     */
    @PreAuthorize("@ss.hasPermi('asset:region:export')")
    @Log(title = "区域管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AssetRegion assetRegion)
    {
        List<AssetRegion> list = assetRegionService.selectAssetRegionList(assetRegion);
        ExcelUtil<AssetRegion> util = new ExcelUtil<AssetRegion>(AssetRegion.class);
        util.exportExcel(response, list, "区域管理数据");
    }

    /**
     * 获取区域管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('asset:region:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return success(assetRegionService.selectAssetRegionById(id));
    }

    /**
     * 新增区域管理
     */
    @PreAuthorize("@ss.hasPermi('asset:region:add')")
    @Log(title = "区域管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AssetRegion assetRegion)
    {
        return toAjax(assetRegionService.insertAssetRegion(assetRegion));
    }

    /**
     * 修改区域管理
     */
    @PreAuthorize("@ss.hasPermi('asset:region:edit')")
    @Log(title = "区域管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AssetRegion assetRegion)
    {
        return toAjax(assetRegionService.updateAssetRegion(assetRegion));
    }

    /**
     * 删除区域管理
     */
    @PreAuthorize("@ss.hasPermi('asset:region:remove')")
    @Log(title = "区域管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(assetRegionService.deleteAssetRegionByIds(ids));
    }
}
