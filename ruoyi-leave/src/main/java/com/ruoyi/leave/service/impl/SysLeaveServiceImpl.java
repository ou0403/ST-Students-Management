package com.ruoyi.leave.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.leave.domain.SysLeaveApproval;
import com.ruoyi.leave.domain.UserList;
import com.ruoyi.leave.mapper.SysLeaveApprovalMapper;
import com.ruoyi.system.mapper.SysDeptMapper;
import com.ruoyi.system.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.leave.mapper.SysLeaveMapper;
import com.ruoyi.leave.domain.SysLeave;
import com.ruoyi.leave.service.ISysLeaveService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 请假管理Service业务层处理
 *
 * @author Greedy
 * @date 2025-03-11
 */
@Service
public class SysLeaveServiceImpl implements ISysLeaveService
{
    @Autowired
    private SysLeaveMapper sysLeaveMapper;
    @Autowired
    private SysUserMapper sysUserMapper;
    @Autowired
    private SysDeptMapper sysDeptMapper;
    @Autowired
    private SysLeaveApprovalMapper sysLeaveApprovalMapper;

    /**
     * 查询请假管理
     *
     * @param leaveId 请假管理主键
     * @return 请假管理
     */
    @Override
    public SysLeave selectSysLeaveByLeaveId(Long leaveId)
    {
        SysLeave sysLeave = sysLeaveMapper.selectSysLeaveByLeaveId(leaveId);
        Date firstTime = sysLeave.getFirstTime();
        Date lastTime = sysLeave.getLastTime();
        List<Date> dateList = new ArrayList<>();
        dateList.add(firstTime);
        dateList.add(lastTime);
        sysLeave.setTotalTime(dateList);
        return sysLeave;
    }

    /**
     * 查询请假管理列表
     *
     * @param sysLeave 请假管理
     * @return 请假管理
     */

    @Override
    @DataScope(deptAlias = "d" , userAlias = "u")
    public List<SysLeave> selectSysLeaveList(SysLeave sysLeave)
    {
        return sysLeaveMapper.selectSysLeaveList(sysLeave);
    }

    /**
     * 新增请假管理
     *
     * @param sysLeave 请假管理
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertSysLeave(SysLeave sysLeave)
    {
        sysLeave.setApprovalStatus(0L);
        List<Date> totalTime = sysLeave.getTotalTime();
        if (totalTime.size() == 2) {
            sysLeave.setFirstTime(totalTime.get(0));
            sysLeave.setLastTime(totalTime.get(1));
        }
        if (sysLeave.getDeptId()==null) {
            Long userId = sysLeave.getUserId();
            SysUser sysUser = sysUserMapper.selectUserById(userId);
            Long deptId = sysUser.getDeptId();
            sysLeave.setDeptId(deptId);
        }
        Long deptId = sysLeave.getDeptId();
        SysDept sysDept = sysDeptMapper.selectDeptById(deptId);
        Long parentId = sysDept.getParentId();
        SysDept parent = sysDeptMapper.selectDeptById(parentId);
        sysLeave.setLeaveReserveB(parent.getDeptName()+"-"+sysDept.getDeptName());
        int i = sysLeaveMapper.insertSysLeave(sysLeave);
        if (i>0) {
            List<SysLeave> sysLeaves = sysLeaveMapper.selectSysLeaveList(sysLeave);
            SysLeave sl = sysLeaves.get(0);

            Long timeType = sysLeave.getTimeType();
            SysLeaveApproval sysLeaveApproval = new SysLeaveApproval();
            Long teacher = sysLeave.getTeacher();
            Long manager = sysLeave.getManager();
            Long dean = sysLeave.getDean();
            //四小时以内
            if (teacher == null) {
                return 2;
            }
            sysLeaveApproval.setLeaveId(sl.getLeaveId());
            sysLeaveApproval.setUserId(teacher);
            sysLeaveApproval.setApprovalStatuss(0L);
            //顺序
            sysLeaveApproval.setApprovalSequence(1L);
            sysLeaveApprovalMapper.insertSysLeaveApproval(sysLeaveApproval);
            if (timeType==2 || timeType==3) {
                //四小时到八小时
                if (teacher == null  | manager == null) {
                        return 2;
                }
                sysLeaveApproval.setLeaveId(sl.getLeaveId());
                sysLeaveApproval.setUserId(manager);
                sysLeaveApproval.setApprovalStatuss(0L);
                //顺序
                sysLeaveApproval.setApprovalSequence(2L);
                sysLeaveApprovalMapper.insertSysLeaveApproval(sysLeaveApproval);
                if (timeType==3) {
                    //八小时以上
                    if (teacher == null  | manager == null |dean == null) {
                        return 2;
                    }
                    sysLeaveApproval.setLeaveId(sl.getLeaveId());
                    sysLeaveApproval.setUserId(dean);
                    sysLeaveApproval.setApprovalStatuss(0L);
                    //顺序
                    sysLeaveApproval.setApprovalSequence(3L);
                    sysLeaveApprovalMapper.insertSysLeaveApproval(sysLeaveApproval);
                }

            }
        }
        return i;
    }

    /**
     * 修改请假管理
     *
     * @param sysLeave 请假管理
     * @return 结果
     */
    @Override
    public int updateSysLeave(SysLeave sysLeave)
    {
        List<Date> totalTime = sysLeave.getTotalTime();
        if (totalTime == null){
            return  sysLeaveMapper.updateSysLeave(sysLeave);
        }
        if (totalTime.size() == 2) {
            sysLeave.setFirstTime(totalTime.get(0));
            sysLeave.setLastTime(totalTime.get(1));
        }
        return sysLeaveMapper.updateSysLeave(sysLeave);
    }


