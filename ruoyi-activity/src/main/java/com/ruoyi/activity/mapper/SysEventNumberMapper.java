package com.ruoyi.activity.mapper;

import java.util.List;
import com.ruoyi.activity.domain.SysEventNumber;

/**
 * 行事历期数Mapper接口
 * 
 * @author ruoyi
 * @date 2025-04-15
 */
public interface SysEventNumberMapper 
{
    /**
     * 查询行事历期数
     * 
     * @param numberId 行事历期数主键
     * @return 行事历期数
     */
    public SysEventNumber selectSysEventNumberByNumberId(Long numberId);

    /**
     * 查询行事历期数列表
     * 
     * @param sysEventNumber 行事历期数
     * @return 行事历期数集合
     */
    public List<SysEventNumber> selectSysEventNumberList(SysEventNumber sysEventNumber);

    /**
     * 新增行事历期数
     * 
     * @param sysEventNumber 行事历期数
     * @return 结果
     */
    public int insertSysEventNumber(SysEventNumber sysEventNumber);

    /**
     * 修改行事历期数
     * 
     * @param sysEventNumber 行事历期数
     * @return 结果
     */
    public int updateSysEventNumber(SysEventNumber sysEventNumber);

    /**
     * 删除行事历期数
     * 
     * @param numberId 行事历期数主键
     * @return 结果
     */
    public int deleteSysEventNumberByNumberId(Long numberId);

    /**
     * 批量删除行事历期数
     * 
     * @param numberIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysEventNumberByNumberIds(Long[] numberIds);
}
