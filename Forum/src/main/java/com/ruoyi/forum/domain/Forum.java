package com.ruoyi.forum.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 知识论坛对象 forum
 * 
 * @author mqs
 * @date 2025-04-14
 */
public class Forum extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 帖子状态 */
    @Excel(name = "帖子状态")
    private String status;

    /** 备注2 */
    @Excel(name = "备注2")
    private String remark1;

    /** 备注3 */
    @Excel(name = "备注3")
    private String remark2;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }

    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }

    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
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
            .append("username", getUsername())
            .append("content", getContent())
            .append("title", getTitle())
            .append("status", getStatus())
            .append("remark1", getRemark1())
            .append("remark2", getRemark2())
            .append("remark", getRemark())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
