<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

        <form id="dd" action="insertsysPosition.do" method="post" fit="true">
            <table cellpadding="2" fit="true" align="center" style="margin-top: -50px">
                <tr>
                    <td>上级职位</td></br>
                    <td><input id="cc"   name="parentId" ></td>
                </tr>
                <tr>
                    <td>职位类型</td></br>
                    <td><input id="job"  name="type" ></td>
                </tr>
                <tr>
                    <td>职位名称</td></br>
                    <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>职位描述</td></br>
                    <td><input class="easyui-textbox" name="description" data-options="multiline:true" style="height:60px"></input></td>
                </tr>
                <tr>
                    <td>排序</td></br>
                    <td><input id="ss" required="required"></td>
                    </td>
                </tr>
            </table>
        </form>
        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
        </div>
<script>
    $('#cc').combobox({
        url:'higherlist.do',
        valueField:'id',
        textField:'text'
    });
    $('#job').combobox({
        url:'joblist.do',
        valueField:'id',
        textField:'text'
    });
    $('#ss').numberspinner({
        min: 10,
        max: 100,
        value:10,
        editable: false
    });



    function submitForm(){
        $('#ff').form('submit', {
                url:'',
                success:function(data){
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
    function clearForm(){
        $('#ff').form('clear');
    }
   $(function(){
       $('#btn').linkbutton({
           iconCls: 'icon-ok'
       });
   })


</script>
</body>
</html>