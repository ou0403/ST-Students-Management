package com.ruoyi.WeeklyDiary.service;

import java.util.List;
import com.ruoyi.WeeklyDiary.domain.StudentWeeklydiary;

/**
 * 周记任务发布Service接口
 *
 * @author 前
 * @date 2025-04-16
 */
public interface IStudentWeeklydiaryService
{
    /**
     * 查询周记任务发布
     *
     * @param weeklydiaryId 周记任务发布主键
     * @return 周记任务发布
     */
    public StudentWeeklydiary selectStudentWeeklydiaryByWeeklydiaryId(Long weeklydiaryId);


//    /**
//     *
//     *
//     *
//     *
//     * @return 周记发布数量统计
//     */
//    public int selectWeeklyDiaryStats();

    /**
     * 查询周记任务发布列表
     *
     * @param studentWeeklydiary 周记任务发布
     * @return 周记任务发布集合
     */
    public List<StudentWeeklydiary> selectStudentWeeklydiaryList(StudentWeeklydiary studentWeeklydiary);

    /**
     * 新增周记任务发布
     *
     * @param studentWeeklydiary 周记任务发布
     * @return 结果
     */
    public int insertStudentWeeklydiary(StudentWeeklydiary studentWeeklydiary);

    /**
     * 修改周记任务发布
     *
     * @param studentWeeklydiary 周记任务发布
     * @return 结果
     */
    public int updateStudentWeeklydiary(StudentWeeklydiary studentWeeklydiary);

    /**
     * 批量删除周记任务发布
     *
     * @param weeklydiaryIds 需要删除的周记任务发布主键集合
     * @return 结果
     */
    public int deleteStudentWeeklydiaryByWeeklydiaryIds(Long[] weeklydiaryIds);





    /**
     * 删除周记任务发布信息
     *
     * @param weeklydiaryId 周记任务发布主键
     * @return 结果
     */
    public int deleteStudentWeeklydiaryByWeeklydiaryId(Long weeklydiaryId);
}
