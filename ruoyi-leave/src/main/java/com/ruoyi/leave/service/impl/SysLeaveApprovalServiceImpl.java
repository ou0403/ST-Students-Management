package com.ruoyi.leave.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.leave.mapper.SysLeaveApprovalMapper;
import com.ruoyi.leave.domain.SysLeaveApproval;
import com.ruoyi.leave.service.ISysLeaveApprovalService;

/**
 * 请假审批Service业务层处理
 * 
 * @author greedy
 * @date 2025-04-17
 */
@Service
public class SysLeaveApprovalServiceImpl implements ISysLeaveApprovalService 
{
    @Autowired
    private SysLeaveApprovalMapper sysLeaveApprovalMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    /**
     * 查询请假审批
     * 
     * @param approvalId 请假审批主键
     * @return 请假审批
     */
    @Override
    public SysLeaveApproval selectSysLeaveApprovalByApprovalId(Long approvalId)
    {
        return sysLeaveApprovalMapper.selectSysLeaveApprovalByApprovalId(approvalId);
    }

    /**
     * 查询请假审批列表
     * 
     * @param sysLeaveApproval 请假审批
     * @return 请假审批
     */
    @Override
    public List<SysLeaveApproval> selectSysLeaveApprovalList(SysLeaveApproval sysLeaveApproval)
    {
        List<SysLeaveApproval> sysLeaveApprovals = sysLeaveApprovalMapper.selectSysLeaveApprovalList(sysLeaveApproval);
        for (SysLeaveApproval approval : sysLeaveApprovals) {
            if (approval.getApprovalStatuss()==0L){
                approval.setApprovalStatus("未审批");
                approval.setApprovalColor("#FFC271");
            }else if (approval.getApprovalStatuss() == 1L){
                approval.setApprovalStatus("已审批");
                //绿色
                approval.setApprovalColor("green");
            }else if (approval.getApprovalStatuss() == 2L){
                approval.setApprovalStatus("已拒绝");
                approval.setApprovalColor("red");
            }
            Long userId = approval.getUserId();
            if (userId!=null){
                SysUser sysUser = sysUserMapper.selectUserById(userId);
                approval.setUserName( sysUser.getNickName());
            }
        }
        return sysLeaveApprovals;
    }

    /**
     * 新增请假审批
     * 
     * @param sysLeaveApproval 请假审批
     * @return 结果
     */
    @Override
    public int insertSysLeaveApproval(SysLeaveApproval sysLeaveApproval)
    {
        return sysLeaveApprovalMapper.insertSysLeaveApproval(sysLeaveApproval);
    }

    /**
     * 修改请假审批
     * 
     * @param sysLeaveApproval 请假审批
     * @return 结果
     */
    @Override
    public int updateSysLeaveApproval(SysLeaveApproval sysLeaveApproval)
    {
        return sysLeaveApprovalMapper.updateSysLeaveApproval(sysLeaveApproval);
    }
    /**
     * 批量删除请假审批
     * 
     * @param approvalIds 需要删除的请假审批主键
     * @return 结果
     */
    @Override
    public int deleteSysLeaveApprovalByApprovalIds(Long[] approvalIds)
    {
        return sysLeaveApprovalMapper.deleteSysLeaveApprovalByApprovalIds(approvalIds);
    }

    /**
     * 删除请假审批信息
     * 
     * @param approvalId 请假审批主键
     * @return 结果
     */
    @Override
    public int deleteSysLeaveApprovalByApprovalId(Long approvalId)
    {
        return sysLeaveApprovalMapper.deleteSysLeaveApprovalByApprovalId(approvalId);
    }
}
