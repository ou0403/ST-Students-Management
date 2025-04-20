package com.ruoyi.Resume.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 简历管理对象 resume
 *
 * @author ruoyi
 * @date 2025-03-29
 */
public class Resume extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 简历id */
    private Long id;

    /** 学生id */
    @Excel(name = "学生id")
    private Long stuId;

    /** 简历 */
    @Excel(name = "简历")
    private String notes;

    /** 简历简介(这里作为求职类型) */
    @Excel(name = "简历简介(这里作为求职类型)")
    private String resumeSummary;

    /** 部门id */
    @Excel(name = "部门id")
    private Long deptId;



    /** 用户账号 */
    @Excel(name = "登录名称")
    private String userName;

    /** 学生所属部门id */
    @Excel(name = "学生所属部门id")
    private Long stuDeptId;
    /** 老师是1学生是0 */
    @Excel(name = "老师是1学生是0")
    private String qufen;

    public String getQufen() {
        return qufen;
    }

    public void setQufen(String qufen) {
        this.qufen = qufen;
    }

    public Long getStuDeptId() {
        return stuDeptId;
    }

    public void setStuDeptId(Long stuDeptId) {
        this.stuDeptId = stuDeptId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setStuId(Long stuId)
    {
        this.stuId = stuId;
    }

    public Long getStuId()
    {
        return stuId;
    }

    public void setNotes(String notes)
    {
        this.notes = notes;
    }

    public String getNotes()
    {
        return notes;
    }

    public void setResumeSummary(String resumeSummary)
    {
        this.resumeSummary = resumeSummary;
    }

    public String getResumeSummary()
    {
        return resumeSummary;
    }

    public void setDeptId(Long deptId)
    {
        this.deptId = deptId;
    }

    public Long getDeptId()
    {
        return deptId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("stuId", getStuId())
                .append("notes", getNotes())
                .append("remark", getRemark())
                .append("resumeSummary", getResumeSummary())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("deptId", getDeptId())
                .append("userName", getUserName())
                .append("stuDeptId", getStuDeptId())
                .toString();
    }
}
