package com.ruoyi.ResumeWork.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ResumeWork.mapper.ResumeWorkMapper;
import com.ruoyi.ResumeWork.domain.ResumeWork;
import com.ruoyi.ResumeWork.service.IResumeWorkService;

/**
 * 简历投递Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-04-08
 */
@Service
public class ResumeWorkServiceImpl implements IResumeWorkService 
{
    @Autowired
    private ResumeWorkMapper resumeWorkMapper;

    /**
     * 查询简历投递
     * 
     * @param id 简历投递主键
     * @return 简历投递
     */
    @Override
    public ResumeWork selectResumeWorkById(Long id)
    {
        return resumeWorkMapper.selectResumeWorkById(id);
    }

    /**
     * 查询简历投递列表
     * 
     * @param resumeWork 简历投递
     * @return 简历投递
     */
    @Override
    public List<ResumeWork> selectResumeWorkList(ResumeWork resumeWork)
    {
        return resumeWorkMapper.selectResumeWorkList(resumeWork);
    }

    /**
     * 新增简历投递
     * 
     * @param resumeWork 简历投递
     * @return 结果
     */
    @Override
    public int insertResumeWork(ResumeWork resumeWork)
    {
        return resumeWorkMapper.insertResumeWork(resumeWork);
    }

    /**
     * 修改简历投递
     * 
     * @param resumeWork 简历投递
     * @return 结果
     */
    @Override
    public int updateResumeWork(ResumeWork resumeWork)
    {
        return resumeWorkMapper.updateResumeWork(resumeWork);
    }

    /**
     * 批量删除简历投递
     * 
     * @param ids 需要删除的简历投递主键
     * @return 结果
     */
    @Override
    public int deleteResumeWorkByIds(Long[] ids)
    {
        return resumeWorkMapper.deleteResumeWorkByIds(ids);
    }

    /**
     * 删除简历投递信息
     * 
     * @param id 简历投递主键
     * @return 结果
     */
    @Override
    public int deleteResumeWorkById(Long id)
    {
        return resumeWorkMapper.deleteResumeWorkById(id);
    }
}
