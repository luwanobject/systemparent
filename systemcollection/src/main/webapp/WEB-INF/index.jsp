<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../css/formbase.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
       function addorganizationg(url,name){
           console.info(url);
          $('#pp').panel('open').panel('refresh',url);

       }
    </script>
</head>
<body  class="easyui-layout">
<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">要账系统管理
    <hr>
</div>
<div data-options="region:'west',split:true,title:'West'" style="width:200px;padding:10px;">
    <div class="easyui-accordion" style="width:180px;">
        <div title="About" data-options="iconCls:'icon-ok'">
            <ul>
                <li><a href="javascript:addorganizationg('organization.do','组织机构')">组织机构</a></li>
                <li><a href="javascript:add_tap2()">员工管理</a></li>
                <li><a href="javascript:add_tap2('goto_sku.do','商品库存单元管理')">职位管理</a></li>
                <li><a href="javascript:add_tap2('goto_sku.do','商品库存单元管理')">委托方管理</a></li>
                <li><a href="javascript:add_tap2('goto_sku.do','商品库存单元管理')">批次管理</a></li>
                <li><a href="javascript:add_tap2('goto_sku.do','商品库存单元管理')">案件管理</a></li>
                <li><a href="javascript:add_tap2('goto_sku.do','商品库存单元管理')">还款管理</a></li>
            </ul>

            <br>
        </div>
        <div title="About" data-options="iconCls:'icon-ok'">
            <ul>
                <li>商品缓存管理</li>
            </ul>
        </div>
    </div>
</div>
<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
<div id="pp"  data-options="region:'center',title:'欢迎'" style="overflow: hidden">

</div>
</body>
</html>
