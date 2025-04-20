package com.ruoyi.ResumeWork.mapper;

import java.util.List;
import com.ruoyi.ResumeWork.domain.ResumeWork;

/**
 * 简历投递Mapper接口
 * 
 * @author ruoyi
 * @date 2025-04-08
 */
public interface ResumeWorkMapper 
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
     * 删除简历投递
     * 
     * @param id 简历投递主键
     * @return 结果
     */
    public int deleteResumeWorkById(Long id);

    /**
     * 批量删除简历投递
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteResumeWorkByIds(Long[] ids);
}
