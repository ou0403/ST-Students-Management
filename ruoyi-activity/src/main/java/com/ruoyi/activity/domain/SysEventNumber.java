package com.ruoyi.activity.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 行事历期数对象 sys_event_number
 *
 * @author ruoyi
 * @date 2025-04-15
 */
public class SysEventNumber extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 期数id */
    private Long numberId;

    /** 期数名称 */
    @Excel(name = "期数名称")
    private String number;

    /** 期数描述 */
    @Excel(name = "期数描述")
    private String numberDescribe;

    /** 总周数 */
    @Excel(name = "总周数")
    private Long numberWeeks;

    /** 开学日期(必须是周一) */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开学日期(必须是周一)", width = 30, dateFormat = "yyyy-MM-dd")
    private Date numberTime;

    /** 创建人id */
    @Excel(name = "创建人id")
    private Long userId;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date creatTime;

    private SysUser user;


    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }

    public void setNumberId(Long numberId)
    {
        this.numberId = numberId;
    }

    public Long getNumberId()
    {
        return numberId;
    }

    public void setNumber(String number)
    {
        this.number = number;
    }

    public String getNumber()
    {
        return number;
    }

    public void setNumberDescribe(String numberDescribe)
    {
        this.numberDescribe = numberDescribe;
    }

    public String getNumberDescribe()
    {
        return numberDescribe;
    }

    public void setNumberWeeks(Long numberWeeks)
    {
        this.numberWeeks = numberWeeks;
    }

    public Long getNumberWeeks()
    {
        return numberWeeks;
    }

    public void setNumberTime(Date numberTime)
    {
        this.numberTime = numberTime;
    }

    public Date getNumberTime()
    {
        return numberTime;
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
        return "SysEventNumber{" +
                "numberId=" + numberId +
                ", number='" + number + '\'' +
                ", numberDescribe='" + numberDescribe + '\'' +
                ", numberWeeks=" + numberWeeks +
                ", numberTime=" + numberTime +
                ", userId=" + userId +
                ", creatTime=" + creatTime +
                ", user=" + user +
                '}';
    }
}
