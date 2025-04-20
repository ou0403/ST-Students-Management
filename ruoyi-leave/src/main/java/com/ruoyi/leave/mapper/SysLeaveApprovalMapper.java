package com.ruoyi.leave.mapper;

import java.util.List;
import com.ruoyi.leave.domain.SysLeaveApproval;

/**
 * 请假审批Mapper接口
 * 
 * @author greedy
 * @date 2025-04-17
 */
public interface SysLeaveApprovalMapper 
{
    /**
     * 查询请假审批
     * 
     * @param approvalId 请假审批主键
     * @return 请假审批
     */
    public SysLeaveApproval selectSysLeaveApprovalByApprovalId(Long approvalId);

    /**
     * 查询请假审批列表
     * 
     * @param sysLeaveApproval 请假审批
     * @return 请假审批集合
     */
    public List<SysLeaveApproval> selectSysLeaveApprovalList(SysLeaveApproval sysLeaveApproval);

    /**
     * 新增请假审批
     * 
     * @param sysLeaveApproval 请假审批
     * @return 结果
     */
    public int insertSysLeaveApproval(SysLeaveApproval sysLeaveApproval);

    /**
     * 修改请假审批
     * 
     * @param sysLeaveApproval 请假审批
     * @return 结果
     */
    public int updateSysLeaveApproval(SysLeaveApproval sysLeaveApproval);

    /**
     * 删除请假审批
     * 
     * @param approvalId 请假审批主键
     * @return 结果
     */
    public int deleteSysLeaveApprovalByApprovalId(Long approvalId);

    /**
     * 批量删除请假审批
     * 
     * @param approvalIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysLeaveApprovalByApprovalIds(Long[] approvalIds);
}
