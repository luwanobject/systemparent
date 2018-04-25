package com.atguigu.service;

import com.atguigu.bean.SysOrganization;
import com.atguigu.bean.SysOrganizationExample;

import java.util.List;
import java.util.Map;

/**
 * Created by luwan on 2018/4/21.
 */
public interface SysOrganizationService  {

    List<SysOrganization> getByExample();

    List<SysOrganization> getListSysOrganization(Map<Object,Object> map);

    Long  getSysOrganizationCount(Map<Object,Object> mp);

    void  insertSysOrganization(SysOrganization record);

    void updateByPrimaryKeySelective(SysOrganization record);

    int deleteSysOrganizations(Map<Object,Object> mp);
}
