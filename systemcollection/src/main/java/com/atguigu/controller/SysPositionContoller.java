package com.atguigu.controller;

import com.atguigu.bean.*;
import com.atguigu.service.SysPositionService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.*;

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
                result.setMsg("删除成功");
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
        record.setId(String.valueOf(System.currentTimeMillis()));
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
            record.setModifyTime(new Date());
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

    @RequestMapping("higherlist")
    @ResponseBody
    public Object higherlist() {
        List<SysPosition> list = sysPositionService.getByExample();

        List<ResultSelect> resultSelects=new ArrayList<>();
        for (SysPosition sysPosition:list){
            ResultSelect rets=new ResultSelect();
            if(sysPosition.getName().equals("总监")){
                rets.setSelected(true);
            }
            rets.setId(sysPosition.getId());
            rets.setText(sysPosition.getName());
            resultSelects.add(rets);
        }
        return resultSelects;
    }
    @RequestMapping("joblist")
    @ResponseBody
    public Object joblist() {
        List<SysPosition> list = sysPositionService.getByExample();

        List<ResultSelect> resultSelects=new ArrayList<>();
        for (SysPosition sysPosition:list){
            ResultSelect rets=new ResultSelect();
            if(sysPosition.getName().equals("主任")){
                rets.setSelected(true);
            }
            rets.setId(sysPosition.getType());
            rets.setText(sysPosition.getName());
            resultSelects.add(rets);
        }
        return resultSelects;
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
    public Object sysPositionpage() {
        logger.info("------------------SysPosition com in------------------------");

        //查询出所有的数据
        List<SysPosition> list = sysPositionService.getByExample();
        Map<Object,Object> mp=new HashMap<>();

        mp.put("rows",list);

        return mp;
    }
}
