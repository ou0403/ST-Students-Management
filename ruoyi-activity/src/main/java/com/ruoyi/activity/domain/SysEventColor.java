package com.ruoyi.activity.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 行事历部门颜色对象 sys_event_color
 * 
 * @author greedy
 * @date 2025-04-15
 */
public class SysEventColor extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long colorId;

    /** 期数id */
    @Excel(name = "期数id")
    private Long numberId;

    /** 部门名称 */
    @Excel(name = "部门名称")
    private String departmentName;

    /** 部门颜色 */
    @Excel(name = "部门颜色")
    private String departmentColor;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date creatTime;

    private SysUser user;

    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }

    public void setColorId(Long colorId)
    {
        this.colorId = colorId;
    }

    public Long getColorId() 
    {
        return colorId;
    }

    public void setNumberId(Long numberId) 
    {
        this.numberId = numberId;
    }

    public Long getNumberId() 
    {
        return numberId;
    }

    public void setDepartmentName(String departmentName) 
    {
        this.departmentName = departmentName;
    }

    public String getDepartmentName() 
    {
        return departmentName;
    }

    public void setDepartmentColor(String departmentColor) 
    {
        this.departmentColor = departmentColor;
    }

    public String getDepartmentColor() 
    {
        return departmentColor;
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
        return "SysEventColor{" +
                "colorId=" + colorId +
                ", numberId=" + numberId +
                ", departmentName='" + departmentName + '\'' +
                ", departmentColor='" + departmentColor + '\'' +
                ", userId=" + userId +
                ", creatTime=" + creatTime +
                ", user=" + user +
                '}';
    }
}
