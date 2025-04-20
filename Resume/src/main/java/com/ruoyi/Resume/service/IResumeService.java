package com.ruoyi.Resume.service;

import java.util.List;
import com.ruoyi.Resume.domain.Resume;

/**
 * 简历管理Service接口
 * 
 * @author ruoyi
 * @date 2025-03-27
 */
public interface IResumeService 
{
    /**
     * 查询简历管理
     * 
     * @param id 简历管理主键
     * @return 简历管理
     */
    public Resume selectResumeById(Long id);

    /**
     * 查询简历管理列表
     * 
     * @param resume 简历管理
     * @return 简历管理集合
     */
    public List<Resume> selectResumeList(Resume resume);

    /**
     * 新增简历管理
     * 
     * @param resume 简历管理
     * @return 结果
     */
    public int insertResume(Resume resume);

    /**
     * 修改简历管理
     * 
     * @param resume 简历管理
     * @return 结果
     */
    public int updateResume(Resume resume);

    /**
     * 批量删除简历管理
     * 
     * @param ids 需要删除的简历管理主键集合
     * @return 结果
     */
    public int deleteResumeByIds(Long[] ids);

    /**
     * 删除简历管理信息
     * 
     * @param id 简历管理主键
     * @return 结果
     */
    public int deleteResumeById(Long id);
}
