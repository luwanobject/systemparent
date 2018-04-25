package com.atguigu.controller;

import com.atguigu.bean.*;
import com.atguigu.service.SysPositionService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by luwan on 2018/4/24.
 */
@Controller
public class SysPositionContoller {
    private static final Logger logger = Logger.getLogger(SysPositionContoller.class);
    @Autowired
    private SysPositionService sysPositionService;

    @RequestMapping("deletsysPosition")
    @ResponseBody
    public AJAXResult deletsysPosition(Datas datas) {
        AJAXResult result = new AJAXResult();

        try {
            Map<Object, Object> mp = new HashMap<>();
            mp.put("sysPositions", datas.getIds());
            int i = sysPositionService.deleteSysPositions(mp);
            if(i>0){
                result.setSuccess(true);
                result.setMsg("删除陈宫成功");
            }else{
                result.setSuccess(false);
                result.setMsg("删除失败");
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.setSuccess(false);
            result.setMsg("删除失败");
        }

        return result;
    }


    @RequestMapping("insertsysPosition")
    @ResponseBody
    public AJAXResult insertsysPosition(SysPosition record) {
        AJAXResult result = new AJAXResult();
        logger.info("------------------sysPositionlist com in------------------------");
        logger.info(record);
        try {
            sysPositionService.insertSysPosition(record);
            result.setSuccess(true);
            result.setMsg("插入成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.setSuccess(false);
            result.setMsg("插入失败");
        }

        return result;
    }

    @RequestMapping("updatesysPosition")
    @ResponseBody
    public AJAXResult updatesysPosition(SysPosition record) {
        AJAXResult result = new AJAXResult();
        logger.info("------------------sysPositionlist com in------------------------");
        logger.info(record);
        try {
            sysPositionService.updateByPrimaryKeySelective(record);
            result.setSuccess(true);
            result.setMsg("修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.setSuccess(false);
            result.setMsg("修改失败");
        }

        return result;
    }


    @RequestMapping("sysPositionlist")
    @ResponseBody
    public List<SysPosition> getByExample(HttpServletResponse response) {
        logger.info("------------------sysPositionlist com in------------------------");
        List<SysPosition> byExample = sysPositionService.getByExample();
        return byExample;
    }

    @RequestMapping("sysPositionpage")
    @ResponseBody
    public page<SysPosition> sysPositionpage(Integer page, Integer rows, String name) {
        logger.info("------------------SysPosition com in------------------------");
        Map<Object, Object> mp = new HashMap<>();
        if (page == null) {
            page = 1;
        }
        if (rows == null) {
            rows = 5;
        }
        mp.put("page", (page - 1) * rows);
        mp.put("rows", rows);
        mp.put("name", name);
        page<SysPosition> pages = new page<SysPosition>();

        List<SysPosition> listids = new ArrayList<>();
        //查询出所有的数据
        List<SysPosition> list = sysPositionService.getListSysPosition(mp);
        //创建一个map集合
        Map<String, SysPosition> smp = new HashMap<>();
        //遍历组织机构的集合
        for (SysPosition sysPosition : list) {
            smp.put(sysPosition.getId(), sysPosition);
        }


        for (SysPosition sysPosition : list) {
            SysPosition children = sysPosition;
            if (children.getParentId().equals("0")) {
                listids.add(sysPosition);
            } else {
                SysPosition parent = smp.get(children.getParentId());

                parent.getChildren().add(children);
            }
        }

        Long total = sysPositionService.getSysPositionCount(mp);

        pages.setTotal(Math.toIntExact(total));
        pages.setRows(listids);


        return pages;
    }
}
