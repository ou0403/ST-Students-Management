package com.ruoyi.leave.mapper;

import java.util.List;
import com.ruoyi.leave.domain.SysLeave;

/**
 * 请假管理Mapper接口
 * 
 * @author Greedy
 * @date 2025-03-11
 */
public interface SysLeaveMapper 
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
     * 删除请假管理
     * 
     * @param leaveId 请假管理主键
     * @return 结果
     */
    public int deleteSysLeaveByLeaveId(Long leaveId);

    /**
     * 批量删除请假管理
     * 
     * @param leaveIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysLeaveByLeaveIds(Long[] leaveIds);
}
