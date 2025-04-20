package com.ruoyi.stuhom.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
import com.ruoyi.stuhom.domain.Stuhom;
import com.ruoyi.stuhom.service.IstuhomService;
import com.ruoyi.common.core.page.TableDataInfo;
import java.io.*;
import java.util.zip.*;

/**
 * 提交作业Controller
 *
 * @author zs
 * @date 2025-03-18
 */
@RestController
@RequestMapping("/stuhom/stuhom")
public class StuHomController extends BaseController
{
    @Autowired
    private IstuhomService stuhomService;

    /**
     * 查询提交作业列表
     */
    @PreAuthorize("@ss.hasPermi('stuhom:stuhom:list')")
    @GetMapping("/list")
    public TableDataInfo list(Stuhom stuhom)
    {
        startPage();
        System.out.println(stuhom);
        List<Stuhom> list = stuhomService.selectstuhomList(stuhom);
        return getDataTable(list);
    }

    /**
     * 查询提交作业详情
     */
    @PreAuthorize("@ss.hasPermi('stuhom:stuhom:list')")
    @GetMapping("/listss")
    public TableDataInfo listss(Stuhom stuhom)
    {
        startPage();
        System.out.println(stuhom);
        List<Stuhom> list = stuhomService.selectstuhomList(stuhom);
        return getDataTable(list);
    }

    /**
     * 导出提交作业列表
     */
    @PreAuthorize("@ss.hasPermi('stuhom:stuhom:export')")
    @Log(title = "提交作业", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Stuhom stuhom)
    {
        System.out.println(stuhom);
        //获取地址
        System.out.println(FileUploadUtils.getDefaultBaseDir());
        List<Stuhom> list = stuhomService.selectstuhomList(stuhom);
        ArrayList<String> fruitList = new ArrayList<>();
        System.out.println(list);
        for (int i = 0; i < list.size(); i++) {
            String tr1 = list.get(i).getSubmission().substring(8);
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
     * 获取提交作业详细信息
     */
    @PreAuthorize("@ss.hasPermi('stuhom:stuhom:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(stuhomService.selectstuhomById(id));
    }

    /**
     * 新增提交作业
     */
    @PreAuthorize("@ss.hasPermi('stuhom:stuhom:add')")
    @Log(title = "提交作业", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Stuhom stuhom)
    {
        System.out.println(stuhom);
        Long userId = SecurityUtils.getUserId();
        stuhom.setStudentId(userId);
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
        Date date = new Date(System.currentTimeMillis());
        stuhom.setSubmissionTime(date);
        return toAjax(stuhomService.insertstuhom(stuhom));
    }

    /**
     * 修改提交作业
     */
    @PreAuthorize("@ss.hasPermi('stuhom:stuhom:edit')")
    @Log(title = "提交作业", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Stuhom stuhom)
    {
        return toAjax(stuhomService.updatestuhom(stuhom));
    }

    /**
     * 删除提交作业
     */
    @PreAuthorize("@ss.hasPermi('stuhom:stuhom:remove')")
    @Log(title = "提交作业", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(stuhomService.deletestuhomByIds(ids));
    }
}
