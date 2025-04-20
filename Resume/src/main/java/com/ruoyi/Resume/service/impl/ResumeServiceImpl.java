package com.ruoyi.Resume.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.Resume.mapper.ResumeMapper;
import com.ruoyi.Resume.domain.Resume;
import com.ruoyi.Resume.service.IResumeService;

/**
 * 简历管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-03-27
 */
@Service
public class ResumeServiceImpl implements IResumeService 
{
    @Autowired
    private ResumeMapper resumeMapper;

    /**
     * 查询简历管理
     * 
     * @param id 简历管理主键
     * @return 简历管理
     */
    @Override
    public Resume selectResumeById(Long id)
    {
        return resumeMapper.selectResumeById(id);
    }

    /**
     * 查询简历管理列表
     * 
     * @param resume 简历管理
     * @return 简历管理
     */
    @Override
    public List<Resume> selectResumeList(Resume resume)
    {
        return resumeMapper.selectResumeList(resume);
    }

    /**
     * 新增简历管理
     * 
     * @param resume 简历管理
     * @return 结果
     */
    @Override
    public int insertResume(Resume resume)
    {
        resume.setCreateTime(DateUtils.getNowDate());
        return resumeMapper.insertResume(resume);
    }

    /**
     * 修改简历管理
     * 
     * @param resume 简历管理
     * @return 结果
     */
    @Override
    public int updateResume(Resume resume)
    {
        resume.setUpdateTime(DateUtils.getNowDate());
        return resumeMapper.updateResume(resume);
    }

    /**
     * 批量删除简历管理
     * 
     * @param ids 需要删除的简历管理主键
     * @return 结果
     */
    @Override
    public int deleteResumeByIds(Long[] ids)
    {
        return resumeMapper.deleteResumeByIds(ids);
    }

    /**
     * 删除简历管理信息
     * 
     * @param id 简历管理主键
     * @return 结果
     */
    @Override
    public int deleteResumeById(Long id)
    {
        return resumeMapper.deleteResumeById(id);
    }
}
