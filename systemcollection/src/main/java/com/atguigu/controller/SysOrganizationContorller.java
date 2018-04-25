package com.atguigu.controller;

import com.atguigu.bean.AJAXResult;
import com.atguigu.bean.Datas;
import com.atguigu.bean.SysOrganization;
import com.atguigu.bean.page;
import com.atguigu.service.SysOrganizationService;
import com.atguigu.utils.FastJsonUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * Created by luwan on 2018/4/21.
 */
@Controller
public class SysOrganizationContorller {

    private static final Logger logger = Logger.getLogger(SysOrganizationContorller.class);

    @Autowired
    private SysOrganizationService sysOrganizationService;

    @RequestMapping("deletorganization")
    @ResponseBody
    public AJAXResult deletorganization(Datas datas ){
        AJAXResult result=new AJAXResult();

        try {
            Map<Object,Object> mp=new HashMap<>();
            mp.put("organizations",datas.getIds());
            sysOrganizationService.deleteSysOrganizations(mp);
            result.setSuccess(true);
            result.setMsg("删除成功");
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
            result.setMsg("删除失败");
        }

        return result;
    }


    @RequestMapping("insertorganization")
    @ResponseBody
    public AJAXResult insertorganization(SysOrganization sysOrganization ){
        AJAXResult result=new AJAXResult();
        logger.info("------------------organizationlist com in------------------------");
        logger.info(sysOrganization);
        try {
            sysOrganizationService.insertSysOrganization(sysOrganization);
            result.setSuccess(true);
            result.setMsg("插入成功");
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
            result.setMsg("插入失败");
        }

        return result;
    }

    @RequestMapping("updateorganization")
    @ResponseBody
    public AJAXResult updateorganization(SysOrganization sysOrganization ){
        AJAXResult result=new AJAXResult();
        logger.info("------------------organizationlist com in------------------------");
        logger.info(sysOrganization);
        try {
            sysOrganization.setModifyTime(new Date());
            sysOrganizationService.updateByPrimaryKeySelective(sysOrganization);
            result.setSuccess(true);
            result.setMsg("修改成功");
        }catch (Exception e){
            e.printStackTrace();
            result.setSuccess(false);
            result.setMsg("修改失败");
        }

        return result;
    }


    @RequestMapping("organizationlist")
    @ResponseBody
    public  List<SysOrganization> getByExample(HttpServletResponse response){
        logger.info("------------------organizationlist com in------------------------");
        List<SysOrganization> byExample = sysOrganizationService.getByExample();
        return byExample;
    }

    @RequestMapping("organizationlistpage")
    @ResponseBody
    public  Map<String,Object> organizationlistpage(){
        logger.info("------------------organizationlist com in------------------------");

        page<SysOrganization>  pages=new page<SysOrganization>();
        List<SysOrganization> list = sysOrganizationService.getListSysOrganization();
        logger.info(list);
         Map<String,Object> resultmp=new HashMap();

        resultmp.put("rows",list);
        return resultmp;
}


}
