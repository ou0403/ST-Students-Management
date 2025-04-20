package com.ruoyi.forum.service;

import java.util.List;
import com.ruoyi.forum.domain.Forum;

/**
 * 知识论坛Service接口
 * 
 * @author mqs
 * @date 2025-04-14
 */
public interface IForumService 
{
    /**
     * 查询知识论坛
     * 
     * @param id 知识论坛主键
     * @return 知识论坛
     */
    public Forum selectForumById(Long id);

    /**
     * 查询知识论坛列表
     * 
     * @param forum 知识论坛
     * @return 知识论坛集合
     */
    public List<Forum> selectForumList(Forum forum);

    /**
     * 新增知识论坛
     * 
     * @param forum 知识论坛
     * @return 结果
     */
    public int insertForum(Forum forum);

    /**
     * 修改知识论坛
     * 
     * @param forum 知识论坛
     * @return 结果
     */
    public int updateForum(Forum forum);

    /**
     * 批量删除知识论坛
     * 
     * @param ids 需要删除的知识论坛主键集合
     * @return 结果
     */
    public int deleteForumByIds(Long[] ids);

    /**
     * 删除知识论坛信息
     * 
     * @param id 知识论坛主键
     * @return 结果
     */
    public int deleteForumById(Long id);
}
