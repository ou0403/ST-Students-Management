package com.ruoyi.activity.controller;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.activity.domain.Event;

import java.util.*;

public class Test {

    public static void main(String[] args) {
        List<Event> events = Arrays.asList(
                new Event(1L, "2025-03-08",1L,"11","#409EFF",1742007943486L),
                new Event(2L, "2025-03-08",1L,"12","#409EFF",1742007943486L),
                new Event(3L, "2025-03-08",2L,"23","#409EFF",1742007943486L),
                new Event(4L, "2025-03-08",2L,"24","#409EFF",1742007943486L),
                new Event(5L, "2025-03-09",1L,"15","#409EFF",1742008550707L)
        );

        Map<String,Map<Long,List<Map<String,Object>>>> stringMapMap = convertEvents(events);
        System.out.println(new JSONObject(stringMapMap).toString());

    }
    public static Map<String, Map<Long, List<Map<String, Object>>>> convertEvents(List<Event> events) {
        Map<String, Map<Long, List<Map<String, Object>>>> result = new HashMap<>();

        for (Event event : events) {
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
        return result;
    }




}
