package com.ruoyi.forum.service;

import java.util.List;
import com.ruoyi.forum.domain.Comment;

/**
 * 帖子的评论Service接口
 * 
 * @author xcl
 * @date 2025-04-16
 */
public interface ICommentService 
{
    /**
     * 查询帖子的评论
     * 
     * @param id 帖子的评论主键
     * @return 帖子的评论
     */
    public Comment selectCommentById(Long id);

    /**
     * 查询帖子的评论列表
     * 
     * @param comment 帖子的评论
     * @return 帖子的评论集合
     */
    public List<Comment> selectCommentList(Comment comment);

    /**
     * 新增帖子的评论
     * 
     * @param comment 帖子的评论
     * @return 结果
     */
    public int insertComment(Comment comment);

    /**
     * 修改帖子的评论
     * 
     * @param comment 帖子的评论
     * @return 结果
     */
    public int updateComment(Comment comment);

    /**
     * 批量删除帖子的评论
     * 
     * @param ids 需要删除的帖子的评论主键集合
     * @return 结果
     */
    public int deleteCommentByIds(Long[] ids);

    /**
     * 删除帖子的评论信息
     * 
     * @param id 帖子的评论主键
     * @return 结果
     */
    public int deleteCommentById(Long id);
}
