package com.ruoyi.activity.service;

import java.util.List;
import com.ruoyi.activity.domain.SysEventColor;

/**
 * 行事历部门颜色Service接口
 * 
 * @author greedy
 * @date 2025-04-15
 */
public interface ISysEventColorService 
{
    /**
     * 查询行事历部门颜色
     * 
     * @param colorId 行事历部门颜色主键
     * @return 行事历部门颜色
     */
    public SysEventColor selectSysEventColorByColorId(Long colorId);

    /**
     * 查询行事历部门颜色列表
     * 
     * @param sysEventColor 行事历部门颜色
     * @return 行事历部门颜色集合
     */
    public List<SysEventColor> selectSysEventColorList(SysEventColor sysEventColor);

    /**
     * 新增行事历部门颜色
     * 
     * @param sysEventColor 行事历部门颜色
     * @return 结果
     */
    public int insertSysEventColor(SysEventColor sysEventColor);

    /**
     * 修改行事历部门颜色
     * 
     * @param sysEventColor 行事历部门颜色
     * @return 结果
     */
    public int updateSysEventColor(SysEventColor sysEventColor);

    /**
     * 批量删除行事历部门颜色
     * 
     * @param colorIds 需要删除的行事历部门颜色主键集合
     * @return 结果
     */
    public int deleteSysEventColorByColorIds(Long[] colorIds);

    /**
     * 删除行事历部门颜色信息
     * 
     * @param colorId 行事历部门颜色主键
     * @return 结果
     */
    public int deleteSysEventColorByColorId(Long colorId);
}
