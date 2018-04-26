<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>催收系统</title>

</head>
<body>
<div style="margin:20px 0;"></div>

<form id="dd"  method="post" fit="true" style="margin-top: 80px">
    <table cellpadding="2" fit="true" align="center" >
        <tr>
            <td>账号</td>
            <td><input name="loginName"></td>
            <td>初始密码</td>
            <td><input name="password"></td>
            <td>姓名</td>
            <td><input name="userName"></td>
        </tr>

        <tr>
            <td style="text-align:right;">性别：</td>
            <td style="text-align:left">
            <span class="radioSpan">
                <input type="radio" name="sex" value="true">男</input>
                <input type="radio" name="sex" value="false">女</input>
            </span>
            </td>
            <td>联系方式</td>
            <td><input name="contactMode"></td>
            <td>入职日期</td>
            <td><input  name="joinTime" class="easyui-datebox" required="required"></input></td>
        </tr>
        <tr>
            <td>坐席用户</td>
            <td><input name="ccLogin"></td>
            <td>坐席密码</td>
            <td><input name="ccPwd"></td>
            <td>服务地址</td>
            <td><input name="ccServer"></td>
        </tr>
        <tr>
            <td>坐席号</td>
            <td><input name="ccPhone"></td>
            <td>所属机构</td>
            <td><input id="cccc" name="orgId"></td>
            <td>岗位</td>
            <td><input name="type" id="positionId"></td>
        </tr>
        <tr>
            <td>附加机构</td>
            <td><input name="attachOrgId"></td>
            <td>关联角色</td>
            <td><input name="type"></td>
            <td>委托方</td>
            <td><input name="attachEntrustId"></td>
        </tr>
    </table>
</form>
<div style="text-align:center;padding:5px">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
</div>
<script>
    $('#cccc').combobox({
        url:'emplyejoblist.do',
        valueField:'id',
        textField:'text',
        onSelect:function(record){

        }
    });

    $('#positionId').combobox({
        url:'stationlist.do',
        valueField:'id',
        textField:'text',
        onSelect:function(record){

        }
    });





    function submitForm() {
        alert("1111111");
        $('#dd').form('submit', {
            url: 'insertemployeeInfo.do',
            success: function (data) {
                if(data.success){
                    $.messager.show({
                        msg:data.msg,
                        tile:'成功'
                    });
                    $('#addwin').window('close');
                }else{

                    $.messager.alert('错误'.data.msg,'error')
                }
            }
        });


    }
    function clearForm() {
        $('#ff').form('clear');
    }
    $(function () {
        $('#btn').linkbutton({
            iconCls: 'icon-ok'
        });
    })


</script>
</body>
</html>