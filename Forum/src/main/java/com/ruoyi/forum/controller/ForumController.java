package com.ruoyi.forum.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Insert;
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
import com.ruoyi.forum.domain.Forum;
import com.ruoyi.forum.service.IForumService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 知识论坛Controller
 * 
 * @author
 * @date 2025-04-14
 */
@RestController
@RequestMapping("/forum/forum")
public class ForumController extends BaseController
{
    @Autowired
    private IForumService forumService;

    /**
     * 查询知识论坛列表
     */
    @PreAuthorize("@ss.hasPermi('forum:forum:list')")
    @GetMapping("/list")
    public TableDataInfo list(Forum forum)
    {
        startPage();
        List<Forum> list = forumService.selectForumList(forum);
        return getDataTable(list);
    }

    /**
     * 导出知识论坛列表
     */
    @PreAuthorize("@ss.hasPermi('forum:forum:export')")
    @Log(title = "知识论坛", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Forum forum)
    {
        List<Forum> list = forumService.selectForumList(forum);
        ExcelUtil<Forum> util = new ExcelUtil<Forum>(Forum.class);
        util.exportExcel(response, list, "知识论坛数据");
    }

    /**
     * 获取知识论坛详细信息
     */
    @PreAuthorize("@ss.hasPermi('forum:forum:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(forumService.selectForumById(id));
    }

    /**
     * 新增知识论坛
     */
    @PreAuthorize("@ss.hasPermi('forum:forum:add')")
    @Log(title = "知识论坛", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Forum forum)
    {
        return toAjax(forumService.insertForum(forum));
    }

    /**
     * 修改知识论坛
     */
    @PreAuthorize("@ss.hasPermi('forum:forum:edit')")
    @Log(title = "知识论坛", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Forum forum)
    {

        return toAjax(forumService.updateForum(forum));
    }

    /**
     * 删除知识论坛
     */
    @PreAuthorize("@ss.hasPermi('forum:forum:remove')")
    @Log(title = "知识论坛", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(forumService.deleteForumByIds(ids));
    }

}
