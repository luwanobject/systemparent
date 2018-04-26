package com.atguigu.controller;

import com.atguigu.bean.*;
import com.atguigu.service.EmployeeInfoService;
import com.atguigu.service.SysOrganizationService;
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
public class EmployeeInfoController {
    private static final Logger logger = Logger.getLogger(EmployeeInfoController.class);

    @Autowired
    private EmployeeInfoService employeeInfoService;

    @Autowired
    private SysOrganizationService sysOrganizationService;

    @Autowired
    private SysPositionService sysPositionService;

    @RequestMapping("EmployeeInfo")
    @ResponseBody
    public AJAXResult employeeInfo(Datas datas ){
        AJAXResult result=new AJAXResult();

        try {
            Map<Object,Object> mp=new HashMap<>();
            mp.put("organizations",datas.getIds());
            employeeInfoService.deleteEmployeeInfos(mp);
            result.setSuccess(true);
            result.setMsg("删除陈宫成功");
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
            result.setMsg("删除失败");
        }

        return result;
    }


    @RequestMapping("insertemployeeInfo")
    @ResponseBody
    public AJAXResult insertorganization(EmployeeInfoWithBLOBs employeeInfo ){
        AJAXResult result=new AJAXResult();
        employeeInfo.setId(UUID.randomUUID().toString());
        employeeInfo.setStatus(1);
        logger.info("------------------organizationlist com in------------------------");
        logger.info(employeeInfo);
        try {
            employeeInfoService.insertEmployeeInfo(employeeInfo);
            result.setSuccess(true);
            result.setMsg("插入成功");
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
            result.setMsg("插入失败");
        }

        return result;
    }

    @RequestMapping("updateemployeeInfo")
    @ResponseBody
    public AJAXResult updateorganization(EmployeeInfoWithBLOBs employeeInfo ){
        AJAXResult result=new AJAXResult();
        logger.info("------------------organizationlist com in------------------------");
        logger.info(employeeInfo);
        try {
            employeeInfo.setModifyTime(new Date());
            employeeInfoService.updateByPrimaryKeySelective(employeeInfo);
            result.setSuccess(true);
            result.setMsg("修改成功");
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
            result.setMsg("修改失败");
        }

        return result;
    }
    @RequestMapping("emplyejoblist")
    @ResponseBody
    public Object joblist(HttpServletResponse response){
        List<SysOrganization> list = sysOrganizationService.getByExample();
        List<ResultSelect> resultSelects=new ArrayList<>();

        HashSet<String>  hs=new HashSet();
        for (SysOrganization sysOrganization:list){
            hs.add(sysOrganization.getParentId());
        }
        int i=0;
        for (SysOrganization sysOrganization:list){
           if( hs.contains(sysOrganization.getId())){

               ResultSelect rets=new ResultSelect();
               if(i==0){
                   rets.setSelected(true);
                   i=1;
               }
               rets.setId(sysOrganization.getId());
               rets.setText(sysOrganization.getName());

               resultSelects.add(rets);
           }

        }

        return resultSelects;
    }

    @RequestMapping("stationlist")
    @ResponseBody
    public Object stationlist(HttpServletResponse response){
        List<SysPosition> list = sysPositionService.getByExample();
        List<ResultSelect> resultSelects=new ArrayList<>();

        HashSet<String>  hs=new HashSet();

        int i=0;
        for (SysPosition sysPosition:list){
                ResultSelect rets=new ResultSelect();
                if(i==0){
                    rets.setSelected(true);
                    i=1;
                }
                rets.setId(sysPosition.getId());
                rets.setText(sysPosition.getName());

                resultSelects.add(rets);
        }

        return resultSelects;
    }


    @RequestMapping("employeeInfolist")
    @ResponseBody
    public List<EmployeeInfo> getByExample(HttpServletResponse response){
        logger.info("------------------organizationlist com in------------------------");
        List<EmployeeInfo> byExample = employeeInfoService.getByExample();
        return byExample;
    }

    @RequestMapping("EmployeeInfolistpage")
    @ResponseBody
    public page<EmployeeInfo> organizationlistpage(Integer page, Integer rows, String name){
        logger.info("------------------EmployeeInfolistpage com in------------------------");
        Map<Object,Object> mp=new HashMap<>();
        if(page==null){
            page=1;
        }
        if(rows==null){
            rows=5;
        }
        mp.put("page",(page-1)*rows);
        mp.put("rows",rows);
        mp.put("name",name);
        page<EmployeeInfo>  pages=new page<EmployeeInfo>();

        //查询出所有的数据
        List<EmployeeInfo> list = employeeInfoService.getListEmployeeInfo(mp);


        Long total = employeeInfoService.getEmployeeInfoCount(mp);

        pages.setTotal(Math.toIntExact(total));
        pages.setRows(list);


        return pages;
    }

}
