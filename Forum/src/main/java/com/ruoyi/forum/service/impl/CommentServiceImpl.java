package com.ruoyi.forum.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.forum.mapper.CommentMapper;
import com.ruoyi.forum.domain.Comment;
import com.ruoyi.forum.service.ICommentService;

/**
 * 帖子的评论Service业务层处理
 * 
 * @author xcl
 * @date 2025-04-16
 */
@Service
public class CommentServiceImpl implements ICommentService 
{
    @Autowired
    private CommentMapper commentMapper;

    /**
     * 查询帖子的评论
     * 
     * @param forumId 帖子的评论主键
     * @return 帖子的评论
     */
    @Override
    public Comment selectCommentById(Long forumId)
    {
        return commentMapper.selectCommentById(forumId);
    }

    /**
     * 查询帖子的评论列表
     * 
     * @param comment 帖子的评论
     * @return 帖子的评论
     */
    @Override
    public List<Comment> selectCommentList(Comment comment)
    {

        return commentMapper.selectCommentList(comment);
    }

    /**
     * 新增帖子的评论
     * 
     * @param comment 帖子的评论
     * @return 结果
     */
    @Override
    public int insertComment(Comment comment)
    {
        //获取用户ID
        Long userId = SecurityUtils.getUserId();
        comment.setUserId(userId);
        //获取用户的用户名
        comment.setRemark1(SecurityUtils.getUsername());
        //获取部门ID
        Long deptId = SecurityUtils.getDeptId();
        comment.setDeptId(deptId);

        comment.setCreateTime(DateUtils.getNowDate());
        return commentMapper.insertComment(comment);
    }

    /**
     * 修改帖子的评论
     * 
     * @param comment 帖子的评论
     * @return 结果
     */
    @Override
    public int updateComment(Comment comment)
    {
        comment.setUpdateTime(DateUtils.getNowDate());
        return commentMapper.updateComment(comment);
    }

    /**
     * 批量删除帖子的评论
     * 
     * @param ids 需要删除的帖子的评论主键
     * @return 结果
     */
    @Override
    public int deleteCommentByIds(Long[] ids)
    {
        return commentMapper.deleteCommentByIds(ids);
    }

    /**
     * 删除帖子的评论信息
     * 
     * @param id 帖子的评论主键
     * @return 结果
     */
    @Override
    public int deleteCommentById(Long id)
    {
        return commentMapper.deleteCommentById(id);
    }



}
