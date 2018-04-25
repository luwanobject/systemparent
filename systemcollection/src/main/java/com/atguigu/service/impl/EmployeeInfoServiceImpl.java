package com.atguigu.service.impl;

import com.atguigu.bean.EmployeeInfo;
import com.atguigu.bean.EmployeeInfoExample;
import com.atguigu.bean.SysOrganizationExample;
import com.atguigu.mapper.EmployeeInfoMapper;
import com.atguigu.service.EmployeeInfoService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by luwan on 2018/4/24.
 */
@Service
public class EmployeeInfoServiceImpl implements EmployeeInfoService{

    @Autowired
    private EmployeeInfoMapper employeeInfoMapper;

    @Override
    public List<EmployeeInfo> getByExample() {
        return null;
    }

    @Override
    public List<EmployeeInfo> getListEmployeeInfo(Map<Object, Object> map) {

        return employeeInfoMapper.selectListEmployeeInfo(map);
    }

    @Override
    public Long getEmployeeInfoCount(Map<Object, Object> mp) {
        EmployeeInfoExample example=new EmployeeInfoExample();
        String name = (String) mp.get("name");
        if(StringUtils.isNoneBlank(name)){
            EmployeeInfoExample.Criteria criteria = example.createCriteria();
            criteria.andUserNameEqualTo(name);
        }

        return employeeInfoMapper.countByExample(example);
    }

    @Override
    public void insertEmployeeInfo(EmployeeInfo record) {

    }

    @Override
    public void updateByPrimaryKeySelective(EmployeeInfo record) {

    }

    @Override
    public int deleteEmployeeInfos(Map<Object, Object> mp) {
        return 0;
    }
}
