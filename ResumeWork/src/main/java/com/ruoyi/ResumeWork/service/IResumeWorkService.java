package com.ruoyi.ResumeWork.service;

import java.util.List;
import com.ruoyi.ResumeWork.domain.ResumeWork;

/**
 * 简历投递Service接口
 * 
 * @author ruoyi
 * @date 2025-04-08
 */
public interface IResumeWorkService 
{
    /**
     * 查询简历投递
     * 
     * @param id 简历投递主键
     * @return 简历投递
     */
    public ResumeWork selectResumeWorkById(Long id);

    /**
     * 查询简历投递列表
     * 
     * @param resumeWork 简历投递
     * @return 简历投递集合
     */
    public List<ResumeWork> selectResumeWorkList(ResumeWork resumeWork);

    /**
     * 新增简历投递
     * 
     * @param resumeWork 简历投递
     * @return 结果
     */
    public int insertResumeWork(ResumeWork resumeWork);

    /**
     * 修改简历投递
     * 
     * @param resumeWork 简历投递
     * @return 结果
     */
    public int updateResumeWork(ResumeWork resumeWork);

    /**
     * 批量删除简历投递
     * 
     * @param ids 需要删除的简历投递主键集合
     * @return 结果
     */
    public int deleteResumeWorkByIds(Long[] ids);

    /**
     * 删除简历投递信息
     * 
     * @param id 简历投递主键
     * @return 结果
     */
    public int deleteResumeWorkById(Long id);
}
