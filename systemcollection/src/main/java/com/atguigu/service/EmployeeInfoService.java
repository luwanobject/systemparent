package com.atguigu.service;

import com.atguigu.bean.EmployeeInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by luwan on 2018/4/24.
 */
public interface EmployeeInfoService {
    List<EmployeeInfo> getByExample();

    List<EmployeeInfo> getListEmployeeInfo(Map<Object,Object> map);

    Long  getEmployeeInfoCount(Map<Object,Object> mp);

    void  insertEmployeeInfo(EmployeeInfo record);

    void updateByPrimaryKeySelective(EmployeeInfo record);

    int deleteEmployeeInfos(Map<Object,Object> mp);
}
