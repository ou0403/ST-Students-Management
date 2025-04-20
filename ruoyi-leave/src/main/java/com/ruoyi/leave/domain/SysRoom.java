package com.ruoyi.leave.domain;

import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 教室管理对象 sys_room
 *
 * @author Greedy
 * @date 2025-03-11
 */
public class SysRoom extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 教室id */
    private Long roomId;

    /** 教室名称 */
    @Excel(name = "教室名称")
    private String roomName;

    /** 教室描述 */
    @Excel(name = "教室描述")
    private String roomDescribe;

    /** 教室数据 */
    @Excel(name = "教室数据")
    private String room;

    /** 教室长度 */
    @Excel(name = "教室长度")
    private Long roomHeight;

    /** 教室宽度 */
    @Excel(name = "教室宽度")
    private Long roomWeight;

    /** 部门id */
    @Excel(name = "部门id")
    private Long deptId;

    /** 创建人id */
    @Excel(name = "创建人id")
    private Long userId;

    /** 预留_a */
    @Excel(name = "预留_a")
    private String roomReserveA;

    /** 预留_b */
    @Excel(name = "预留_b")
    private String roomReserveB;


    private SysUser user;

    private SysDept dept;


    private List<List<RoomSeat>> arr;


    private Long userSize;


    public Long getUserSize() {
        return userSize;
    }

    public void setUserSize(Long userSize) {
        this.userSize = userSize;
    }

    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }




    public List<List<RoomSeat>> getArr() {
        return arr;
    }

    public void setArr(List<List<RoomSeat>> arr) {
        this.arr = arr;
    }

    public SysDept getDept() {
        return dept;
    }

    public void setDept(SysDept dept) {
        this.dept = dept;
    }

    private List<List<Long>> deptIdList;


    public List<List<Long>> getDeptIdList() {
        return deptIdList;
    }

    public void setDeptIdList(List<List<Long>> deptIdList) {
        this.deptIdList = deptIdList;
    }

    public void setRoomId(Long roomId)
    {
        this.roomId = roomId;
    }

    public Long getRoomId()
    {
        return roomId;
    }

    public void setRoomName(String roomName)
    {
        this.roomName = roomName;
    }

    public String getRoomName()
    {
        return roomName;
    }

    public void setRoomDescribe(String roomDescribe)
    {
        this.roomDescribe = roomDescribe;
    }

    public String getRoomDescribe()
    {
        return roomDescribe;
    }

    public void setRoom(String room)
    {
        this.room = room;
    }

    public String getRoom()
    {
        return room;
    }

    public void setRoomHeight(Long roomHeight)
    {
        this.roomHeight = roomHeight;
    }

    public Long getRoomHeight()
    {
        return roomHeight;
    }

    public void setRoomWeight(Long roomWeight)
    {
        this.roomWeight = roomWeight;
    }

    public Long getRoomWeight()
    {
        return roomWeight;
    }

    public void setDeptId(Long deptId)
    {
        this.deptId = deptId;
    }

    public Long getDeptId()
    {
        return deptId;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
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
            .append("roomId", getRoomId())
            .append("roomName", getRoomName())
            .append("roomDescribe", getRoomDescribe())
            .append("room", getRoom())
            .append("roomHeight", getRoomHeight())
            .append("roomWeight", getRoomWeight())
            .append("deptId", getDeptId())
            .append("userId", getUserId())
            .append("roomReserveA", getRoomReserveA())
            .append("roomReserveB", getRoomReserveB())
            .toString();
    }
}
