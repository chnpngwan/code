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
import com.ruoyi.system.domain.SysTeacher;
import com.ruoyi.system.service.ISysTeacherService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 老师列表Controller
 * 
 * @author 李博文
 * @date 2024-03-16
 */
@RestController
@RequestMapping("/system/teacher")
public class SysTeacherController extends BaseController
{
    @Autowired
    private ISysTeacherService sysTeacherService;

    /**
     * 查询老师列表列表
     */
    @PreAuthorize("@ss.hasPermi('system:teacher:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysTeacher sysTeacher)
    {
        startPage();
        List<SysTeacher> list = sysTeacherService.selectSysTeacherList(sysTeacher);
        return getDataTable(list);
    }

    /**
     * 导出老师列表列表
     */
    @PreAuthorize("@ss.hasPermi('system:teacher:export')")
    @Log(title = "老师列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysTeacher sysTeacher)
    {
        List<SysTeacher> list = sysTeacherService.selectSysTeacherList(sysTeacher);
        ExcelUtil<SysTeacher> util = new ExcelUtil<SysTeacher>(SysTeacher.class);
        util.exportExcel(response, list, "老师列表数据");
    }

    /**
     * 获取老师列表详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:teacher:query')")
    @GetMapping(value = "/{teacherId}")
    public AjaxResult getInfo(@PathVariable("teacherId") Long teacherId)
    {
        return success(sysTeacherService.selectSysTeacherByTeacherId(teacherId));
    }

    /**
     * 新增老师列表
     */
    @PreAuthorize("@ss.hasPermi('system:teacher:add')")
    @Log(title = "老师列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysTeacher sysTeacher)
    {
        return toAjax(sysTeacherService.insertSysTeacher(sysTeacher));
    }

    /**
     * 修改老师列表
     */
    @PreAuthorize("@ss.hasPermi('system:teacher:edit')")
    @Log(title = "老师列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysTeacher sysTeacher)
    {
        return toAjax(sysTeacherService.updateSysTeacher(sysTeacher));
    }

    /**
     * 删除老师列表
     */
    @PreAuthorize("@ss.hasPermi('system:teacher:remove')")
    @Log(title = "老师列表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{teacherIds}")
    public AjaxResult remove(@PathVariable Long[] teacherIds)
    {
        return toAjax(sysTeacherService.deleteSysTeacherByTeacherIds(teacherIds));
    }
}
