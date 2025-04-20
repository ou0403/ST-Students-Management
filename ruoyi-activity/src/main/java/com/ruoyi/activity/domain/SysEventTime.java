package com.ruoyi.activity.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 行事历周数时间对象 sys_event_time
 * 
 * @author greedy
 * @date 2025-04-15
 */
public class SysEventTime extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long timeId;

    /** 期数 */
    @Excel(name = "期数")
    private Long numberId;

    /** 周一日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "周一日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date mondayDate;

    /** 周天日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "周天日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date sundayDate;

    /** 周数 */
    @Excel(name = "周数")
    private Long eventWeeks;

    /** 创建人 */
    @Excel(name = "创建人")
    private Long userId;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date creatTime;

    private SysUser user;

    private SysEventNumber number;

    public SysEventNumber getNumber() {
        return number;
    }

    public void setNumber(SysEventNumber number) {
        this.number = number;
    }

    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }

    public void setTimeId(Long timeId)
    {
        this.timeId = timeId;
    }

    public Long getTimeId() 
    {
        return timeId;
    }

    public void setNumberId(Long numberId) 
    {
        this.numberId = numberId;
    }

    public Long getNumberId() 
    {
        return numberId;
    }

    public void setMondayDate(Date mondayDate) 
    {
        this.mondayDate = mondayDate;
    }

    public Date getMondayDate() 
    {
        return mondayDate;
    }

    public void setSundayDate(Date sundayDate) 
    {
        this.sundayDate = sundayDate;
    }

    public Date getSundayDate() 
    {
        return sundayDate;
    }

    public void setEventWeeks(Long eventWeeks) 
    {
        this.eventWeeks = eventWeeks;
    }

    public Long getEventWeeks() 
    {
        return eventWeeks;
    }

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public void setCreatTime(Date creatTime) 
    {
        this.creatTime = creatTime;
    }

    public Date getCreatTime() 
    {
        return creatTime;
    }

    @Override
    public String toString() {
        return "SysEventTime{" +
                "timeId=" + timeId +
                ", numberId=" + numberId +
                ", mondayDate=" + mondayDate +
                ", sundayDate=" + sundayDate +
                ", eventWeeks=" + eventWeeks +
                ", userId=" + userId +
                ", creatTime=" + creatTime +
                ", user=" + user +
                ", number=" + number +
                '}';
    }
}
