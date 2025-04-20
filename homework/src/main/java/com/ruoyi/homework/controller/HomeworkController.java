package com.ruoyi.homework.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import org.apache.commons.lang3.ArrayUtils;
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
import com.ruoyi.homework.domain.Homework;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.homework.service.IHomeworkService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.service.ISysDeptService;

/**
 * 发布作业Controller
 *
 * @author ruoyi
 * @date 2025-03-15
 */
@RestController
@RequestMapping("/homework/homework")
public class HomeworkController extends BaseController
{
    @Autowired
    private IHomeworkService homeworkService;
    @Autowired
    private ISysDeptService deptService;


    /**
     * 查询发布作业列表
     */
    @PreAuthorize("@ss.hasPermi('homework:homework:list')")
    @GetMapping("/list")
    public TableDataInfo list(Homework homework)
    {
        startPage();
        System.out.println(homework);
        Long deptId = SecurityUtils.getDeptId();
        homework.setRemark(String.valueOf(deptId));
        List<Homework> list = homeworkService.selectHomeworkList(homework);
        System.out.println(list);
        return getDataTable(list);
    }


    @PreAuthorize("@ss.hasPermi('homework:homework:list')")
    @GetMapping("/listStu")
    public TableDataInfo listStu(Homework homework)
    {
        startPage();
        List<Homework> list = homeworkService.selectHomeworkList(homework);
        System.out.println(list);
        return getDataTable(list);
    }


    /**
     * 导出发布作业列表
     */
    @PreAuthorize("@ss.hasPermi('homework:homework:export')")
    @Log(title = "发布作业", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Homework homework)
    {
        List<Homework> list = homeworkService.selectHomeworkList(homework);
        ExcelUtil<Homework> util = new ExcelUtil<Homework>(Homework.class);
        util.exportExcel(response, list, "发布作业数据");
    }

    /**
     * 获取发布作业详细信息
     */
    @PreAuthorize("@ss.hasPermi('homework:homework:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(homeworkService.selectHomeworkById(id));
    }

    /**
     * 新增发布作业
     */
    @PreAuthorize("@ss.hasPermi('homework:homework:add')")
    @Log(title = "发布作业", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Homework homework)
    {
        Long userId = SecurityUtils.getUserId();
        homework.setTeacherId(userId);
        Long deptId = SecurityUtils.getDeptId();
        homework.setRemark(String.valueOf(deptId));
        return toAjax(homeworkService.insertHomework(homework));
    }

    /**
     * 修改发布作业
     */
    @PreAuthorize("@ss.hasPermi('homework:homework:edit')")
    @Log(title = "发布作业", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Homework homework)
    {
        return toAjax(homeworkService.updateHomework(homework));
    }

    /**
     * 删除发布作业
     */
    @PreAuthorize("@ss.hasPermi('homework:homework:remove')")
    @Log(title = "发布作业", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(homeworkService.deleteHomeworkByIds(ids));
    }
}
