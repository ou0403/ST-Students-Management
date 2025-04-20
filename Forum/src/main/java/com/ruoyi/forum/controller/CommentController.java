package com.ruoyi.forum.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.forum.domain.Comment;
import com.ruoyi.forum.service.ICommentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 帖子的评论Controller
 * 
 * @author xcl
 * @date 2025-04-16
 */
@RestController
@RequestMapping("/forum/comment")
public class CommentController extends BaseController
{
    @Autowired
    private ICommentService commentService;

    /**
     * 查询帖子的评论列表
     */
    @PreAuthorize("@ss.hasPermi('forum:comment:list')")
    @GetMapping("/list")
    public TableDataInfo list(Comment comment)
    {
        startPage();
        List<Comment> list = commentService.selectCommentList(comment);
        return getDataTable(list);
    }

    /**
     * 导出帖子的评论列表
     */
    @PreAuthorize("@ss.hasPermi('forum:comment:export')")
    @Log(title = "帖子的评论", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Comment comment)
    {
        List<Comment> list = commentService.selectCommentList(comment);
        ExcelUtil<Comment> util = new ExcelUtil<Comment>(Comment.class);
        util.exportExcel(response, list, "帖子的评论数据");
    }

    /**
     * 获取帖子的评论详细信息
     */
    @PreAuthorize("@ss.hasPermi('forum:comment:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(commentService.selectCommentById(id));
    }

    /**
     * 新增帖子的评论
     */
    @PreAuthorize("@ss.hasPermi('forum:comment:add')")
    @Log(title = "帖子的评论", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Comment comment)
    {
        String a = comment.getPostId();
        comment.setForumId(Long.valueOf(a));
        return toAjax(commentService.insertComment(comment));
    }

    /**
     * 修改帖子的评论
     */
    @PreAuthorize("@ss.hasPermi('forum:comment:edit')")
    @Log(title = "帖子的评论", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Comment comment)
    {
        return toAjax(commentService.updateComment(comment));
    }

    /**
     * 删除帖子的评论
     */
    @PreAuthorize("@ss.hasPermi('forum:comment:remove')")
    @Log(title = "帖子的评论", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(commentService.deleteCommentByIds(ids));
    }
}
