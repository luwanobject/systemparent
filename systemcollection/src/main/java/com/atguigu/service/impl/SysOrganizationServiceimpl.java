package com.atguigu.service.impl;

import com.atguigu.bean.SysOrganization;
import com.atguigu.bean.SysOrganizationExample;
import com.atguigu.mapper.SysOrganizationMapper;
import com.atguigu.service.SysOrganizationService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.*;

/**
 * Created by luwan on 2018/4/21.
 */
@Service
public class SysOrganizationServiceimpl  implements SysOrganizationService{

    @Autowired
    private SysOrganizationMapper sysOrganizationMapper;


    @Override
    public List<SysOrganization> getByExample() {
        SysOrganizationExample sysOrganization=new SysOrganizationExample();
        List<SysOrganization> list = sysOrganizationMapper.selectByExample(sysOrganization);
        return list;
    }

    @Override
    public List<SysOrganization> getListSysOrganization(Map<Object,Object> map) {


        return sysOrganizationMapper.selectListSysOrganization(map);
    }

    @Override
    public Long getSysOrganizationCount(Map<Object,Object> mp) {
        SysOrganizationExample example=new SysOrganizationExample();
        String name = (String) mp.get("name");
        if(StringUtils.isNoneBlank(name)){
            SysOrganizationExample.Criteria criteria = example.createCriteria();
            criteria.andNameEqualTo(name);
        }

        return sysOrganizationMapper.countByExample(example);
}

    @Override
    public void insertSysOrganization(SysOrganization record) {

        record.setId(UUID.randomUUID().toString());
        record.setCreateTime(new Date());

        sysOrganizationMapper.insert(record);
    }

    @Override
    public void updateByPrimaryKeySelective(SysOrganization record) {
        sysOrganizationMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int deleteSysOrganizations(Map<Object, Object> mp) {
        int i = sysOrganizationMapper.deleteSysOrganizations(mp);
        return i;
    }


}
