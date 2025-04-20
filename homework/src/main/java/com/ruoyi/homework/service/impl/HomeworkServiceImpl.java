package com.ruoyi.homework.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.homework.mapper.HomeworkMapper;
import com.ruoyi.homework.domain.Homework;
import com.ruoyi.homework.service.IHomeworkService;

/**
 * 发布作业Service业务层处理
 *
 * @author ruoyi
 * @date 2025-03-15
 */
@Service
public class HomeworkServiceImpl implements IHomeworkService
{
    @Autowired
    private HomeworkMapper homeworkMapper;

    /**
     * 查询发布作业
     *
     * @param id 发布作业主键
     * @return 发布作业
     */
    @Override
    public Homework selectHomeworkById(Long id)
    {
        return homeworkMapper.selectHomeworkById(id);
    }

    /**
     * 查询发布作业列表
     *
     * @param homework 发布作业
     * @return 发布作业
     */
    @Override
    public List<Homework> selectHomeworkList(Homework homework)
    {
        return homeworkMapper.selectHomeworkList(homework);
    }

    /**
     * 新增发布作业
     *
     * @param homework 发布作业
     * @return 结果
     */
    @Override
    public int insertHomework(Homework homework)
    {
        homework.setCreateTime(DateUtils.getNowDate());
        return homeworkMapper.insertHomework(homework);
    }

    /**
     * 修改发布作业
     *
     * @param homework 发布作业
     * @return 结果
     */
    @Override
    public int updateHomework(Homework homework)
    {
        homework.setUpdateTime(DateUtils.getNowDate());
        return homeworkMapper.updateHomework(homework);
    }

    /**
     * 批量删除发布作业
     *
     * @param ids 需要删除的发布作业主键
     * @return 结果
     */
    @Override
    public int deleteHomeworkByIds(Long[] ids)
    {
        return homeworkMapper.deleteHomeworkByIds(ids);
    }

    /**
     * 删除发布作业信息
     *
     * @param id 发布作业主键
     * @return 结果
     */
    @Override
    public int deleteHomeworkById(Long id)
    {
        return homeworkMapper.deleteHomeworkById(id);
    }

    @Override
    public Homework selectTerAll(Long userId) {
        return homeworkMapper.selectHomeworkById(userId);
    }
}
