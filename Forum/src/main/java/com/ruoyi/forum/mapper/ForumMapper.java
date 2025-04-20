package com.ruoyi.forum.mapper;

import java.util.List;
import com.ruoyi.forum.domain.Forum;
import org.apache.ibatis.annotations.Mapper;

/**
 * 知识论坛Mapper接口
 * 
 * @author mqs
 * @date 2025-04-14
 */
@Mapper
public interface ForumMapper 
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
     * 删除知识论坛
     * 
     * @param id 知识论坛主键
     * @return 结果
     */
    public int deleteForumById(Long id);

    /**
     * 批量删除知识论坛
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteForumByIds(Long[] ids);
}
