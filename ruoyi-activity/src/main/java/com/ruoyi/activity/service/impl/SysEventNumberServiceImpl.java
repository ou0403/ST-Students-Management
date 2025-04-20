package com.ruoyi.activity.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.ruoyi.activity.domain.SysEventTime;
import com.ruoyi.activity.mapper.SysEventTimeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.activity.mapper.SysEventNumberMapper;
import com.ruoyi.activity.domain.SysEventNumber;
import com.ruoyi.activity.service.ISysEventNumberService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 行事历期数Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-04-15
 */
@Service
public class SysEventNumberServiceImpl implements ISysEventNumberService 
{
    @Autowired
    private SysEventNumberMapper sysEventNumberMapper;

    @Autowired
    private SysEventTimeMapper sysEventTimeMapper;
    /**
     * 查询行事历期数
     * 
     * @param numberId 行事历期数主键
     * @return 行事历期数
     */
    @Override
    public SysEventNumber selectSysEventNumberByNumberId(Long numberId)
    {
        return sysEventNumberMapper.selectSysEventNumberByNumberId(numberId);
    }
    /**
     * 查询行事历期数列表
     * 
     * @param sysEventNumber 行事历期数
     * @return 行事历期数
     */
    @Override
    public List<SysEventNumber> selectSysEventNumberList(SysEventNumber sysEventNumber)
    {
        return sysEventNumberMapper.selectSysEventNumberList(sysEventNumber);
    }
    /**
     * 新增行事历期数
     * 
     * @param sysEventNumber 行事历期数
     * @return 结果
     */
    @Override
    public int insertSysEventNumber(SysEventNumber sysEventNumber)
    {
        return sysEventNumberMapper.insertSysEventNumber(sysEventNumber);
    }
    /**
     * 新增行事历期数,并创建周数表
     *
     * @param sysEventNumber 行事历期数
     * @param userId
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertSysEventNumbers(SysEventNumber sysEventNumber, Long userId)
    {
        int is =sysEventNumberMapper.insertSysEventNumber(sysEventNumber);
        if (is>0){
            List<SysEventNumber> sysEventNumbers = sysEventNumberMapper.selectSysEventNumberList(sysEventNumber);
            SysEventNumber sen = sysEventNumbers.get(0);
            System.out.println("------------------"+sen);
            //numberId
            Long numberId = sen.getNumberId();
            //开学时间
            Date numberTime = sen.getNumberTime();
            //总期数
            Long numberWeeks = sen.getNumberWeeks();

            if(numberId != null && numberWeeks > 0 && numberTime!= null){
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(numberTime);
                SysEventTime sysEventTime = new SysEventTime();
                sysEventTime.setNumberId(numberId);
                try {
                    for (int i = 1;i <= numberWeeks;i++){
                        System.out.println(i);
                        Date M = calendar.getTime();
                        calendar.add(Calendar.DAY_OF_WEEK, 6);
                        Date S = calendar.getTime();
                        sysEventTime.setEventWeeks((long) i);
                        sysEventTime.setMondayDate(M);
                        sysEventTime.setSundayDate(S);
                        sysEventTime.setUserId(userId);
                        sysEventTimeMapper.insertSysEventTime(sysEventTime);
                        calendar.add(Calendar.DAY_OF_WEEK, 1);
                    }
                }catch (Exception e){
                    throw new RuntimeException("创建行事历失败",e);
                }
            }else {
                throw new RuntimeException("创建行事历失败");
            }
        }else {
            throw new RuntimeException("创建行事历失败");
        }
        return is;
    }

    /**
     * 修改行事历期数
     * 
     * @param sysEventNumber 行事历期数
     * @return 结果
     */
    @Override
    public int updateSysEventNumber(SysEventNumber sysEventNumber)
    {
        return sysEventNumberMapper.updateSysEventNumber(sysEventNumber);
    }
    /**
     * 批量删除行事历期数
     * 
     * @param numberIds 需要删除的行事历期数主键
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteSysEventNumberByNumberIds(Long[] numberIds)
    {
        for (Long numberId : numberIds) {
            SysEventTime sysEventTime = new SysEventTime();
            sysEventTime.setNumberId(numberId);
            List<SysEventTime> sysEventTimes = sysEventTimeMapper.selectSysEventTimeList(sysEventTime);
            if (!sysEventTimes.isEmpty()){
                try{
                    for (SysEventTime set : sysEventTimes) {
                        sysEventTimeMapper.deleteSysEventTimeByTimeId(set.getTimeId());
                    }
                }catch (Exception e){
                    throw new RuntimeException("删除失败",e);
                }
            }
        }
        return sysEventNumberMapper.deleteSysEventNumberByNumberIds(numberIds);
    }
    /**
     * 删除行事历期数信息
     * 
     * @param numberId 行事历期数主键
     * @return 结果
     */
    @Override
    public int deleteSysEventNumberByNumberId(Long numberId)
    {
        return sysEventNumberMapper.deleteSysEventNumberByNumberId(numberId);
    }
}
