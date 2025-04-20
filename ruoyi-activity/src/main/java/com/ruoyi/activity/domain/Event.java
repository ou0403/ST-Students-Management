package com.ruoyi.activity.domain;

/**
 * @author Greedy
 */
public class Event {
    private Long eventId;
    private String eventDate; // 事件日期，格式为 YYYY-MM-DD
    private Long slotId; // 时间段标识，如 morning, afternoon, evening
    private String eventText; // 事件内容
    private String eventColor; // 事件颜色标记
    private Long eventTimestamp; // 事件创建时间戳

    public Event(Long eventId, String eventDate, Long slotId, String eventText, String eventColor, Long eventTimestamp) {
        this.eventId = eventId;
        this.eventDate = eventDate;
        this.slotId = slotId;
        this.eventText = eventText;
        this.eventColor = eventColor;
        this.eventTimestamp = eventTimestamp;
    }

    public Long getEventId() {
        return eventId;
    }

    public void setEventId(Long eventId) {
        this.eventId = eventId;
    }

    public String getEventDate() {
        return eventDate;
    }

    public void setEventDate(String eventDate) {
        this.eventDate = eventDate;
    }

    public Long getSlotId() {
        return slotId;
    }

    public void setSlotId(Long slotId) {
        this.slotId = slotId;
    }

    public String getEventText() {
        return eventText;
    }

    public void setEventText(String eventText) {
        this.eventText = eventText;
    }

    public String getEventColor() {
        return eventColor;
    }

    public void setEventColor(String eventColor) {
        this.eventColor = eventColor;
    }

    public Long getEventTimestamp() {
        return eventTimestamp;
    }

    public void setEventTimestamp(Long eventTimestamp) {
        this.eventTimestamp = eventTimestamp;
    }

    @Override
    public String toString() {
        return "Event{" +
                "eventId=" + eventId +
                ", eventDate='" + eventDate + '\'' +
                ", slotId=" + slotId +
                ", eventText='" + eventText + '\'' +
                ", eventColor='" + eventColor + '\'' +
                ", eventTimestamp=" + eventTimestamp +
                '}';
    }
}
