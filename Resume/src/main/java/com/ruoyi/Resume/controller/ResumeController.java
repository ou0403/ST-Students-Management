package com.ruoyi.Resume.controller;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
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
import com.ruoyi.Resume.domain.Resume;
import com.ruoyi.Resume.service.IResumeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 简历管理Controller
 *
 * @author ruoyi
 * @date 2025-03-27
 */
@RestController
@RequestMapping("/Resume/Resume")
public class ResumeController extends BaseController
{
    @Autowired
    private IResumeService resumeService;

    /**
     * 查询简历管理列表
     */
    @PreAuthorize("@ss.hasPermi('Resume:Resume:list')")
    @GetMapping("/list")
    public TableDataInfo list(Resume resume)
    {
        startPage();
        System.out.println(resume);
        List<Resume> list;
        if(resume.getQufen().equals("1")){
            Long deptId = SecurityUtils.getDeptId();
            resume.setDeptId(deptId);
            list = resumeService.selectResumeList(resume);
        }else{
            Long deptId = SecurityUtils.getDeptId();
            resume.setStuDeptId(deptId);
            list = resumeService.selectResumeList(resume);
        }
        return getDataTable(list);
    }

    /**
     * 导出简历管理列表
     */
    @PreAuthorize("@ss.hasPermi('Resume:Resume:export')")
    @Log(title = "简历管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Resume resume)
    {
        List<Resume> list = resumeService.selectResumeList(resume);
        ExcelUtil<Resume> util = new ExcelUtil<Resume>(Resume.class);
        util.exportExcel(response, list, "简历管理数据");
    }

    @PreAuthorize("@ss.hasPermi('Resume:Resume:export')")
    @Log(title = "简历管理", businessType = BusinessType.EXPORT)
    @PostMapping("/exportStuRes")
    public void exportStuRes(HttpServletResponse response, Resume resume)
    {
        System.out.println(resume);
        System.out.println(FileUploadUtils.getDefaultBaseDir());
        List<Resume> list = resumeService.selectResumeList(resume);
        ArrayList<String> fruitList = new ArrayList<>();
        System.out.println(list);
        for (int i = 0; i < list.size(); i++) {
            String tr1 = list.get(i).getNotes().substring(8);
            String tr2 = FileUploadUtils.getDefaultBaseDir();
            fruitList.add(tr2+tr1);
            System.out.println(fruitList);
        }
        String zipFileName = "D://text/files.zip";
        try {
            // 创建一个 ZipOutputStream 用于写入压缩包
            FileOutputStream fos = new FileOutputStream(zipFileName);
            ZipOutputStream zos = new ZipOutputStream(fos);
            for (String filePath : fruitList) {
                // 创建文件对象
                File file = new File(filePath);
                if (file.exists() && file.isFile()) {
                    // 创建一个新的 ZipEntry，表示压缩包中的一个文件
                    ZipEntry zipEntry = new ZipEntry(file.getName());
                    zos.putNextEntry(zipEntry);
                    // 创建 FileInputStream 读取文件内容
                    FileInputStream fis = new FileInputStream(file);
                    // 读取文件并将其写入压缩包
                    byte[] buffer = new byte[1024];
                    int length;
                    while ((length = fis.read(buffer)) > 0) {
                        zos.write(buffer, 0, length);
                    }
                    // 关闭当前文件输入流
                    fis.close();
                    // 结束当前文件的写入
                    zos.closeEntry();
                }else {
                    System.out.println("文件不存在或不是文件: " + filePath);
                }
            }
            // 关闭 ZipOutputStream
            zos.close();
            // 设置响应头，指示浏览器下载文件而不是显示
            response.setContentType("application/zip"); // 指定内容类型
            response.setHeader("Content-Disposition", "attachment; filename=files.zip"); // 下载时文件名为 files.zip

            // 创建文件输入流读取文件内容
            File file = new File(zipFileName);
            if (file.exists() && file.isFile()) {
                FileInputStream fis = new FileInputStream(file);
                OutputStream os = response.getOutputStream();
                byte[] buffer = new byte[1024];
                int length;
                while ((length = fis.read(buffer)) > 0) {
                    os.write(buffer, 0, length);
                }
                fis.close();
                os.close();
            } else {
                // 如果文件不存在，返回错误信息
                response.getWriter().write("文件不存在或不是有效的文件");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取简历管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('Resume:Resume:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(resumeService.selectResumeById(id));
    }

    /**
     * 新增简历管理
     */
    @PreAuthorize("@ss.hasPermi('Resume:Resume:add')")
    @Log(title = "简历管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Resume resume)
    {
        Long userId = SecurityUtils.getUserId();
        resume.setStuId(userId);
        Long deptId = SecurityUtils.getDeptId();
        resume.setStuDeptId(deptId);
        return toAjax(resumeService.insertResume(resume));
    }

    /**
     * 修改简历管理
     */
    @PreAuthorize("@ss.hasPermi('Resume:Resume:edit')")
    @Log(title = "简历管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Resume resume)
    {
        return toAjax(resumeService.updateResume(resume));
    }

    /**
     * 删除简历管理
     */
    @PreAuthorize("@ss.hasPermi('Resume:Resume:remove')")
    @Log(title = "简历管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(resumeService.deleteResumeByIds(ids));
    }
}
