package com.atguigu.service;

import com.atguigu.bean.SysPosition;
import com.atguigu.bean.SysPosition;

import java.util.List;
import java.util.Map;

/**
 * Created by luwan on 2018/4/24.
 */
public interface SysPositionService {

    List<SysPosition> getByExample();

    List<SysPosition> getListSysPosition(Map<Object,Object> map);

    Long  getSysPositionCount(Map<Object,Object> mp);

    void  insertSysPosition(SysPosition record);

    void updateByPrimaryKeySelective(SysPosition record);

    int deleteSysPositions(Map<Object,Object> mp);
}
