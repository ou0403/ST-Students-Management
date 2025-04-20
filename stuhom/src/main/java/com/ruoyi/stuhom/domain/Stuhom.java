package com.ruoyi.stuhom.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 提交作业对象 student_homework
 *
 * @author zs
 * @date 2025-03-18
 */
public class Stuhom extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 作业ID */
    @Excel(name = "作业ID")
    private Long homeworkId;

    /** 学生ID */
    @Excel(name = "学生ID")
    private Long studentId;

    /** 提交内容 */
    @Excel(name = "提交内容")
    private String submission;

    /** 提交时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "提交时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date submissionTime;

    /** 批改情况，默认未批改 */
    @Excel(name = "批改情况，默认未批改")
    private Integer graded;

    /** 得分，支持最多5位数字，其中2位小数 */
    @Excel(name = "得分，支持最多5位数字，其中2位小数")
    private BigDecimal score;

    /** 批改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "批改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date gradeTime;

    /** 备注2 */
    @Excel(name = "备注2")
    private String remark1;

    /** 备注3 */
    @Excel(name = "备注3")
    private String remark2;

    /** 部门id */
    @Excel(name = "部门id")
    private String department;



    private String title;

    /** 学期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "学期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date timeLimit;

    private String nickName;

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setHomeworkId(Long homeworkId)
    {
        this.homeworkId = homeworkId;
    }

    public Long getHomeworkId()
    {
        return homeworkId;
    }

    public void setStudentId(Long studentId)
    {
        this.studentId = studentId;
    }

    public Long getStudentId()
    {
        return studentId;
    }

    public void setSubmission(String submission)
    {
        this.submission = submission;
    }

    public String getSubmission()
    {
        return submission;
    }

    public void setSubmissionTime(Date submissionTime)
    {
        this.submissionTime = submissionTime;
    }

    public Date getSubmissionTime()
    {
        return submissionTime;
    }

    public void setGraded(Integer graded)
    {
        this.graded = graded;
    }

    public Integer getGraded()
    {
        return graded;
    }

    public void setScore(BigDecimal score)
    {
        this.score = score;
    }

    public BigDecimal getScore()
    {
        return score;
    }

    public void setGradeTime(Date gradeTime)
    {
        this.gradeTime = gradeTime;
    }

    public Date getGradeTime()
    {
        return gradeTime;
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

    public void setDepartment(String department)
    {
        this.department = department;
    }

    public String getDepartment()
    {
        return department;
    }

    public void setTimeLimit(Date timeLimit)
    {
        this.timeLimit = timeLimit;
    }

    public Date getTimeLimit()
    {
        return timeLimit;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("homeworkId", getHomeworkId())
            .append("studentId", getStudentId())
            .append("submission", getSubmission())
            .append("submissionTime", getSubmissionTime())
            .append("graded", getGraded())
            .append("score", getScore())
            .append("gradeTime", getGradeTime())
            .append("remark", getRemark())
            .append("remark1", getRemark1())
            .append("remark2", getRemark2())
            .append("department", getDepartment())
            .append("timeLimit", getTimeLimit())
                .append("title", getTitle())
                .append("nickName", getNickName())

            .toString();
    }
}
