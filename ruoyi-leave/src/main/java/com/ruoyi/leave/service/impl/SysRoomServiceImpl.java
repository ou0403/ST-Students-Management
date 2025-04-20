package com.ruoyi.leave.service.impl;

import java.util.Date;
import java.util.List;
import java.util.StringJoiner;

import com.alibaba.fastjson2.JSON;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.leave.domain.RoomSeat;
import com.ruoyi.leave.domain.SysLeave;
import com.ruoyi.leave.mapper.SysLeaveMapper;
import com.ruoyi.system.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.leave.mapper.SysRoomMapper;
import com.ruoyi.leave.domain.SysRoom;
import com.ruoyi.leave.service.ISysRoomService;

import javax.annotation.Resource;

/**
 * 教室管理Service业务层处理
 *
 * @author Greedy
 * @date 2025-03-11
 */
@Service
public class SysRoomServiceImpl implements ISysRoomService
{
    @Autowired
    private SysRoomMapper sysRoomMapper;

    @Autowired
    private SysUserMapper userMapper;

    @Autowired
    private SysLeaveMapper sysLeaveMapper;

    /**
     * 查询教室管理
     *
     * @param roomId 教室管理主键
     * @return 教室管理
     */
    @Override
    public SysRoom selectSysRoomByRoomId(Long roomId) throws JsonProcessingException {
        SysRoom sysRoom = sysRoomMapper.selectSysRoomByRoomId(roomId);
        Long deptId = sysRoom.getDeptId();
        SysUser sysUser = new SysUser();
        sysUser.setDeptId(deptId);
        Long size = 0L;

        String room = sysRoom.getRoom();
        if (room != null){
            ObjectMapper objectMapper = new ObjectMapper();
            //将String类型的room转换为List<List<RoomSeat>>类型
            List<List<RoomSeat>> arr = objectMapper.readValue(room, new TypeReference<List<List<RoomSeat>>>(){});
            //获取个人请假数据,改变颜色
            for (List<RoomSeat>  ar : arr) {
                for (RoomSeat a : ar) {
                    if (a.getId()!=0){
                        size++;
                        int timeStatus = 0;
                        Long id = a.getId();
                        SysLeave sysLeave = new SysLeave();
                        sysLeave.setUserId(id);
                        sysLeave.setApprovalStatus(1L);
                        List<SysLeave> sysLeaves = sysLeaveMapper.selectSysLeaveList(sysLeave);
                        for (SysLeave leave : sysLeaves) {
                            Date firstTime = leave.getFirstTime();
                            Date lastTime = leave.getLastTime();
                            //获取当前时间
                            Date date = new Date();
                            if (date.getTime() >= firstTime.getTime() && date.getTime() <= lastTime.getTime()){
                                timeStatus = 1;
                                break;
                            }
                        }
                        if (timeStatus == 1){
                            StringJoiner stringJoiner = new StringJoiner(";","","");
                            stringJoiner.add("background-color:#e5678d");
                            stringJoiner.add("height:90%");
                            stringJoiner.add("width:90%");
//                            stringJoiner.add("font-weight:700");
//                            stringJoiner.add("color:#000");
//                            stringJoiner.add("text-shadow: 2px 2px 5px #767676");
                            a.setColor(stringJoiner.toString());
                        }else {
                            StringJoiner stringJoiner = new StringJoiner(";","","");
                            stringJoiner.add("background-color:#96e56c");
                            stringJoiner.add("height:90%");
                            stringJoiner.add("width:90%");
//                            stringJoiner.add("font-weight:700");
//                            stringJoiner.add("color:#000");
//                            stringJoiner.add("text-shadow: 2px 2px 5px #767676");
                            a.setColor(stringJoiner.toString());
                        }
                    }
                }
            }
            sysRoom.setUserSize(size);
            sysRoom.setArr(arr);
        }
        return sysRoom;
    }

    /**
     * 查询教室管理列表
     *
     * @param sysRoom 教室管理
     * @return 教室管理
     */

    @Override
    @DataScope(deptAlias = "d")
    public List<SysRoom> selectSysRoomList(SysRoom sysRoom)
    {
        return sysRoomMapper.selectSysRoomList(sysRoom);
    }

    /**
     * 新增教室管理
     *
     * @param sysRoom 教室管理
     * @return 结果
     */
    @Override
    public int insertSysRoom(SysRoom sysRoom)
    {
        List<Long> longs = sysRoom.getDeptIdList().get(0);
        Long aLong = longs.get(2);
        sysRoom.setDeptId(aLong);
        return sysRoomMapper.insertSysRoom(sysRoom);
    }

    /**
     * 修改教室管理
     *
     * @param sysRoom 教室管理
     * @return 结果
     */
    @Override
    public int updateSysRoom(SysRoom sysRoom)
    {
        List<List<RoomSeat>> arr = sysRoom.getArr();
        if (arr != null){
            String jsonString = JSON.toJSONString(arr);
            sysRoom.setRoom(jsonString);
        }
        return sysRoomMapper.updateSysRoom(sysRoom);
    }

    /**
     * 批量删除教室管理
     *
     * @param roomIds 需要删除的教室管理主键
     * @return 结果
     */
    @Override
    public int deleteSysRoomByRoomIds(Long[] roomIds)
    {
        return sysRoomMapper.deleteSysRoomByRoomIds(roomIds);
    }

    /**
     * 删除教室管理信息
     *
     * @param roomId 教室管理主键
     * @return 结果
     */
    @Override
    public int deleteSysRoomByRoomId(Long roomId)
    {
        return sysRoomMapper.deleteSysRoomByRoomId(roomId);
    }


}
