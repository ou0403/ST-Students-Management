package com.ruoyi.forum.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 帖子的评论对象 comment
 * 
 * @author xcl
 * @date 2025-04-16
 */
public class Comment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 所评论帖子的id */

    @Excel(name = "所评论帖子的id")
    private Long forumId;

    /** 发表评论用户的id */
    @Excel(name = "发表评论用户的id")
    private Long userId;

    /** 所评论用户的部门id */
    @Excel(name = "所评论用户的部门id")
    private Long deptId;

    /** 评论的具体内容 */
    @Excel(name = "评论的具体内容")
    private String content;

    /** 帖子状态 */
    @Excel(name = "帖子状态")
    private String status;

    /** 备注1 */
    @Excel(name = "备注1")
    private String remark1;

    /** 备注2 */
    @Excel(name = "备注2")
    private String remark2;

    /** 备注3 */
    @Excel(name = "备注3")
    private String remark3;

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    private String postId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }


    public void setForumId(Long forumId) 
    {
        this.forumId = forumId;
    }

    public Long getForumId() 
    {
        return forumId;
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

    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
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

    public void setRemark3(String remark3) 
    {
        this.remark3 = remark3;
    }

    public String getRemark3() 
    {
        return remark3;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("forumId", getForumId())
            .append("userId", getUserId())
            .append("deptId", getDeptId())
            .append("content", getContent())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("remark1", getRemark1())
            .append("remark2", getRemark2())
            .append("remark3", getRemark3())
            .toString();
    }
}
