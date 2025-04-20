package com.ruoyi.stuhom.mapper;

import java.util.List;
import com.ruoyi.stuhom.domain.Stuhom;

/**
 * 提交作业Mapper接口
 *
 * @author zs
 * @date 2025-03-18
 */
public interface StuHomMapper
{
    /**
     * 查询提交作业
     *
     * @param id 提交作业主键
     * @return 提交作业
     */
    public Stuhom selectstuhomById(Long id);

    /**
     * 查询提交作业列表
     *
     * @param stuhom 提交作业
     * @return 提交作业集合
     */
    public List<Stuhom> selectstuhomList(Stuhom stuhom);

    /**
     * 新增提交作业
     *
     * @param stuhom 提交作业
     * @return 结果
     */
    public int insertstuhom(Stuhom stuhom);

    /**
     * 修改提交作业
     *
     * @param stuhom 提交作业
     * @return 结果
     */
    public int updatestuhom(Stuhom stuhom);

    /**
     * 删除提交作业
     *
     * @param id 提交作业主键
     * @return 结果
     */
    public int deletestuhomById(Long id);

    /**
     * 批量删除提交作业
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletestuhomByIds(Long[] ids);
}
