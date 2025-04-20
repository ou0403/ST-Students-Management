package com.ruoyi.ResumeWork.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.SecurityUtils;
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
import com.ruoyi.ResumeWork.domain.ResumeWork;
import com.ruoyi.ResumeWork.service.IResumeWorkService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 简历投递Controller
 *
 * @author ruoyi
 * @date 2025-04-08
 */
@RestController
@RequestMapping("/ResumeWork/work")
public class    ResumeWorkController extends BaseController
{
    @Autowired
    private IResumeWorkService resumeWorkService;

    /**
     * 查询简历投递列表
     */
    @PreAuthorize("@ss.hasPermi('ResumeWork:work:list')")
    @GetMapping("/list")
    public TableDataInfo list(ResumeWork resumeWork)
    {
        startPage();
        List<ResumeWork> list = resumeWorkService.selectResumeWorkList(resumeWork);
        return getDataTable(list);
    }

    /**
     * 导出简历投递列表
     */
    @PreAuthorize("@ss.hasPermi('ResumeWork:work:export')")
    @Log(title = "简历投递", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ResumeWork resumeWork)
    {
        List<ResumeWork> list = resumeWorkService.selectResumeWorkList(resumeWork);
        ExcelUtil<ResumeWork> util = new ExcelUtil<ResumeWork>(ResumeWork.class);
        util.exportExcel(response, list, "简历投递数据");
    }

    /**
     * 获取简历投递详细信息
     */
    @PreAuthorize("@ss.hasPermi('ResumeWork:work:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(resumeWorkService.selectResumeWorkById(id));
    }

    /**
     * 新增简历投递
     */
    @PreAuthorize("@ss.hasPermi('ResumeWork:work:add')")
    @Log(title = "简历投递", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ResumeWork resumeWork)
    {
        Long userId = SecurityUtils.getUserId();
        resumeWork.setRemark1(String.valueOf(userId));
        return toAjax(resumeWorkService.insertResumeWork(resumeWork));
    }

    /**
     * 修改简历投递
     */
    @PreAuthorize("@ss.hasPermi('ResumeWork:work:edit')")
    @Log(title = "简历投递", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ResumeWork resumeWork)
    {
        return toAjax(resumeWorkService.updateResumeWork(resumeWork));
    }

    /**
     * 删除简历投递
     */
    @PreAuthorize("@ss.hasPermi('ResumeWork:work:remove')")
    @Log(title = "简历投递", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(resumeWorkService.deleteResumeWorkByIds(ids));
    }
}
