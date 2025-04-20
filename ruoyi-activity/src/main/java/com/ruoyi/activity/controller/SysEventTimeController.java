package com.ruoyi.activity.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Calendar;
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
import com.ruoyi.activity.domain.SysEventTime;
import com.ruoyi.activity.service.ISysEventTimeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 行事历周数时间Controller
 * 
 * @author greedy
 * @date 2025-04-15
 */
@RestController
@RequestMapping("/activity/time")
public class SysEventTimeController extends BaseController
{
    @Autowired
    private ISysEventTimeService sysEventTimeService;

    /**
     * 查询行事历周数时间列表
     */
    @PreAuthorize("@ss.hasPermi('activity:time:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysEventTime sysEventTime)
    {
        System.out.println("sysEventTime: " + sysEventTime);
        startPage();
        List<SysEventTime> list = sysEventTimeService.selectSysEventTimeList(sysEventTime);
        return getDataTable(list);
    }

    /**
     * 导出行事历周数时间列表
     */
    @PreAuthorize("@ss.hasPermi('activity:time:export')")
    @Log(title = "行事历周数时间", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysEventTime sysEventTime)
    {
        List<SysEventTime> list = sysEventTimeService.selectSysEventTimeList(sysEventTime);
        ExcelUtil<SysEventTime> util = new ExcelUtil<SysEventTime>(SysEventTime.class);
        util.exportExcel(response, list, "行事历周数时间数据");
    }

    /**
     * 获取行事历周数时间详细信息
     */
    @PreAuthorize("@ss.hasPermi('activity:time:query')")
    @GetMapping(value = "/{timeId}")
    public AjaxResult getInfo(@PathVariable("timeId") Long timeId)
    {
        return success(sysEventTimeService.selectSysEventTimeByTimeId(timeId));
    }

    /**
     * 获取行事历周数时间详细信息
     */
//    @PreAuthorize("@ss.hasPermi('activity:time:list')")
    @GetMapping(value = "/getWeeks")
    public AjaxResult getWeeks(SysEventTime sysEventTime)
    {
        System.out.println("sysEventTime: " + sysEventTime);
        return success(sysEventTimeService.selectSysEventTimeByTime(sysEventTime));
    }

    /**
     * 新增行事历周数时间
     */
    @PreAuthorize("@ss.hasPermi('activity:time:add')")
    @Log(title = "行事历周数时间", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysEventTime sysEventTime)
    {
        Date mondayDate = sysEventTime.getMondayDate();
        LocalDate mondayLocalDate = mondayDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        // 获取该日期对应的星期几
        DayOfWeek mondayDayOfWeek = mondayLocalDate.getDayOfWeek();
        // 判断是否为周一
        if (mondayDayOfWeek != DayOfWeek.MONDAY){
            return error("周一日期必须是周一");
        }

        Date sundayDate = sysEventTime.getSundayDate();
        LocalDate sundayLocalDate = sundayDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        DayOfWeek sundayDayOfWeek = sundayLocalDate.getDayOfWeek();
        if (sundayDayOfWeek != DayOfWeek.SUNDAY){
            return error("周天日期必须是周日");
        }
        Calendar mCalendar = Calendar.getInstance();
        mCalendar.setTime(mondayDate);
        mCalendar.add(Calendar.DAY_OF_WEEK, 6);
        Date time = mCalendar.getTime();
        if (!time.equals(sundayDate)){
            error("日期不是一周,请重新设置");
        }
        sysEventTime.setUserId(getUserId());
        return toAjax(sysEventTimeService.insertSysEventTime(sysEventTime));
    }

    /**
     * 修改行事历周数时间
     */
    @PreAuthorize("@ss.hasPermi('activity:time:edit')")
    @Log(title = "行事历周数时间", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysEventTime sysEventTime)
    {
        Date mondayDate = sysEventTime.getMondayDate();
        LocalDate mondayLocalDate = mondayDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        // 获取该日期对应的星期几
        DayOfWeek mondayDayOfWeek = mondayLocalDate.getDayOfWeek();
        // 判断是否为周一
        if (mondayDayOfWeek != DayOfWeek.MONDAY){
            return error("周一日期必须是周一");
        }

        Date sundayDate = sysEventTime.getSundayDate();
        LocalDate sundayLocalDate = sundayDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        DayOfWeek sundayDayOfWeek = sundayLocalDate.getDayOfWeek();
        if (sundayDayOfWeek != DayOfWeek.SUNDAY){
            return error("周天日期必须是周日");
        }
        Calendar mCalendar = Calendar.getInstance();
        mCalendar.setTime(mondayDate);
        mCalendar.add(Calendar.DAY_OF_WEEK, 6);
        Date time = mCalendar.getTime();
        if (!time.equals(sundayDate)){
            error("日期不是一周,请重新设置");
        }
        return toAjax(sysEventTimeService.updateSysEventTime(sysEventTime));
    }

    /**
     * 删除行事历周数时间
     */
    @PreAuthorize("@ss.hasPermi('activity:time:remove')")
    @Log(title = "行事历周数时间", businessType = BusinessType.DELETE)
	@DeleteMapping("/{timeIds}")
    public AjaxResult remove(@PathVariable Long[] timeIds)
    {
        return toAjax(sysEventTimeService.deleteSysEventTimeByTimeIds(timeIds));
    }
}
