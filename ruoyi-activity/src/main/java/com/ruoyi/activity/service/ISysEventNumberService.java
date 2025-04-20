package com.ruoyi.activity.service;

import java.util.List;
import com.ruoyi.activity.domain.SysEventNumber;

/**
 * 行事历期数Service接口
 * 
 * @author ruoyi
 * @date 2025-04-15
 */
public interface ISysEventNumberService 
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

    int insertSysEventNumbers(SysEventNumber sysEventNumber, Long userId);

    /**
     * 修改行事历期数
     * 
     * @param sysEventNumber 行事历期数
     * @return 结果
     */
    public int updateSysEventNumber(SysEventNumber sysEventNumber);

    /**
     * 批量删除行事历期数
     * 
     * @param numberIds 需要删除的行事历期数主键集合
     * @return 结果
     */
    public int deleteSysEventNumberByNumberIds(Long[] numberIds);

    /**
     * 删除行事历期数信息
     * 
     * @param numberId 行事历期数主键
     * @return 结果
     */
    public int deleteSysEventNumberByNumberId(Long numberId);
}
