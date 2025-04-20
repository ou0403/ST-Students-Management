package com.ruoyi.activity.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.activity.domain.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.activity.mapper.SysEventMapper;
import com.ruoyi.activity.domain.SysEvent;
import com.ruoyi.activity.service.ISysEventService;

/**
 * 行事历Service业务层处理
 *
 * @author ruoyi
 * @date 2025-03-15
 */
@Service
public class SysEventServiceImpl implements ISysEventService
{
    @Autowired
    private SysEventMapper sysEventMapper;

    /**
     * 查询行事历
     *
     * @param eventId 行事历主键
     * @return 行事历
     */
    @Override
    public SysEvent selectSysEventByEventId(Long eventId)
    {
        return sysEventMapper.selectSysEventByEventId(eventId);
    }

    /**
     * 查询行事历列表
     *
     * @param sysEvent 行事历
     * @return 行事历
     */
    @Override
    public List<SysEvent> selectSysEventList(SysEvent sysEvent)
    {
        return sysEventMapper.selectSysEventList(sysEvent);
    }


    @Override
    public JSONObject selectSysEventCalendarList(SysEvent sysEvent)
    {
        List<SysEvent> sysEvents = sysEventMapper.selectSysEventList(sysEvent);

        Map<String, Map<Long, List<Map<String, Object>>>> result = new HashMap<>();

        for (SysEvent event : sysEvents) {
            // 获取日期和 slotId
            String date = event.getEventDate();
            Long slotId = event.getSlotId();

            // 如果日期不存在，则初始化
            result.putIfAbsent(date,  new HashMap<>());

            // 如果 slotId 不存在，则初始化
            result.get(date).putIfAbsent(slotId,  new ArrayList<>());

            // 添加事件数据
            Map<String, Object> eventData = new HashMap<>();
            eventData.put("id",  event.getEventId());
            eventData.put("text",  event.getEventText());
            eventData.put("color",  event.getEventColor());
            eventData.put("timestamp",  event.getEventTimestamp());
            result.get(date).get(slotId).add(eventData);
        }

        JSONObject jsonObject = new JSONObject(result);
        return jsonObject;
    }

    /**
     * 新增行事历
     *
     * @param sysEvent 行事历
     * @return 结果
     */
    @Override
    public int insertSysEvent(SysEvent sysEvent)
    {
        return sysEventMapper.insertSysEvent(sysEvent);
    }

    /**
     * 修改行事历
     *
     * @param sysEvent 行事历
     * @return 结果
     */
    @Override
    public int updateSysEvent(SysEvent sysEvent)
    {
        return sysEventMapper.updateSysEvent(sysEvent);
    }

    /**
     * 批量删除行事历
     *
     * @param eventIds 需要删除的行事历主键
     * @return 结果
     */
    @Override
    public int deleteSysEventByEventIds(Long[] eventIds)
    {
        return sysEventMapper.deleteSysEventByEventIds(eventIds);
    }

    /**
     * 删除行事历信息
     *
     * @param eventId 行事历主键
     * @return 结果
     */
    @Override
    public int deleteSysEventByEventId(Long eventId)
    {
        return sysEventMapper.deleteSysEventByEventId(eventId);
    }
}
