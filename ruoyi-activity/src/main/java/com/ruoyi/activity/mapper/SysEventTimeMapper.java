package com.ruoyi.activity.mapper;

import java.util.List;
import com.ruoyi.activity.domain.SysEventTime;

/**
 * 行事历周数时间Mapper接口
 * 
 * @author greedy
 * @date 2025-04-15
 */
public interface SysEventTimeMapper 
{
    /**
     * 查询行事历周数时间
     * 
     * @param timeId 行事历周数时间主键
     * @return 行事历周数时间
     */
    public SysEventTime selectSysEventTimeByTimeId(Long timeId);

    /**
     * 查询行事历周数时间列表
     * 
     * @param sysEventTime 行事历周数时间
     * @return 行事历周数时间集合
     */
    public List<SysEventTime> selectSysEventTimeList(SysEventTime sysEventTime);

    public SysEventTime selectSysEventTimeByTime(SysEventTime sysEventTime);

    /**
     * 新增行事历周数时间
     * 
     * @param sysEventTime 行事历周数时间
     * @return 结果
     */
    public int insertSysEventTime(SysEventTime sysEventTime);

    /**
     * 修改行事历周数时间
     * 
     * @param sysEventTime 行事历周数时间
     * @return 结果
     */
    public int updateSysEventTime(SysEventTime sysEventTime);

    /**
     * 删除行事历周数时间
     * 
     * @param timeId 行事历周数时间主键
     * @return 结果
     */
    public int deleteSysEventTimeByTimeId(Long timeId);

    /**
     * 批量删除行事历周数时间
     * 
     * @param timeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysEventTimeByTimeIds(Long[] timeIds);
}
