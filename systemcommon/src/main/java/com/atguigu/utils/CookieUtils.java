/*
package com.atguigu.utils;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Configuration;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

;

*/
/**
 *
 *//*

@Configuration
public class CookieUtils {
    private static final String SALT = "tmp_20180328.";
    private static final String SA_TMP = "_sale_tmp";
    private static final String SA_UN = "_ct_un";//用户cookie
    private static final String SP_UN = "SP_UN";//商品cookie
    private static final String COOKIE_PATH = "/";
    private static final int COOKIE_MAX_AGE = 60 * 60 * 24 * 7; // 7 days in second

    public static Cookie createTmpCookie(String userName) {
        Cookie tmp = new Cookie(SA_TMP, DigestUtils.md5Hex(SALT + userName));
        tmp.setMaxAge(COOKIE_MAX_AGE);
        tmp.setPath(COOKIE_PATH);
        tmp.setHttpOnly(true);
        return tmp;
    }

    public static Cookie createUserNameCookie(String userName) throws UnsupportedEncodingException {
        Cookie un = new Cookie(SA_UN, URLEncoder.encode(userName,"utf-8"));
        un.setMaxAge(COOKIE_MAX_AGE);
        un.setPath(COOKIE_PATH);
//       un.setHttpOnly(true);

        return un;
    }

    public static boolean isTmpCookie(String cookieName) {

        return StringUtils.equals(SA_TMP, cookieName);
    }

    public static boolean isUserNameCookie(String cookieName) {

        return StringUtils.equals(SA_UN, cookieName);
    }


    public static boolean validTmpCookie(String userName, Cookie cookie) {
        if (StringUtils.isEmpty(userName)) {
            return false;
        }
        if (!StringUtils.equals(SA_TMP, cookie.getName())) {
            return false;
        }

        String md5UserName = DigestUtils.md5Hex(SALT + userName);
        return StringUtils.equals(cookie.getValue(), md5UserName);
    }

    public static boolean clearCookies(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        if (httpServletRequest.getCookies() != null) {
            for (Cookie cookie : httpServletRequest.getCookies()) {
                if (cookie.getName().equals(SA_TMP)) {
                    cookie.setMaxAge(0);
                    cookie.setValue("");
                    cookie.setPath("/");
                    httpServletResponse.addCookie(cookie);
                    continue;
                }

                if (cookie.getName().equals(SA_UN)) {
                    cookie.setMaxAge(0);
                    cookie.setValue("");
                    cookie.setPath("/");
                    httpServletResponse.addCookie(cookie);
                }
            }

            return true;
        }

        return false;
    }

    public static void createUserNameCookie() {
    }
}
*/
