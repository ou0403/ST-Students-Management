package com.ruoyi.leave.controller;

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
import com.ruoyi.leave.domain.SysLeaveApproval;
import com.ruoyi.leave.service.ISysLeaveApprovalService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 请假审批Controller
 * 
 * @author greedy
 * @date 2025-04-17
 */
@RestController
@RequestMapping("/leave/approval")
public class SysLeaveApprovalController extends BaseController
{
    @Autowired
    private ISysLeaveApprovalService sysLeaveApprovalService;

    /**
     * 查询请假审批列表
     */
    @PreAuthorize("@ss.hasPermi('leave:approval:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysLeaveApproval sysLeaveApproval)
    {
        startPage();
        List<SysLeaveApproval> list = sysLeaveApprovalService.selectSysLeaveApprovalList(sysLeaveApproval);
        return getDataTable(list);
    }

    /**
     * 导出请假审批列表
     */
    @PreAuthorize("@ss.hasPermi('leave:approval:export')")
    @Log(title = "请假审批", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysLeaveApproval sysLeaveApproval)
    {
        List<SysLeaveApproval> list = sysLeaveApprovalService.selectSysLeaveApprovalList(sysLeaveApproval);
        ExcelUtil<SysLeaveApproval> util = new ExcelUtil<SysLeaveApproval>(SysLeaveApproval.class);
        util.exportExcel(response, list, "请假审批数据");
    }

    /**
     * 获取请假审批详细信息
     */
    @PreAuthorize("@ss.hasPermi('leave:approval:query')")
    @GetMapping(value = "/{approvalId}")
    public AjaxResult getInfo(@PathVariable("approvalId") Long approvalId)
    {
        return success(sysLeaveApprovalService.selectSysLeaveApprovalByApprovalId(approvalId));
    }

    /**
     * 新增请假审批
     */
    @PreAuthorize("@ss.hasPermi('leave:approval:add')")
    @Log(title = "请假审批", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysLeaveApproval sysLeaveApproval)
    {
        return toAjax(sysLeaveApprovalService.insertSysLeaveApproval(sysLeaveApproval));
    }

    /**
     * 修改请假审批
     */
    @PreAuthorize("@ss.hasPermi('leave:approval:edit')")
    @Log(title = "请假审批", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysLeaveApproval sysLeaveApproval)
    {
        return toAjax(sysLeaveApprovalService.updateSysLeaveApproval(sysLeaveApproval));
    }

    /**
     * 删除请假审批
     */
    @PreAuthorize("@ss.hasPermi('leave:approval:remove')")
    @Log(title = "请假审批", businessType = BusinessType.DELETE)
	@DeleteMapping("/{approvalIds}")
    public AjaxResult remove(@PathVariable Long[] approvalIds)
    {
        return toAjax(sysLeaveApprovalService.deleteSysLeaveApprovalByApprovalIds(approvalIds));
    }
}
