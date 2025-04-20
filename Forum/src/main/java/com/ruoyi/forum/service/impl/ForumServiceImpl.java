package com.ruoyi.forum.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.forum.mapper.ForumMapper;
import com.ruoyi.forum.domain.Forum;
import com.ruoyi.forum.service.IForumService;

/**
 * 知识论坛Service业务层处理
 * 
 * @author mqs
 * @date 2025-04-14
 */
@Service
public class ForumServiceImpl implements IForumService 
{
    @Autowired
    private ForumMapper forumMapper;

    /**
     * 查询知识论坛
     * 
     * @param id 知识论坛主键
     * @return 知识论坛
     */
    @Override
    public Forum selectForumById(Long id)
    {
        return forumMapper.selectForumById(id);
    }

    /**
     * 查询知识论坛列表
     * 
     * @param forum 知识论坛
     * @return 知识论坛
     */
    @Override
    public List<Forum> selectForumList(Forum forum)
    {
        return forumMapper.selectForumList(forum);
    }

    /**
     * 新增知识论坛
     * 
     * @param forum 知识论坛
     * @return 结果
     */
    @Override
    public int insertForum(Forum forum)
    {   //获取用户ID
        Long userId = SecurityUtils.getUserId();
        forum.setUsername(String.valueOf(userId));
        //获取部门ID
        Long deptId = SecurityUtils.getDeptId();
        forum.setRemark(String.valueOf(deptId));
        forum.setCreateTime(DateUtils.getNowDate());
        return forumMapper.insertForum(forum);
    }

    /**
     * 修改知识论坛
     * 
     * @param forum 知识论坛
     * @return 结果
     */
    @Override
    public int updateForum(Forum forum)
    {
        forum.setUpdateTime(DateUtils.getNowDate());
        return forumMapper.updateForum(forum);
    }

    /**
     * 批量删除知识论坛
     * 
     * @param ids 需要删除的知识论坛主键
     * @return 结果
     */
    @Override
    public int deleteForumByIds(Long[] ids)
    {
        return forumMapper.deleteForumByIds(ids);
    }

    /**
     * 删除知识论坛信息
     * 
     * @param id 知识论坛主键
     * @return 结果
     */
    @Override
    public int deleteForumById(Long id)
    {
        return forumMapper.deleteForumById(id);
    }
}
