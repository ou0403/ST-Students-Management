package com.ruoyi.leave.mapper;

import java.util.List;
import com.ruoyi.leave.domain.SysRoom;

/**
 * 教室管理Mapper接口
 * 
 * @author Greedy
 * @date 2025-03-11
 */
public interface SysRoomMapper 
{
    /**
     * 查询教室管理
     * 
     * @param roomId 教室管理主键
     * @return 教室管理
     */
    public SysRoom selectSysRoomByRoomId(Long roomId);

    /**
     * 查询教室管理列表
     * 
     * @param sysRoom 教室管理
     * @return 教室管理集合
     */
    public List<SysRoom> selectSysRoomList(SysRoom sysRoom);

    /**
     * 新增教室管理
     * 
     * @param sysRoom 教室管理
     * @return 结果
     */
    public int insertSysRoom(SysRoom sysRoom);

    /**
     * 修改教室管理
     * 
     * @param sysRoom 教室管理
     * @return 结果
     */
    public int updateSysRoom(SysRoom sysRoom);

    /**
     * 删除教室管理
     * 
     * @param roomId 教室管理主键
     * @return 结果
     */
    public int deleteSysRoomByRoomId(Long roomId);

    /**
     * 批量删除教室管理
     * 
     * @param roomIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysRoomByRoomIds(Long[] roomIds);
}
