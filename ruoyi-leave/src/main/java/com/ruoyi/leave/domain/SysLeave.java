package com.ruoyi.leave.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.springframework.security.core.userdetails.User;

/**
 * 请假管理对象 sys_leave
 *
 * @author Greedy
 * @date 2025-03-11
 */
public class SysLeave extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 请假编码 */
    private Long leaveId;

    /** 请假类型 */
    @Excel(name = "请假类型")
    private Long leaveType;

    /** 审批状态 */
    @Excel(name = "审批状态")
    private Long approvalStatus;

    /** 时间类型 */
    @Excel(name = "时间类型")
    private Long timeType;

    /** 初始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "初始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date firstTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date lastTime;

    /** 请假原因 */
    @Excel(name = "请假原因")
    private String leaveReason;

    /** 请假表照片 */
    @Excel(name = "请假表照片")
    private String leaveForm;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 部门id */
    @Excel(name = "部门id")
    private Long deptId;

    /** 预留_A */
    @Excel(name = "预留_A")
    private String leaveReserveA;

    /** 预留_B */
    @Excel(name = "预留_B")
    private String leaveReserveB;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date creatTime;

    private List<Date> totalTime;

    private Long teacher;

    private Long manager;

    private Long dean;


    private SysUser user;

    private SysDept dept;


    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public Long getTeacher() {
        return teacher;
    }

    public void setTeacher(Long teacher) {
        this.teacher = teacher;
    }

    public Long getManager() {
        return manager;
    }

    public void setManager(Long manager) {
        this.manager = manager;
    }

    public Long getDean() {
        return dean;
    }

    public void setDean(Long dean) {
        this.dean = dean;
    }

    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }

    public SysDept getDept() {
        return dept;
    }

    public void setDept(SysDept dept) {
        this.dept = dept;
    }

    public Long getTimeType() {
        return timeType;
    }

    public void setTimeType(Long timeType) {
        this.timeType = timeType;
    }

    public List<Date> getTotalTime() {
        return totalTime;
    }

    public void setTotalTime(List<Date> totalTime) {
        this.totalTime = totalTime;
    }

    public void setLeaveId(Long leaveId)
    {
        this.leaveId = leaveId;
    }

    public Long getLeaveId()
    {
        return leaveId;
    }

    public void setLeaveType(Long leaveType)
    {
        this.leaveType = leaveType;
    }

    public Long getLeaveType()
    {
        return leaveType;
    }

    public void setApprovalStatus(Long approvalStatus)
    {
        this.approvalStatus = approvalStatus;
    }

    public Long getApprovalStatus()
    {
        return approvalStatus;
    }

    public void setFirstTime(Date firstTime)
    {
        this.firstTime = firstTime;
    }

    public Date getFirstTime()
    {
        return firstTime;
    }

    public void setLastTime(Date lastTime)
    {
        this.lastTime = lastTime;
    }

    public Date getLastTime()
    {
        return lastTime;
    }

    public void setLeaveReason(String leaveReason)
    {
        this.leaveReason = leaveReason;
    }

    public String getLeaveReason()
    {
        return leaveReason;
    }

    public void setLeaveForm(String leaveForm)
    {
        this.leaveForm = leaveForm;
    }

    public String getLeaveForm()
    {
        return leaveForm;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }

    public void setDeptId(Long deptId)
    {
        this.deptId = deptId;
    }

    public Long getDeptId()
    {
        return deptId;
    }

    public void setLeaveReserveA(String leaveReserveA)
    {
        this.leaveReserveA = leaveReserveA;
    }

    public String getLeaveReserveA()
    {
        return leaveReserveA;
    }

    public void setLeaveReserveB(String leaveReserveB)
    {
        this.leaveReserveB = leaveReserveB;
    }

    public String getLeaveReserveB()
    {
        return leaveReserveB;
    }

    @Override
    public String toString() {
        return "SysLeave{" +
                "leaveId=" + leaveId +
                ", leaveType=" + leaveType +
                ", approvalStatus=" + approvalStatus +
                ", timeType=" + timeType +
                ", firstTime=" + firstTime +
                ", lastTime=" + lastTime +
                ", leaveReason='" + leaveReason + '\'' +
                ", leaveForm='" + leaveForm + '\'' +
                ", userId=" + userId +
                ", deptId=" + deptId +
                ", leaveReserveA='" + leaveReserveA + '\'' +
                ", leaveReserveB='" + leaveReserveB + '\'' +
                ", creatTime=" + creatTime +
                ", totalTime=" + totalTime +
                ", teacher=" + teacher +
                ", manager=" + manager +
                ", dean=" + dean +
                ", user=" + user +
                ", dept=" + dept +
                '}';
    }
}
