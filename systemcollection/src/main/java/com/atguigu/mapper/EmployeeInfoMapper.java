package com.atguigu.mapper;

import com.atguigu.bean.EmployeeInfo;
import com.atguigu.bean.EmployeeInfoExample;
import com.atguigu.bean.EmployeeInfoWithBLOBs;
import com.atguigu.bean.SysOrganization;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface EmployeeInfoMapper {
    long countByExample(EmployeeInfoExample example);

    int deleteByExample(EmployeeInfoExample example);

    int deleteByPrimaryKey(String id);

    int insert(EmployeeInfoWithBLOBs record);

    int insertSelective(EmployeeInfoWithBLOBs record);

    List<EmployeeInfoWithBLOBs> selectByExampleWithBLOBs(EmployeeInfoExample example);

    List<EmployeeInfo> selectByExample(EmployeeInfoExample example);

    EmployeeInfoWithBLOBs selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") EmployeeInfoWithBLOBs record, @Param("example") EmployeeInfoExample example);

    int updateByExampleWithBLOBs(@Param("record") EmployeeInfoWithBLOBs record, @Param("example") EmployeeInfoExample example);

    int updateByExample(@Param("record") EmployeeInfo record, @Param("example") EmployeeInfoExample example);

    int updateByPrimaryKeySelective(EmployeeInfoWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(EmployeeInfoWithBLOBs record);

    int updateByPrimaryKey(EmployeeInfo record);

    List<EmployeeInfo> selectListEmployeeInfo(Map<Object,Object> mp);
}