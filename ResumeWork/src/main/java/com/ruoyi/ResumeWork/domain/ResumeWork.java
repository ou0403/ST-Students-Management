package com.ruoyi.ResumeWork.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 简历投递对象 resume_work
 * 
 * @author ruoyi
 * @date 2025-04-08
 */
public class ResumeWork extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 公司名称 */
    @Excel(name = "公司名称")
    private String homeworkName;

    /** 简历状态 */
    @Excel(name = "简历状态")
    private String homeworkStatic;

    /** 工作岗位 */
    @Excel(name = "工作岗位")
    private String workPost;

    /** 备注1 */
    @Excel(name = "备注1")
    private String remark1;

    /** 备注2 */
    @Excel(name = "备注2")
    private String remark2;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setHomeworkName(String homeworkName) 
    {
        this.homeworkName = homeworkName;
    }

    public String getHomeworkName() 
    {
        return homeworkName;
    }

    public void setHomeworkStatic(String homeworkStatic) 
    {
        this.homeworkStatic = homeworkStatic;
    }

    public String getHomeworkStatic() 
    {
        return homeworkStatic;
    }

    public void setWorkPost(String workPost) 
    {
        this.workPost = workPost;
    }

    public String getWorkPost() 
    {
        return workPost;
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
            .append("homeworkName", getHomeworkName())
            .append("homeworkStatic", getHomeworkStatic())
            .append("workPost", getWorkPost())
            .append("remark", getRemark())
            .append("remark1", getRemark1())
            .append("remark2", getRemark2())
            .toString();
    }
}
