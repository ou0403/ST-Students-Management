package com.ruoyi.activity.controller;

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
import com.ruoyi.activity.domain.SysEventColor;
import com.ruoyi.activity.service.ISysEventColorService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 行事历部门颜色Controller
 * 
 * @author greedy
 * @date 2025-04-15
 */
@RestController
@RequestMapping("/activity/color")
public class SysEventColorController extends BaseController
{
    @Autowired
    private ISysEventColorService sysEventColorService;

    /**
     * 查询行事历部门颜色列表
     */
    @PreAuthorize("@ss.hasPermi('activity:color:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysEventColor sysEventColor)
    {
        startPage();
        List<SysEventColor> list = sysEventColorService.selectSysEventColorList(sysEventColor);
        return getDataTable(list);
    }

    /**
     * 导出行事历部门颜色列表
     */
    @PreAuthorize("@ss.hasPermi('activity:color:export')")
    @Log(title = "行事历部门颜色", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysEventColor sysEventColor)
    {
        List<SysEventColor> list = sysEventColorService.selectSysEventColorList(sysEventColor);
        ExcelUtil<SysEventColor> util = new ExcelUtil<SysEventColor>(SysEventColor.class);
        util.exportExcel(response, list, "行事历部门颜色数据");
    }

    /**
     * 获取行事历部门颜色详细信息
     */
    @PreAuthorize("@ss.hasPermi('activity:color:query')")
    @GetMapping(value = "/{colorId}")
    public AjaxResult getInfo(@PathVariable("colorId") Long colorId)
    {
        return success(sysEventColorService.selectSysEventColorByColorId(colorId));
    }

    /**
     * 新增行事历部门颜色
     */
    @PreAuthorize("@ss.hasPermi('activity:color:add')")
    @Log(title = "行事历部门颜色", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysEventColor sysEventColor)
    {
        sysEventColor.setUserId(getUserId());
        return toAjax(sysEventColorService.insertSysEventColor(sysEventColor));
    }

    /**
     * 修改行事历部门颜色
     */
    @PreAuthorize("@ss.hasPermi('activity:color:edit')")
    @Log(title = "行事历部门颜色", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysEventColor sysEventColor)
    {
        return toAjax(sysEventColorService.updateSysEventColor(sysEventColor));
    }

    /**
     * 删除行事历部门颜色
     */
    @PreAuthorize("@ss.hasPermi('activity:color:remove')")
    @Log(title = "行事历部门颜色", businessType = BusinessType.DELETE)
	@DeleteMapping("/{colorIds}")
    public AjaxResult remove(@PathVariable Long[] colorIds)
    {
        return toAjax(sysEventColorService.deleteSysEventColorByColorIds(colorIds));
    }
}
