package com.ruoyi.activity.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 行事历对象 sys_event
 *
 * @author ruoyi
 * @date 2025-04-15
 */
public class SysEvent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long eventId;

    /** 期数表id */
    @Excel(name = "期数表id")
    private Long numberId;

    /** 周数 */
    @Excel(name = "周数")
    private Long eventWeeks;

    /** 事件日期 */
    @Excel(name = "事件日期")
    private String eventDate;

    /** 时间段标识 */
    @Excel(name = "时间段标识")
    private Long slotId;

    /** 事件内容 */
    @Excel(name = "事件内容")
    private String eventText;

    /** 事件颜色标记 */
    @Excel(name = "事件颜色标记")
    private String eventColor;

    /** 事件创建时间戳 */
    @Excel(name = "事件创建时间戳")
    private Long eventTimestamp;

    /** 预留_a */
    @Excel(name = "预留_a")
    private String roomReserveA;

    /** 预留_b */
    @Excel(name = "预留_b")
    private String roomReserveB;

    public void setEventId(Long eventId)
    {
        this.eventId = eventId;
    }

    public Long getEventId()
    {
        return eventId;
    }

    public void setNumberId(Long numberId)
    {
        this.numberId = numberId;
    }

    public Long getNumberId()
    {
        return numberId;
    }

    public void setEventWeeks(Long eventWeeks)
    {
        this.eventWeeks = eventWeeks;
    }

    public Long getEventWeeks()
    {
        return eventWeeks;
    }

    public void setEventDate(String eventDate)
    {
        this.eventDate = eventDate;
    }

    public String getEventDate()
    {
        return eventDate;
    }

    public void setSlotId(Long slotId)
    {
        this.slotId = slotId;
    }

    public Long getSlotId()
    {
        return slotId;
    }

    public void setEventText(String eventText)
    {
        this.eventText = eventText;
    }

    public String getEventText()
    {
        return eventText;
    }

    public void setEventColor(String eventColor)
    {
        this.eventColor = eventColor;
    }

    public String getEventColor()
    {
        return eventColor;
    }

    public void setEventTimestamp(Long eventTimestamp)
    {
        this.eventTimestamp = eventTimestamp;
    }

    public Long getEventTimestamp()
    {
        return eventTimestamp;
    }

    public void setRoomReserveA(String roomReserveA)
    {
        this.roomReserveA = roomReserveA;
    }

    public String getRoomReserveA()
    {
        return roomReserveA;
    }

    public void setRoomReserveB(String roomReserveB)
    {
        this.roomReserveB = roomReserveB;
    }

    public String getRoomReserveB()
    {
        return roomReserveB;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("eventId", getEventId())
                .append("numberId", getNumberId())
                .append("eventWeeks", getEventWeeks())
                .append("eventDate", getEventDate())
                .append("slotId", getSlotId())
                .append("eventText", getEventText())
                .append("eventColor", getEventColor())
                .append("eventTimestamp", getEventTimestamp())
                .append("roomReserveA", getRoomReserveA())
                .append("roomReserveB", getRoomReserveB())
                .toString();
    }
}
