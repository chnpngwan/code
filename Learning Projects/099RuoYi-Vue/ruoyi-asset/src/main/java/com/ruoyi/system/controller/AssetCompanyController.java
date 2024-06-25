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
import com.ruoyi.system.domain.AssetCompany;
import com.ruoyi.system.service.IAssetCompanyService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 组织架构Controller
 * 
 * @author 李博文
 * @date 2024-03-16
 */
@RestController
@RequestMapping("/asset/company")
public class AssetCompanyController extends BaseController
{
    @Autowired
    private IAssetCompanyService assetCompanyService;

    /**
     * 查询组织架构列表
     */
    @PreAuthorize("@ss.hasPermi('asset:company:list')")
    @GetMapping("/list")
    public AjaxResult list(AssetCompany assetCompany)
    {
        List<AssetCompany> list = assetCompanyService.selectAssetCompanyList(assetCompany);
        return success(list);
    }

    /**
     * 导出组织架构列表
     */
    @PreAuthorize("@ss.hasPermi('asset:company:export')")
    @Log(title = "组织架构", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AssetCompany assetCompany)
    {
        List<AssetCompany> list = assetCompanyService.selectAssetCompanyList(assetCompany);
        ExcelUtil<AssetCompany> util = new ExcelUtil<AssetCompany>(AssetCompany.class);
        util.exportExcel(response, list, "组织架构数据");
    }

    /**
     * 获取组织架构详细信息
     */
    @PreAuthorize("@ss.hasPermi('asset:company:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(assetCompanyService.selectAssetCompanyById(id));
    }

    /**
     * 新增组织架构
     */
    @PreAuthorize("@ss.hasPermi('asset:company:add')")
    @Log(title = "组织架构", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AssetCompany assetCompany)
    {
        return toAjax(assetCompanyService.insertAssetCompany(assetCompany));
    }

    /**
     * 修改组织架构
     */
    @PreAuthorize("@ss.hasPermi('asset:company:edit')")
    @Log(title = "组织架构", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AssetCompany assetCompany)
    {
        return toAjax(assetCompanyService.updateAssetCompany(assetCompany));
    }

    /**
     * 删除组织架构
     */
    @PreAuthorize("@ss.hasPermi('asset:company:remove')")
    @Log(title = "组织架构", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(assetCompanyService.deleteAssetCompanyByIds(ids));
    }
}