    /**
     * 通过审核
     *
     *
     * @param sysLeave 请假管理
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateSysLeaveToExamine(SysLeave sysLeave) {
        Long userId = sysLeave.getUserId();
        Long leaveId = sysLeave.getLeaveId();
        Long timeType = sysLeave.getTimeType();
        sysLeave.setUserId(null);
        SysLeaveApproval sysLeaveApproval = new SysLeaveApproval();
        sysLeaveApproval.setLeaveId(leaveId);
        sysLeaveApproval.setUserId(userId);
        List<SysLeaveApproval> sysLeaveApprovals = sysLeaveApprovalMapper.selectSysLeaveApprovalList(sysLeaveApproval);
        if (timeType== 1) {
            if (sysLeaveApprovals.size()==1) {
                SysLeaveApproval sysLeaveApproval1 = sysLeaveApprovals.get(0);
                sysLeaveApproval1.setApprovalStatuss(1L);
                sysLeaveApprovalMapper.updateSysLeaveApproval(sysLeaveApproval1);
                sysLeave.setApprovalStatus(1L);
                sysLeaveMapper.updateSysLeave(sysLeave);
            }else {
                return 2;
            }
        }else if (timeType==2) {
            if (sysLeaveApprovals.size()==1) {
                SysLeaveApproval sysLeaveApproval1 = sysLeaveApprovals.get(0);
                Long approvalSequence = sysLeaveApproval1.getApprovalSequence();
                if (approvalSequence==1L){
                    sysLeaveApproval1.setApprovalStatuss(1L);
                    sysLeaveApprovalMapper.updateSysLeaveApproval(sysLeaveApproval1);
                }else if (approvalSequence==2L){
                    SysLeaveApproval sysLeaveApproval2 = new SysLeaveApproval();
                    sysLeaveApproval2.setApprovalStatuss(1L);
                    sysLeaveApproval2.setApprovalSequence(1L);
                    sysLeaveApproval2.setLeaveId(leaveId);
                    List<SysLeaveApproval> sysLeaveApprovals1 = sysLeaveApprovalMapper.selectSysLeaveApprovalList(sysLeaveApproval2);
                    if (sysLeaveApprovals1.size()==1){
                        sysLeaveApproval1.setApprovalStatuss(1L);
                        sysLeaveApprovalMapper.updateSysLeaveApproval(sysLeaveApproval1);
                        sysLeave.setApprovalStatus(1L);

                        sysLeaveMapper.updateSysLeave(sysLeave);
                    }else{
                        return 2;
                    }
                }
            }else {
                return 2;
            }

        }else if (timeType==3) {
            if (sysLeaveApprovals.size()==1) {
                SysLeaveApproval sysLeaveApproval1 = sysLeaveApprovals.get(0);
                Long approvalSequence = sysLeaveApproval1.getApprovalSequence();
                if (approvalSequence==1L){
                    sysLeaveApproval1.setApprovalStatuss(1L);
                    sysLeaveApprovalMapper.updateSysLeaveApproval(sysLeaveApproval1);
                }else if (approvalSequence==2L){
                    SysLeaveApproval sysLeaveApproval2 = new SysLeaveApproval();
                    sysLeaveApproval2.setApprovalStatuss(1L);
                    sysLeaveApproval2.setApprovalSequence(1L);
                    sysLeaveApproval2.setLeaveId(leaveId);
                    List<SysLeaveApproval> sysLeaveApprovals1 = sysLeaveApprovalMapper.selectSysLeaveApprovalList(sysLeaveApproval2);
                    if (sysLeaveApprovals1.size()==1){
                        sysLeaveApproval1.setApprovalStatuss(1L);
                        sysLeaveApprovalMapper.updateSysLeaveApproval(sysLeaveApproval1);
                    }else{
                        return 2;
                    }
                }else if (approvalSequence==3L){
                    SysLeaveApproval sysLeaveApproval2 = new SysLeaveApproval();
                    sysLeaveApproval2.setApprovalStatuss(1L);
                    sysLeaveApproval2.setApprovalSequence(2L);
                    sysLeaveApproval2.setLeaveId(leaveId);
                    List<SysLeaveApproval> sysLeaveApprovals1 = sysLeaveApprovalMapper.selectSysLeaveApprovalList(sysLeaveApproval2);
                    if (sysLeaveApprovals1.size()==1){
                        sysLeaveApproval1.setApprovalStatuss(1L);
                        sysLeaveApprovalMapper.updateSysLeaveApproval(sysLeaveApproval1);
                        sysLeave.setApprovalStatus(1L);

                        sysLeaveMapper.updateSysLeave(sysLeave);
                    }else{
                        return 2;
                    }
                }
            }else {
                return 2;
            }
        }

        return 1;
    }

    /**
     * 取消审核
     *
     *
     * @param sysLeave 请假管理
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateSysLeaveRefuse(SysLeave sysLeave) {
        Long userId = sysLeave.getUserId();
        Long leaveId = sysLeave.getLeaveId();
        Long timeType = sysLeave.getTimeType();
        System.out.println("======================="+sysLeave);
        sysLeave.setUserId(null);
        SysLeaveApproval sysLeaveApproval = new SysLeaveApproval();
        sysLeaveApproval.setLeaveId(leaveId);
        sysLeaveApproval.setUserId(userId);
        List<SysLeaveApproval> sysLeaveApprovals = sysLeaveApprovalMapper.selectSysLeaveApprovalList(sysLeaveApproval);
        if (sysLeaveApprovals.size()==1){
            SysLeaveApproval sysLeaveApproval1 = sysLeaveApprovals.get(0);
            Long approvalSequence = sysLeaveApproval1.getApprovalSequence();
            if (timeType==1){
                sysLeaveApproval1.setApprovalStatuss(2L);
                sysLeaveApprovalMapper.updateSysLeaveApproval(sysLeaveApproval1);
                sysLeave.setApprovalStatus(2L);
                sysLeaveMapper.updateSysLeave(sysLeave);
            }else if (timeType==2){
                if (approvalSequence==1){
                    SysLeaveApproval sysLeaveApproval2 = new SysLeaveApproval();
                    sysLeaveApproval2.setApprovalStatuss(1L);
                    sysLeaveApproval2.setApprovalSequence(2L);
                    sysLeaveApproval2.setLeaveId(leaveId);
                    List<SysLeaveApproval> sysLeaveApprovals1 = sysLeaveApprovalMapper.selectSysLeaveApprovalList(sysLeaveApproval2);
                    if (sysLeaveApprovals1.size()==1){
                        return 2;
                    }else {
                        sysLeaveApproval1.setApprovalStatuss(2L);
                        sysLeaveApprovalMapper.updateSysLeaveApproval(sysLeaveApproval1);
                        sysLeave.setApprovalStatus(2L);
                        sysLeaveMapper.updateSysLeave(sysLeave);
                    }
                }else if (approvalSequence==2){
                    sysLeaveApproval1.setApprovalStatuss(2L);
                    sysLeaveApprovalMapper.updateSysLeaveApproval(sysLeaveApproval1);
                    sysLeave.setApprovalStatus(2L);
                    sysLeaveMapper.updateSysLeave(sysLeave);
                }
            }else if (timeType==3){
                if (approvalSequence==1){
                    SysLeaveApproval sysLeaveApproval2 = new SysLeaveApproval();
                    sysLeaveApproval2.setApprovalStatuss(1L);
                    sysLeaveApproval2.setApprovalSequence(2L);
                    sysLeaveApproval2.setLeaveId(leaveId);
                    List<SysLeaveApproval> sysLeaveApprovals1 = sysLeaveApprovalMapper.selectSysLeaveApprovalList(sysLeaveApproval2);
                    if (sysLeaveApprovals1.size()==1){
                        return 2;
                    }else {
                        sysLeaveApproval1.setApprovalStatuss(2L);
                        sysLeaveApprovalMapper.updateSysLeaveApproval(sysLeaveApproval1);
                        sysLeave.setApprovalStatus(2L);
                        sysLeaveMapper.updateSysLeave(sysLeave);
                    }
                }else if (approvalSequence==2){
                    SysLeaveApproval sysLeaveApproval2 = new SysLeaveApproval();
                    sysLeaveApproval2.setApprovalStatuss(1L);
                    sysLeaveApproval2.setApprovalSequence(2L);
                    sysLeaveApproval2.setLeaveId(leaveId);
                    List<SysLeaveApproval> sysLeaveApprovals1 = sysLeaveApprovalMapper.selectSysLeaveApprovalList(sysLeaveApproval2);
                    if (sysLeaveApprovals1.size()==1){
                        return 2;
                    }else {
                        sysLeaveApproval1.setApprovalStatuss(2L);
                        sysLeaveApprovalMapper.updateSysLeaveApproval(sysLeaveApproval1);
                        sysLeave.setApprovalStatus(2L);
                        sysLeaveMapper.updateSysLeave(sysLeave);
                    }
                }else if (approvalSequence==3){
                    sysLeaveApproval1.setApprovalStatuss(2L);
                    sysLeaveApprovalMapper.updateSysLeaveApproval(sysLeaveApproval1);
                    sysLeave.setApprovalStatus(2L);
                    sysLeaveMapper.updateSysLeave(sysLeave);
                }
            }else{
                return 2;
            }
        }else {
            return 2;
        }
        return 1;
    }

    /**
     * 批量删除请假管理
     *
     * @param leaveIds 需要删除的请假管理主键
     * @return 结果
     */
    @Override
    public int deleteSysLeaveByLeaveIds(Long[] leaveIds)
    {
        return sysLeaveMapper.deleteSysLeaveByLeaveIds(leaveIds);
    }

    /**
     * 删除请假管理信息
     *
     * @param leaveId 请假管理主键
     * @return 结果
     */
    @Override
    public int deleteSysLeaveByLeaveId(Long leaveId)
    {
        return sysLeaveMapper.deleteSysLeaveByLeaveId(leaveId);
    }

    @Override
    public List<UserList> selectUserList(List<SysUser> list) {
        List<UserList> userLists = new ArrayList<>();
        for (SysUser sysUser : list) {
            UserList userList = new UserList();
            String userName = sysUser.getNickName();
            Long userId = sysUser.getUserId();
            userList.setAddress(userId);
            userList.setValue(userName);
            userLists.add(userList);
        }
        return userLists;
    }


}
