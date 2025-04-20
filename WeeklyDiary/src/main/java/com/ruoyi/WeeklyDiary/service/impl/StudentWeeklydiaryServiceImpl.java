package com.ruoyi.WeeklyDiary.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.WeeklyDiary.mapper.StudentWeeklydiaryMapper;
import com.ruoyi.WeeklyDiary.domain.StudentWeeklydiary;
import com.ruoyi.WeeklyDiary.service.IStudentWeeklydiaryService;

/**
 * 周记任务发布Service业务层处理
 *
 * @author 前
 * @date 2025-04-16
 */
@Service
public class StudentWeeklydiaryServiceImpl implements IStudentWeeklydiaryService
{
    @Autowired
    private StudentWeeklydiaryMapper studentWeeklydiaryMapper;

    /**
     * 查询周记任务发布
     *
     * @param weeklydiaryId 周记任务发布主键
     * @return 周记任务发布
     */
    @Override
    public StudentWeeklydiary selectStudentWeeklydiaryByWeeklydiaryId(Long weeklydiaryId)
    {
        return studentWeeklydiaryMapper.selectStudentWeeklydiaryByWeeklydiaryId(weeklydiaryId);
    }

    /**
     * 查询周记任务发布列表
     *
     * @param studentWeeklydiary 周记任务发布
     * @return 周记任务发布
     */
    @Override
    public List<StudentWeeklydiary> selectStudentWeeklydiaryList(StudentWeeklydiary studentWeeklydiary)
    {
        return studentWeeklydiaryMapper.selectStudentWeeklydiaryList(studentWeeklydiary);
    }

    /**
     * 新增周记任务发布
     *
     * @param studentWeeklydiary 周记任务发布
     * @return 结果
     */
    @Override
    public int insertStudentWeeklydiary(StudentWeeklydiary studentWeeklydiary)
    {
        return studentWeeklydiaryMapper.insertStudentWeeklydiary(studentWeeklydiary);
    }

    /**
     * 修改周记任务发布
     *
     * @param studentWeeklydiary 周记任务发布
     * @return 结果
     */
    @Override
    public int updateStudentWeeklydiary(StudentWeeklydiary studentWeeklydiary)
    {
        return studentWeeklydiaryMapper.updateStudentWeeklydiary(studentWeeklydiary);
    }

    /**
     * 批量删除周记任务发布
     *
     * @param weeklydiaryIds 需要删除的周记任务发布主键
     * @return 结果
     */
    @Override
    public int deleteStudentWeeklydiaryByWeeklydiaryIds(Long[] weeklydiaryIds)
    {
        return studentWeeklydiaryMapper.deleteStudentWeeklydiaryByWeeklydiaryIds(weeklydiaryIds);
    }

    /**
     * 删除周记任务发布信息
     *
     * @param weeklydiaryId 周记任务发布主键
     * @return 结果
     */
    @Override
    public int deleteStudentWeeklydiaryByWeeklydiaryId(Long weeklydiaryId)
    {
        return studentWeeklydiaryMapper.deleteStudentWeeklydiaryByWeeklydiaryId(weeklydiaryId);
    }
}
