package com.ruoyi.activity.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.activity.mapper.SysEventColorMapper;
import com.ruoyi.activity.domain.SysEventColor;
import com.ruoyi.activity.service.ISysEventColorService;

/**
 * 行事历部门颜色Service业务层处理
 * 
 * @author greedy
 * @date 2025-04-15
 */
@Service
public class SysEventColorServiceImpl implements ISysEventColorService 
{
    @Autowired
    private SysEventColorMapper sysEventColorMapper;

    /**
     * 查询行事历部门颜色
     * 
     * @param colorId 行事历部门颜色主键
     * @return 行事历部门颜色
     */
    @Override
    public SysEventColor selectSysEventColorByColorId(Long colorId)
    {
        return sysEventColorMapper.selectSysEventColorByColorId(colorId);
    }

    /**
     * 查询行事历部门颜色列表
     * 
     * @param sysEventColor 行事历部门颜色
     * @return 行事历部门颜色
     */
    @Override
    public List<SysEventColor> selectSysEventColorList(SysEventColor sysEventColor)
    {
        return sysEventColorMapper.selectSysEventColorList(sysEventColor);
    }

    /**
     * 新增行事历部门颜色
     * 
     * @param sysEventColor 行事历部门颜色
     * @return 结果
     */
    @Override
    public int insertSysEventColor(SysEventColor sysEventColor)
    {
        return sysEventColorMapper.insertSysEventColor(sysEventColor);
    }

    /**
     * 修改行事历部门颜色
     * 
     * @param sysEventColor 行事历部门颜色
     * @return 结果
     */
    @Override
    public int updateSysEventColor(SysEventColor sysEventColor)
    {
        return sysEventColorMapper.updateSysEventColor(sysEventColor);
    }

    /**
     * 批量删除行事历部门颜色
     * 
     * @param colorIds 需要删除的行事历部门颜色主键
     * @return 结果
     */
    @Override
    public int deleteSysEventColorByColorIds(Long[] colorIds)
    {
        return sysEventColorMapper.deleteSysEventColorByColorIds(colorIds);
    }

    /**
     * 删除行事历部门颜色信息
     * 
     * @param colorId 行事历部门颜色主键
     * @return 结果
     */
    @Override
    public int deleteSysEventColorByColorId(Long colorId)
    {
        return sysEventColorMapper.deleteSysEventColorByColorId(colorId);
    }
}
