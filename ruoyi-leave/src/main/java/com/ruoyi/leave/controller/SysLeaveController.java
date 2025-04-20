package com.ruoyi.leave.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.leave.domain.SysLeave;
import com.ruoyi.leave.domain.UserList;
import com.ruoyi.leave.service.ISysLeaveService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 请假管理Controller
 *
 * @author Greedy
 * @date 2025-03-11
 */
@RestController
@RequestMapping("/leave/details")
public class SysLeaveController extends BaseController
{
    @Autowired
    private ISysLeaveService sysLeaveService;
    @Autowired
    private ISysUserService userService;



    /**
     * 查询请假管理列表
     */
    @PreAuthorize("@ss.hasPermi('leave:details:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysLeave sysLeave)
    {
        startPage();
        List<SysLeave> list = sysLeaveService.selectSysLeaveList(sysLeave);
        return getDataTable(list);
    }

    /**
     * 导出请假管理列表
     */
    @PreAuthorize("@ss.hasPermi('leave:details:export')")
    @Log(title = "请假管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysLeave sysLeave)
    {
        List<SysLeave> list = sysLeaveService.selectSysLeaveList(sysLeave);
        ExcelUtil<SysLeave> util = new ExcelUtil<SysLeave>(SysLeave.class);
        util.exportExcel(response, list, "请假管理数据");
    }

    /**
     * 获取请假管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('leave:details:query')")
    @GetMapping(value = "/{leaveId}")
    public AjaxResult getInfo(@PathVariable("leaveId") Long leaveId)
    {
        return success(sysLeaveService.selectSysLeaveByLeaveId(leaveId));
    }

    /**
     * 新增请假管理
     */
    @PreAuthorize("@ss.hasPermi('leave:details:add')")
    @Log(title = "请假管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysLeave sysLeave)
    {
//        System.out.println("sysLeave = " + sysLeave);
        sysLeave.setLeaveReserveA(getUser().getNickName());
        if (sysLeave.getUserId()==null){
            sysLeave.setUserId(getUserId());
            sysLeave.setDeptId(getDeptId());
        }
        int i = sysLeaveService.insertSysLeave(sysLeave);
        if (i==2){
            return error("没有选择审批人或漏选");
        }
        return toAjax(i);
//        return success();
    }

    /**
     * 修改请假管理
     */
    @PreAuthorize("@ss.hasPermi('leave:details:edit')")
    @Log(title = "请假管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysLeave sysLeave)
    {
        return toAjax(sysLeaveService.updateSysLeave(sysLeave));
    }
    /**
     * 确定审核
     */
    @PreAuthorize("@ss.hasPermi('leave:details:edit')")
    @Log(title = "请假管理", businessType = BusinessType.UPDATE)
    @PutMapping("/toExamine")
    public AjaxResult editToExamine(@RequestBody SysLeave sysLeave)
    {
        sysLeave.setUserId(getUserId());
        int i = sysLeaveService.updateSysLeaveToExamine(sysLeave);
        if (i==2){
            return error("审核失败或上层还未审核");
        }
        return toAjax(i);
    }


    /**
     * 拒绝审核
     */
    @PreAuthorize("@ss.hasPermi('leave:details:edit')")
    @Log(title = "请假管理", businessType = BusinessType.UPDATE)
    @PutMapping("/refuse")
    public AjaxResult editRefuse(@RequestBody SysLeave sysLeave)
    {
        sysLeave.setUserId(getUserId());
        int i = sysLeaveService.updateSysLeaveRefuse(sysLeave);
        if (i==2){
            return error("审核失败或上层还未审核");
        }
        return toAjax(i);
    }


    /**
     * 删除请假管理
     */
    @PreAuthorize("@ss.hasPermi('leave:details:remove')")
    @Log(title = "请假管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{leaveIds}")
    public AjaxResult remove(@PathVariable Long[] leaveIds)
    {
        return toAjax(sysLeaveService.deleteSysLeaveByLeaveIds(leaveIds));
    }

//    @PreAuthorize("@ss.hasPermi('leave:details:user')")
    @GetMapping("/userList")
    public AjaxResult userList(SysUser user)
    {
        List<SysUser> list = userService.selectUserList(user);
        List<UserList> userLists = sysLeaveService.selectUserList(list);
        return success(userLists);
    }

    @GetMapping("/userListTeacher")
    public AjaxResult userListTeacher(SysUser user)
    {
        user.setQufen("1");
        List<SysUser> list = userService.selectUserList(user);
        List<UserList> userLists = sysLeaveService.selectUserList(list);
        return success(userLists);
    }
}
