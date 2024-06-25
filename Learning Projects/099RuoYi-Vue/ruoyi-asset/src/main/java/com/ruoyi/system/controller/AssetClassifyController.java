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
import com.ruoyi.system.domain.AssetClassify;
import com.ruoyi.system.service.IAssetClassifyService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 资产分类Controller
 * 
 * @author 李博文
 * @date 2024-03-16
 */
@RestController
@RequestMapping("/asset/classify")
public class AssetClassifyController extends BaseController
{
    @Autowired
    private IAssetClassifyService assetClassifyService;

    /**
     * 查询资产分类列表
     */
    @PreAuthorize("@ss.hasPermi('asset:classify:list')")
    @GetMapping("/list")
    public AjaxResult list(AssetClassify assetClassify)
    {
        List<AssetClassify> list = assetClassifyService.selectAssetClassifyList(assetClassify);
        return success(list);
    }

    /**
     * 导出资产分类列表
     */
    @PreAuthorize("@ss.hasPermi('asset:classify:export')")
    @Log(title = "资产分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AssetClassify assetClassify)
    {
        List<AssetClassify> list = assetClassifyService.selectAssetClassifyList(assetClassify);
        ExcelUtil<AssetClassify> util = new ExcelUtil<AssetClassify>(AssetClassify.class);
        util.exportExcel(response, list, "资产分类数据");
    }

    /**
     * 获取资产分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('asset:classify:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(assetClassifyService.selectAssetClassifyById(id));
    }

    /**
     * 新增资产分类
     */
    @PreAuthorize("@ss.hasPermi('asset:classify:add')")
    @Log(title = "资产分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AssetClassify assetClassify)
    {
        return toAjax(assetClassifyService.insertAssetClassify(assetClassify));
    }

    /**
     * 修改资产分类
     */
    @PreAuthorize("@ss.hasPermi('asset:classify:edit')")
    @Log(title = "资产分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AssetClassify assetClassify)
    {
        return toAjax(assetClassifyService.updateAssetClassify(assetClassify));
    }

    /**
     * 删除资产分类
     */
    @PreAuthorize("@ss.hasPermi('asset:classify:remove')")
    @Log(title = "资产分类", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(assetClassifyService.deleteAssetClassifyByIds(ids));
    }
}
