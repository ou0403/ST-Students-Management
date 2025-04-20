package com.ruoyi.leave.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.leave.domain.SysRoom;
import com.ruoyi.leave.service.ISysRoomService;
import com.ruoyi.system.service.ISysDeptService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 教室管理Controller
 *
 * @author Greedy
 * @date 2025-03-11
 */
@RestController
@RequestMapping("/leave/room")
public class SysRoomController extends BaseController
{
    @Autowired
    private ISysRoomService sysRoomService;

    @Autowired
    private ISysDeptService deptService;

    @Autowired
    private ISysUserService userService;




    /**
     * 查询教室管理列表
     */
    @PreAuthorize("@ss.hasPermi('leave:room:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysRoom sysRoom)
    {
        startPage();
        List<SysRoom> list = sysRoomService.selectSysRoomList(sysRoom);
        return getDataTable(list);
    }

    /**
     * 导出教室管理列表
     */
    @PreAuthorize("@ss.hasPermi('leave:room:export')")
    @Log(title = "教室管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysRoom sysRoom)
    {
        List<SysRoom> list = sysRoomService.selectSysRoomList(sysRoom);
        ExcelUtil<SysRoom> util = new ExcelUtil<SysRoom>(SysRoom.class);
        util.exportExcel(response, list, "教室管理数据");
    }

    /**
     * 获取教室管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('leave:room:query')")
    @GetMapping(value = "/{roomId}")
    public AjaxResult getInfo(@PathVariable("roomId") Long roomId) throws JsonProcessingException {
        return success(sysRoomService.selectSysRoomByRoomId(roomId));
    }

    /**
     * 新增教室管理
     */
    @PreAuthorize("@ss.hasPermi('leave:room:add')")
    @Log(title = "教室管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysRoom sysRoom)
    {
        sysRoom.setUserId(getUserId());
        return toAjax(sysRoomService.insertSysRoom(sysRoom));
    }

    /**
     * 修改教室管理
     */
    @PreAuthorize("@ss.hasPermi('leave:room:edit')")
    @Log(title = "教室管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysRoom sysRoom)
    {
        return toAjax(sysRoomService.updateSysRoom(sysRoom));
    }

    /**
     * 删除教室管理
     */
    @PreAuthorize("@ss.hasPermi('leave:room:remove')")
    @Log(title = "教室管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{roomIds}")
    public AjaxResult remove(@PathVariable Long[] roomIds)
    {
        return toAjax(sysRoomService.deleteSysRoomByRoomIds(roomIds));
    }


    /**
     * 获取部门树列表(教师表使用)
     */
    @PreAuthorize("@ss.hasPermi('leave:room:list')")
    @GetMapping("/deptTreeRoom")
    public AjaxResult deptTreeRoom(SysDept dept)
    {
        return success(deptService.selectDeptTreeRoomList(dept));
    }


    /*
     * 通过部门id查询教室内学生列表
     * */
    @PreAuthorize("@ss.hasPermi('leave:room:list')")
    @GetMapping(value="/deptUser/{deptId}")
    public AjaxResult getUserList(@PathVariable Long deptId)
    {
        SysUser sysUser = new SysUser();
        sysUser.setDeptId(deptId);
        return success(userService.selectUserList(sysUser));
    }

}
