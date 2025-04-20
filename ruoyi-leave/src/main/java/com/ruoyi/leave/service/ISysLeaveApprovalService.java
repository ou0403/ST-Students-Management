package com.ruoyi.leave.service;

import java.util.List;
import com.ruoyi.leave.domain.SysLeaveApproval;

/**
 * 请假审批Service接口
 * 
 * @author greedy
 * @date 2025-04-17
 */
public interface ISysLeaveApprovalService 
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
     * 批量删除请假审批
     * 
     * @param approvalIds 需要删除的请假审批主键集合
     * @return 结果
     */
    public int deleteSysLeaveApprovalByApprovalIds(Long[] approvalIds);

    /**
     * 删除请假审批信息
     * 
     * @param approvalId 请假审批主键
     * @return 结果
     */
    public int deleteSysLeaveApprovalByApprovalId(Long approvalId);
}
