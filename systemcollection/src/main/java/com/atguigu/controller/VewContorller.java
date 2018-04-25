package com.atguigu.controller;

import com.atguigu.bean.SysOrganization;
import com.atguigu.service.SysOrganizationService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by luwan on 2018/4/21.
 */
@Controller
public class VewContorller {
    @Autowired
    private SysOrganizationService sysOrganizationService;

    private static final Logger logger = Logger.getLogger(VewContorller.class);
    @RequestMapping("organizationlisturl")
    public String organizationlist(){
        logger.info("organizationlisturl  com in");
        return "organizationlist/organizationlist";
    }
    @RequestMapping("index")
    public String index(){
        logger.info("index com in");
        return "index";
    }
    @RequestMapping("organization")
    public String organization(){
        logger.info("organization com in");
        return "organization/organizationlist";
    }
    @RequestMapping("goto_addOrg")
    public String addOrg(ModelMap map){
        logger.info("addOrg com in");

        List<SysOrganization> list = sysOrganizationService.getByExample();
        map.put("SysOrganizations",list);

        return "organizationlist/addOrg";
    }

    @RequestMapping("goto_sysPosition")
    public String goto_SysPosition(){
        logger.info("goto_SysPosition com in");
        return "SysPosition/sysPosition";
    }
    @RequestMapping("goto_employeeInfo")
    public String goto_employeeInfo(){
        logger.info("goto_employeeInfo com in");
        return "employeeInfo/employeeInfo";
    }
}
