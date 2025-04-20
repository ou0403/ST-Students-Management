package com.ruoyi.activity.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
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
import com.ruoyi.activity.domain.SysEventNumber;
import com.ruoyi.activity.service.ISysEventNumberService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 行事历期数Controller
 * 
 * @author ruoyi
 * @date 2025-04-15
 */
@RestController
@RequestMapping("/activity/number")
public class SysEventNumberController extends BaseController
{
    @Autowired
    private ISysEventNumberService sysEventNumberService;

    /**
     * 查询行事历期数列表
     */
    @PreAuthorize("@ss.hasPermi('activity:number:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysEventNumber sysEventNumber)
    {
        startPage();
        List<SysEventNumber> list = sysEventNumberService.selectSysEventNumberList(sysEventNumber);
        return getDataTable(list);
    }

    /**
     * 导出行事历期数列表
     */
    @PreAuthorize("@ss.hasPermi('activity:number:export')")
    @Log(title = "行事历期数", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysEventNumber sysEventNumber)
    {
        List<SysEventNumber> list = sysEventNumberService.selectSysEventNumberList(sysEventNumber);
        ExcelUtil<SysEventNumber> util = new ExcelUtil<SysEventNumber>(SysEventNumber.class);
        util.exportExcel(response, list, "行事历期数数据");
    }

    /**
     * 获取行事历期数详细信息
     */
    @PreAuthorize("@ss.hasPermi('activity:number:query')")
    @GetMapping(value = "/{numberId}")
    public AjaxResult getInfo(@PathVariable("numberId") Long numberId)
    {
        return success(sysEventNumberService.selectSysEventNumberByNumberId(numberId));
    }

    /**
     * 新增行事历期数
     */
    @PreAuthorize("@ss.hasPermi('activity:number:add')")
    @Log(title = "行事历期数", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysEventNumber sysEventNumber)
    {
        Date numberTime = sysEventNumber.getNumberTime();
        LocalDate localDate = numberTime.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        // 获取该日期对应的星期几
        DayOfWeek dayOfWeek = localDate.getDayOfWeek();
        // 判断是否为周一

        if (dayOfWeek != DayOfWeek.MONDAY){
            return error("开学日期请选择周一");
        }
        sysEventNumber.setUserId(getUserId());
        return toAjax(sysEventNumberService.insertSysEventNumbers(sysEventNumber,getUserId()));
    }

    /**
     * 修改行事历期数
     */
    @PreAuthorize("@ss.hasPermi('activity:number:edit')")
    @Log(title = "行事历期数", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysEventNumber sysEventNumber)
    {
        return toAjax(sysEventNumberService.updateSysEventNumber(sysEventNumber));
    }

    /**
     * 删除行事历期数
     */
    @PreAuthorize("@ss.hasPermi('activity:number:remove')")
    @Log(title = "行事历期数", businessType = BusinessType.DELETE)
	@DeleteMapping("/{numberIds}")
    public AjaxResult remove(@PathVariable Long[] numberIds)
    {
        return toAjax(sysEventNumberService.deleteSysEventNumberByNumberIds(numberIds));
    }
}
