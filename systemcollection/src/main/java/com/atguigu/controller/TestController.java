package com.atguigu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by luwan on 2018/4/20.
 */
@Controller
public class TestController {
    @GetMapping("test")
    @ResponseBody
    public Object test(){
        String s="hellowrold";
        return  s;
    }
}
