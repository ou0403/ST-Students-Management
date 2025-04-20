package com.ruoyi.activity.service;

import java.util.List;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.activity.domain.SysEvent;

/**
 * 行事历Service接口
 *
 * @author ruoyi
 * @date 2025-03-15
 */
public interface ISysEventService
{
    /**
     * 查询行事历
     *
     * @param eventId 行事历主键
     * @return 行事历
     */
    public SysEvent selectSysEventByEventId(Long eventId);

    /**
     * 查询行事历列表
     *
     * @param sysEvent 行事历
     * @return 行事历集合
     */
    public List<SysEvent> selectSysEventList(SysEvent sysEvent);

    JSONObject selectSysEventCalendarList(SysEvent sysEvent);

    /**
     * 新增行事历
     *
     * @param sysEvent 行事历
     * @return 结果
     */
    public int insertSysEvent(SysEvent sysEvent);

    /**
     * 修改行事历
     *
     * @param sysEvent 行事历
     * @return 结果
     */
    public int updateSysEvent(SysEvent sysEvent);

    /**
     * 批量删除行事历
     *
     * @param eventIds 需要删除的行事历主键集合
     * @return 结果
     */
    public int deleteSysEventByEventIds(Long[] eventIds);

    /**
     * 删除行事历信息
     *
     * @param eventId 行事历主键
     * @return 结果
     */
    public int deleteSysEventByEventId(Long eventId);
}
