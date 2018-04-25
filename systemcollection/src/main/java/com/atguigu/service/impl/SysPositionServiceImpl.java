package com.atguigu.service.impl;

import com.atguigu.bean.SysOrganization;
import com.atguigu.bean.SysOrganizationExample;
import com.atguigu.bean.SysPosition;
import com.atguigu.bean.SysPositionExample;
import com.atguigu.mapper.SysOrganizationMapper;
import com.atguigu.mapper.SysPositionMapper;
import com.atguigu.service.SysOrganizationService;
import com.atguigu.service.SysPositionService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by luwan on 2018/4/24.
 */
@Service
public class SysPositionServiceImpl implements SysPositionService {
    @Autowired
    private SysPositionMapper sysPositionMapper;


    @Override
    public List<SysPosition> getByExample() {
        SysPositionExample sysPositionExample=new SysPositionExample();
        return sysPositionMapper.selectByExample(sysPositionExample);
    }

    @Override
    public List<SysPosition> getListSysPosition(Map<Object, Object> map) {
        return sysPositionMapper.selectListpage(map);
    }

    @Override
    public Long getSysPositionCount(Map<Object, Object> mp) {
        SysPositionExample example=new SysPositionExample();
        String name = (String) mp.get("name");
        if(StringUtils.isNoneBlank(name)){
            SysPositionExample.Criteria criteria = example.createCriteria();
            criteria.andNameEqualTo(name);
        }
        return sysPositionMapper.countByExample(example);
    }

    @Override
    public void insertSysPosition(SysPosition record) {
        sysPositionMapper.insert(record);

    }

    @Override
    public void updateByPrimaryKeySelective(SysPosition record) {
        sysPositionMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int deleteSysPositions(Map<Object, Object> mp) {
        int i = sysPositionMapper.deleteSysPositions(mp);
        return i;
    }
}
