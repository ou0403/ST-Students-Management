package com.ruoyi.leave.service;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.leave.domain.SysLeave;
import com.ruoyi.leave.domain.UserList;

/**
 * 请假管理Service接口
 * 
 * @author Greedy
 * @date 2025-03-11
 */
public interface ISysLeaveService 
{
    /**
     * 查询请假管理
     * 
     * @param leaveId 请假管理主键
     * @return 请假管理
     */
    public SysLeave selectSysLeaveByLeaveId(Long leaveId);

    /**
     * 查询请假管理列表
     * 
     * @param sysLeave 请假管理
     * @return 请假管理集合
     */
    public List<SysLeave> selectSysLeaveList(SysLeave sysLeave);

    /**
     * 新增请假管理
     * 
     * @param sysLeave 请假管理
     * @return 结果
     */
    public int insertSysLeave(SysLeave sysLeave);

    /**
     * 修改请假管理
     * 
     * @param sysLeave 请假管理
     * @return 结果
     */
    public int updateSysLeave(SysLeave sysLeave);

    /**
     * 批量删除请假管理
     * 
     * @param leaveIds 需要删除的请假管理主键集合
     * @return 结果
     */
    public int deleteSysLeaveByLeaveIds(Long[] leaveIds);

    /**
     * 删除请假管理信息
     * 
     * @param leaveId 请假管理主键
     * @return 结果
     */
    public int deleteSysLeaveByLeaveId(Long leaveId);

    public List<UserList> selectUserList(List<SysUser> list);

    public int updateSysLeaveToExamine(SysLeave sysLeave);

    public int updateSysLeaveRefuse(SysLeave sysLeave);
}
