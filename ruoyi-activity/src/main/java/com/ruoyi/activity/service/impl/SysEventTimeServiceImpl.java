package com.ruoyi.activity.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.activity.mapper.SysEventTimeMapper;
import com.ruoyi.activity.domain.SysEventTime;
import com.ruoyi.activity.service.ISysEventTimeService;

/**
 * 行事历周数时间Service业务层处理
 * 
 * @author greedy
 * @date 2025-04-15
 */
@Service
public class SysEventTimeServiceImpl implements ISysEventTimeService 
{
    @Autowired
    private SysEventTimeMapper sysEventTimeMapper;

    /**
     * 查询行事历周数时间
     * 
     * @param timeId 行事历周数时间主键
     * @return 行事历周数时间
     */
    @Override
    public SysEventTime selectSysEventTimeByTimeId(Long timeId)
    {
        return sysEventTimeMapper.selectSysEventTimeByTimeId(timeId);
    }

    /**
     * 查询行事历周数时间列表
     * 
     * @param sysEventTime 行事历周数时间
     * @return 行事历周数时间
     */
    @Override
    public List<SysEventTime> selectSysEventTimeList(SysEventTime sysEventTime)
    {
        return sysEventTimeMapper.selectSysEventTimeList(sysEventTime);
    }

    /**
     * 查询行事历周数时间
     *
     * @param sysEventTime 行事历周数时间
     * @return 行事历周数时间
     */
    @Override
    public SysEventTime selectSysEventTimeByTime(SysEventTime sysEventTime)
    {
        return sysEventTimeMapper.selectSysEventTimeByTime(sysEventTime);
    }

    /**
     * 新增行事历周数时间
     * 
     * @param sysEventTime 行事历周数时间
     * @return 结果
     */
    @Override
    public int insertSysEventTime(SysEventTime sysEventTime)
    {
        return sysEventTimeMapper.insertSysEventTime(sysEventTime);
    }

    /**
     * 修改行事历周数时间
     * 
     * @param sysEventTime 行事历周数时间
     * @return 结果
     */
    @Override
    public int updateSysEventTime(SysEventTime sysEventTime)
    {
        return sysEventTimeMapper.updateSysEventTime(sysEventTime);
    }

    /**
     * 批量删除行事历周数时间
     * 
     * @param timeIds 需要删除的行事历周数时间主键
     * @return 结果
     */
    @Override
    public int deleteSysEventTimeByTimeIds(Long[] timeIds)
    {
        return sysEventTimeMapper.deleteSysEventTimeByTimeIds(timeIds);
    }

    /**
     * 删除行事历周数时间信息
     * 
     * @param timeId 行事历周数时间主键
     * @return 结果
     */
    @Override
    public int deleteSysEventTimeByTimeId(Long timeId)
    {
        return sysEventTimeMapper.deleteSysEventTimeByTimeId(timeId);
    }
}
