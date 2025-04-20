package com.ruoyi.WeeklyDiary.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 周记任务发布对象 student_weeklydiary
 * 
 * @author 前
 * @date 2025-04-16
 */
public class StudentWeeklydiary extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 周记id */
    private Long weeklydiaryId;

    /** 学生id */
    private Long studentId;

    /** 老师id */
    private Long teacherId;

    /** 部门id */
    private Long departmentId;

    /** 权限 */
    private String dept;

    /** 周记标题 */
    @Excel(name = "周记标题")
    private String title;

    /** 富文本框里的周记正文 */
    @Excel(name = "富文本框里的周记正文")
    private String text;

    /** 文件地址 */
    @Excel(name = "文件地址")
    private String countent;

    /** 是否为优秀周记 */
    @Excel(name = "是否为优秀周记")
    private String isnice;

    /** 上传时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "上传时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date uploadTime;

    /** 备注1 */
    @Excel(name = "备注1")
    private String remarks1;

    /** 备注2 */
    @Excel(name = "备注2")
    private String remarks2;

    /** 备注3 */
    @Excel(name = "备注3")
    private String remarks3;

    public void setWeeklydiaryId(Long weeklydiaryId) 
    {
        this.weeklydiaryId = weeklydiaryId;
    }

    public Long getWeeklydiaryId() 
    {
        return weeklydiaryId;
    }

    public void setStudentId(Long studentId) 
    {
        this.studentId = studentId;
    }

    public Long getStudentId() 
    {
        return studentId;
    }

    public void setTeacherId(Long teacherId) 
    {
        this.teacherId = teacherId;
    }

    public Long getTeacherId() 
    {
        return teacherId;
    }

    public void setDepartmentId(Long departmentId) 
    {
        this.departmentId = departmentId;
    }

    public Long getDepartmentId() 
    {
        return departmentId;
    }

    public void setDept(String dept) 
    {
        this.dept = dept;
    }

    public String getDept() 
    {
        return dept;
    }

    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }

    public void setText(String text) 
    {
        this.text = text;
    }

    public String getText() 
    {
        return text;
    }

    public void setCountent(String countent) 
    {
        this.countent = countent;
    }

    public String getCountent() 
    {
        return countent;
    }

    public void setIsnice(String isnice) 
    {
        this.isnice = isnice;
    }

    public String getIsnice() 
    {
        return isnice;
    }

    public void setUploadTime(Date uploadTime) 
    {
        this.uploadTime = uploadTime;
    }

    public Date getUploadTime() 
    {
        return uploadTime;
    }

    public void setRemarks1(String remarks1) 
    {
        this.remarks1 = remarks1;
    }

    public String getRemarks1() 
    {
        return remarks1;
    }

    public void setRemarks2(String remarks2) 
    {
        this.remarks2 = remarks2;
    }

    public String getRemarks2() 
    {
        return remarks2;
    }

    public void setRemarks3(String remarks3) 
    {
        this.remarks3 = remarks3;
    }

    public String getRemarks3() 
    {
        return remarks3;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("weeklydiaryId", getWeeklydiaryId())
            .append("studentId", getStudentId())
            .append("teacherId", getTeacherId())
            .append("departmentId", getDepartmentId())
            .append("dept", getDept())
            .append("title", getTitle())
            .append("text", getText())
            .append("countent", getCountent())
            .append("isnice", getIsnice())
            .append("uploadTime", getUploadTime())
            .append("remarks1", getRemarks1())
            .append("remarks2", getRemarks2())
            .append("remarks3", getRemarks3())
            .toString();
    }
}
