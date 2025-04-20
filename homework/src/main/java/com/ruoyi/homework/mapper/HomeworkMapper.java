package com.ruoyi.homework.mapper;

import java.util.List;
import com.ruoyi.homework.domain.Homework;
import org.apache.ibatis.annotations.Mapper;

@Mapper
/**
 * 发布作业Mapper接口
 * 
 * @author ruoyi
 * @date 2025-03-15
 */
public interface HomeworkMapper 
{
    /**
     * 查询发布作业
     * 
     * @param id 发布作业主键
     * @return 发布作业
     */
    public Homework selectHomeworkById(Long id);

    /**
     * 查询发布作业列表
     * 
     * @param homework 发布作业
     * @return 发布作业集合
     */
    public List<Homework> selectHomeworkList(Homework homework);

    /**
     * 新增发布作业
     * 
     * @param homework 发布作业
     * @return 结果
     */
    public int insertHomework(Homework homework);

    /**
     * 修改发布作业
     * 
     * @param homework 发布作业
     * @return 结果
     */
    public int updateHomework(Homework homework);

    /**
     * 删除发布作业
     * 
     * @param id 发布作业主键
     * @return 结果
     */
    public int deleteHomeworkById(Long id);

    /**
     * 批量删除发布作业
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHomeworkByIds(Long[] ids);
}
