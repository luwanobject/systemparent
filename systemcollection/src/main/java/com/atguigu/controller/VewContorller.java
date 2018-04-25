package com.atguigu.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by luwan on 2018/4/21.
 */
@Controller
public class VewContorller {
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
}
