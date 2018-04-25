package com.atguigu.mapper;

import com.atguigu.bean.SysPosition;
import com.atguigu.bean.SysPositionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SysPositionMapper {
    long countByExample(SysPositionExample example);

    int deleteByExample(SysPositionExample example);

    int deleteByPrimaryKey(String id);

    int insert(SysPosition record);

    int insertSelective(SysPosition record);

    List<SysPosition> selectByExample(SysPositionExample example);

    SysPosition selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") SysPosition record, @Param("example") SysPositionExample example);

    int updateByExample(@Param("record") SysPosition record, @Param("example") SysPositionExample example);

    int updateByPrimaryKeySelective(SysPosition record);

    int updateByPrimaryKey(SysPosition record);

    List<SysPosition> selectListpage(Map<Object, Object> map);

    int deleteSysPositions(Map<Object,Object> mp);


}