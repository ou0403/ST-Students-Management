package com.ruoyi.homework.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 发布作业对象 homework
 *
 * @author ruoyi
 * @date 2025-03-15
 */
public class Homework extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 作业标题 */
    @Excel(name = "作业标题")
    private String title;

    /** 作业内容 */
    @Excel(name = "作业内容")
    private String content;

    /** 截止日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "截止日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date dueDate;

    /** 发布教师ID */
    @Excel(name = "发布教师ID")
    private Long teacherId;

    /** 备注2 */
    @Excel(name = "备注2")
    private String remark1;

    /** 备注3 */
    @Excel(name = "备注3")
    private String remark2;

    /** 用户昵称 */
    @Excel(name = "用户昵称")
    private String nickName;

    /** 用户ID */
    @Excel(name = "用户序号", type = Excel.Type.EXPORT, cellType = Excel.ColumnType.NUMERIC, prompt = "用户编号")
    private Long userId;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    /** 用户账号 */
    @Excel(name = "登录名称")
    private String userName;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }

    public void setDueDate(Date dueDate)
    {
        this.dueDate = dueDate;
    }

    public Date getDueDate()
    {
        return dueDate;
    }

    public void setTeacherId(Long teacherId)
    {
        this.teacherId = teacherId;
    }

    public Long getTeacherId()
    {
        return teacherId;
    }

    public void setRemark1(String remark1)
    {
        this.remark1 = remark1;
    }

    public String getRemark1()
    {
        return remark1;
    }

    public void setRemark2(String remark2)
    {
        this.remark2 = remark2;
    }

    public String getRemark2()
    {
        return remark2;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("content", getContent())
            .append("dueDate", getDueDate())
            .append("teacherId", getTeacherId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("remark1", getRemark1())
            .append("remark2", getRemark2())
                .append("userName", getUserName())
                .append("nickName", getNickName())
            .toString();
    }
}
