package com.ruoyi.WeeklyDiary.controller;

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
import com.ruoyi.WeeklyDiary.domain.StudentWeeklydiary;
import com.ruoyi.WeeklyDiary.service.IStudentWeeklydiaryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 周记任务发布Controller
 * 
 * @author 前
 * @date 2025-04-16
 */
@RestController
@RequestMapping("/WeeklyDiary/WeeklyDiary")
public class StudentWeeklydiaryController extends BaseController
{
    @Autowired
    private IStudentWeeklydiaryService studentWeeklydiaryService;

    /**
     * 查询周记任务发布列表
     */
    @PreAuthorize("@ss.hasPermi('WeeklyDiary:WeeklyDiary:list')")
    @GetMapping("/list")
    public TableDataInfo list(StudentWeeklydiary studentWeeklydiary)
    {
        startPage();
        List<StudentWeeklydiary> list = studentWeeklydiaryService.selectStudentWeeklydiaryList(studentWeeklydiary);
        return getDataTable(list);
    }

    /**
     * 导出周记任务发布列表
     */
    @PreAuthorize("@ss.hasPermi('WeeklyDiary:WeeklyDiary:export')")
    @Log(title = "周记任务发布", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StudentWeeklydiary studentWeeklydiary)
    {
        List<StudentWeeklydiary> list = studentWeeklydiaryService.selectStudentWeeklydiaryList(studentWeeklydiary);
        ExcelUtil<StudentWeeklydiary> util = new ExcelUtil<StudentWeeklydiary>(StudentWeeklydiary.class);
        util.exportExcel(response, list, "周记任务发布数据");
    }

    /**
     * 获取周记任务发布详细信息
     */
    @PreAuthorize("@ss.hasPermi('WeeklyDiary:WeeklyDiary:query')")
    @GetMapping(value = "/{weeklydiaryId}")
    public AjaxResult getInfo(@PathVariable("weeklydiaryId") Long weeklydiaryId)
    {
        return success(studentWeeklydiaryService.selectStudentWeeklydiaryByWeeklydiaryId(weeklydiaryId));
    }

    /**
     * 新增周记任务发布
     */
    @PreAuthorize("@ss.hasPermi('WeeklyDiary:WeeklyDiary:add')")
    @Log(title = "周记任务发布", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StudentWeeklydiary studentWeeklydiary)
    {
        return toAjax(studentWeeklydiaryService.insertStudentWeeklydiary(studentWeeklydiary));
    }

    /**
     * 修改周记任务发布
     */
    @PreAuthorize("@ss.hasPermi('WeeklyDiary:WeeklyDiary:edit')")
    @Log(title = "周记任务发布", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StudentWeeklydiary studentWeeklydiary)
    {
        return toAjax(studentWeeklydiaryService.updateStudentWeeklydiary(studentWeeklydiary));
    }

    /**
     * 删除周记任务发布
     */
    @PreAuthorize("@ss.hasPermi('WeeklyDiary:WeeklyDiary:remove')")
    @Log(title = "周记任务发布", businessType = BusinessType.DELETE)
	@DeleteMapping("/{weeklydiaryIds}")
    public AjaxResult remove(@PathVariable Long[] weeklydiaryIds)
    {
        return toAjax(studentWeeklydiaryService.deleteStudentWeeklydiaryByWeeklydiaryIds(weeklydiaryIds));
    }
}
