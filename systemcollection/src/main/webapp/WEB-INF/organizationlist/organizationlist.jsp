<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
        $(function () {

        })


    </script>
</head>
<body >
<button onclick="myadd()" >新增</button>
<button onclick="complie()">编辑</button>
<button onclick="dellete()">删除</button>
<table id="tr" class="easyui-datagrid" style="width:1300px;height:250px"
       data-options="url:'organizationlist.do',
       fitColumns:true,
       singleSelect:true,
       idField:'id'">
    <thead>
    <tr>
        <th data-options="field:'id',width:200">id</th>
        <th data-options="field:'version',width:200">版本</th>
        <th data-options="field:'status',width:200">系统状态</th>
        <th data-options="field:'name',width:200,align:'right'">机构名称</th>
        <th data-options="field:'parentId',width:200,align:'right'">上级部门</th>
        <th data-options="field:'address',width:200,align:'right'">地址</th>
        <th data-options="field:'phone',width:200,align:'right'">电话号码</th>
        <th data-options="field:'postCode',width:200,align:'right'">邮政编码</th>
        <th data-options="field:'fax',width:200,align:'right'">传真号</th>
        <th data-options="field:'type',width:200,align:'right'">机构类型</th>
        <th data-options="field:'orderNo',width:200,align:'right'">排序号</th>
        <th data-options="field:'code',width:200,align:'right'">机构编码</th>
        <th data-options="field:'principalId',width:200,align:'right'">机构负责人ID</th>
        <th data-options="field:'path',width:200,align:'right'">机构路径</th>
    </tr>
    </thead>
</table>
<div id="addwin"  class="easyui-window" title="添加"  closed="true" style=" padding:10px;width:400px;height:400px;">
    <jsp:include page="addOrg.jsp"></jsp:include>
</div>

<div id="compliewin" class="easyui-window" title="编辑" closed="true" style="padding:10px;width:200px;height:100px;">
    window content
</div>

<div id="delletewin" class="easyui-window" title="删除" closed="true" style="padding:10px;width:200px;height:100px;">
    window content
</div>
</body>
</html>
