package com.ruoyi.stuhom.service.impl;

import java.util.List;

import com.ruoyi.stuhom.mapper.StuHomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.stuhom.domain.Stuhom;
import com.ruoyi.stuhom.service.IstuhomService;

/**
 * 提交作业Service业务层处理
 *
 * @author zs
 * @date 2025-03-18
 */
@Service
public class StuhomServiceImpl implements IstuhomService
{
    @Autowired
    private StuHomMapper stuhomMapper;

    /**
     * 查询提交作业
     *
     * @param id 提交作业主键
     * @return 提交作业
     */
    @Override
    public Stuhom selectstuhomById(Long id)
    {
        return stuhomMapper.selectstuhomById(id);
    }

    /**
     * 查询提交作业列表
     *
     * @param stuhom 提交作业
     * @return 提交作业
     */
    @Override
    public List<Stuhom> selectstuhomList(Stuhom stuhom)
    {
        return stuhomMapper.selectstuhomList(stuhom);
    }

    /**
     * 新增提交作业
     *
     * @param stuhom 提交作业
     * @return 结果
     */
    @Override
    public int insertstuhom(Stuhom stuhom)
    {
        return stuhomMapper.insertstuhom(stuhom);
    }

    /**
     * 修改提交作业
     *
     * @param stuhom 提交作业
     * @return 结果
     */
    @Override
    public int updatestuhom(Stuhom stuhom)
    {
        return stuhomMapper.updatestuhom(stuhom);
    }

    /**
     * 批量删除提交作业
     *
     * @param ids 需要删除的提交作业主键
     * @return 结果
     */
    @Override
    public int deletestuhomByIds(Long[] ids)
    {
        return stuhomMapper.deletestuhomByIds(ids);
    }

    /**
     * 删除提交作业信息
     *
     * @param id 提交作业主键
     * @return 结果
     */
    @Override
    public int deletestuhomById(Long id)
    {
        return stuhomMapper.deletestuhomById(id);
    }
}
