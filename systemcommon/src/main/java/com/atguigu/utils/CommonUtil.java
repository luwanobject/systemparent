package com.atguigu.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by luwan on 2018/3/28.
 */
public class CommonUtil {
    private static final String EMAIL_CHECKER = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
    private static final Pattern EMAIL_REGEX = Pattern.compile(EMAIL_CHECKER);



    /**
     * 换取当前方法的方法名称
     * @return  当前方法名称
     */
    public static String getCurrentMethodName() {
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        return stackTrace[2].getMethodName();
    }

    /**
     * 验证邮箱格式有效性
     * @param email
     * @return
     */
    public static final synchronized boolean checkEmail(String email) {
        boolean flag;
        try{
            Matcher matcher = EMAIL_REGEX.matcher(email);
            flag = matcher.matches();
        }catch(Exception e){
            flag = false;
        }
        return flag;
    }

    /**
     * url编码
     * @param url
     * @return
     */
    public static String encode(String url)

    {

        try {

            String encodeURL= URLEncoder.encode( url, "UTF-8" );

            return encodeURL;

        } catch (UnsupportedEncodingException e) {

            return "Issue while encoding" +e.getMessage();

        }

    }

    /**
     * url解码
     * @param url
     * @return
     */
    public static String decode(String url)

    {

        String encodeURL= null;
        try {
            encodeURL = URLDecoder.decode(url,"utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return encodeURL;

    }
}
