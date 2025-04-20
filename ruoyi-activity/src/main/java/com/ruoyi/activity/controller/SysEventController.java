package com.ruoyi.activity.controller;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.activity.domain.SysEvent;
import com.ruoyi.activity.service.ISysEventService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 行事历Controller
 *
 * @author Greedy
 * @date 2025-03-15
 */
@RestController
@RequestMapping("/activity/event")
public class SysEventController extends BaseController
{
    @Autowired
    private ISysEventService sysEventService;

    /**
     * 查询行事历列表
     */
    @PreAuthorize("@ss.hasPermi('activity:event:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysEvent sysEvent)
    {
        startPage();
        List<SysEvent> list = sysEventService.selectSysEventList(sysEvent);
        return getDataTable(list);
    }

    /**
     * 查询行事历并转换数据
     */
    @PreAuthorize("@ss.hasPermi('activity:event:listCalendar')")
    @GetMapping("/listCalendar")
    public AjaxResult listCalendar(SysEvent sysEvent)
    {
        System.out.println("sysEvent:"+sysEvent);
        JSONObject jsonObject = sysEventService.selectSysEventCalendarList(sysEvent);
        return success(jsonObject);
    }

    /**
     * 导出行事历列表
     */
    @PreAuthorize("@ss.hasPermi('activity:event:export')")
    @Log(title = "行事历", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysEvent sysEvent)
    {
        List<SysEvent> list = sysEventService.selectSysEventList(sysEvent);
        ExcelUtil<SysEvent> util = new ExcelUtil<SysEvent>(SysEvent.class);
        util.exportExcel(response, list, "行事历数据");
    }

    /**
     * 获取行事历详细信息
     */
    @PreAuthorize("@ss.hasPermi('activity:event:query')")
    @GetMapping(value = "/{eventId}")
    public AjaxResult getInfo(@PathVariable("eventId") Long eventId)
    {
        return success(sysEventService.selectSysEventByEventId(eventId));
    }

    /**
     * 新增行事历
     */
    @PreAuthorize("@ss.hasPermi('activity:event:add')")
    @Log(title = "行事历", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysEvent sysEvent)
    {
        return toAjax(sysEventService.insertSysEvent(sysEvent));
    }

    /**
     * 修改行事历
     */
    @PreAuthorize("@ss.hasPermi('activity:event:edit')")
    @Log(title = "行事历", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysEvent sysEvent)
    {
        return toAjax(sysEventService.updateSysEvent(sysEvent));
    }

    /**
     * 删除行事历
     */
    @PreAuthorize("@ss.hasPermi('activity:event:remove')")
    @Log(title = "行事历", businessType = BusinessType.DELETE)
	@DeleteMapping("/{eventIds}")
    public AjaxResult remove(@PathVariable Long[] eventIds)
    {
        return toAjax(sysEventService.deleteSysEventByEventIds(eventIds));
    }
}
