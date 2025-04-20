package com.ruoyi.leave.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 请假审批对象 sys_leave_approval
 * 
 * @author greedy
 * @date 2025-04-17
 */
public class SysLeaveApproval extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long approvalId;

    /** 请假表id */
    @Excel(name = "请假表id")
    private Long leaveId;

    /** 用户表id */
    @Excel(name = "用户表id")
    private Long userId;

    /** 审批状态 */
    @Excel(name = "审批状态")
    private Long approvalStatuss;

    /** 审批顺序 */
    @Excel(name = "审批顺序")
    private Long approvalSequence;

    /** 审批留言 */
    @Excel(name = "审批留言")
    private String approvalMessage;

    /** 审批时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "审批时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date approvalTime;


    private String approvalStatus;

    private String approvalColor;

    private String userName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(String approvalStatus) {
        this.approvalStatus = approvalStatus;
    }

    public String getApprovalColor() {
        return approvalColor;
    }

    public void setApprovalColor(String approvalColor) {
        this.approvalColor = approvalColor;
    }

    public void setApprovalId(Long approvalId)
    {
        this.approvalId = approvalId;
    }

    public Long getApprovalId() 
    {
        return approvalId;
    }

    public void setLeaveId(Long leaveId) 
    {
        this.leaveId = leaveId;
    }

    public Long getLeaveId() 
    {
        return leaveId;
    }

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public void setApprovalStatuss(Long approvalStatuss) 
    {
        this.approvalStatuss = approvalStatuss;
    }

    public Long getApprovalStatuss() 
    {
        return approvalStatuss;
    }

    public void setApprovalSequence(Long approvalSequence) 
    {
        this.approvalSequence = approvalSequence;
    }

    public Long getApprovalSequence() 
    {
        return approvalSequence;
    }

    public void setApprovalMessage(String approvalMessage) 
    {
        this.approvalMessage = approvalMessage;
    }

    public String getApprovalMessage() 
    {
        return approvalMessage;
    }

    public void setApprovalTime(Date approvalTime) 
    {
        this.approvalTime = approvalTime;
    }

    public Date getApprovalTime() 
    {
        return approvalTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("approvalId", getApprovalId())
            .append("leaveId", getLeaveId())
            .append("userId", getUserId())
            .append("approvalStatuss", getApprovalStatuss())
            .append("approvalSequence", getApprovalSequence())
            .append("approvalMessage", getApprovalMessage())
            .append("approvalTime", getApprovalTime())
            .toString();
    }
}
