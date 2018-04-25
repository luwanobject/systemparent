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
<div >
    <form id="sysform" action="addOrg.do" method="post" align="center">
        <input type="hidden" name="id" value="${org.id}">
            <br>
            机构类型：
            <select name="parentId">
                <%--<option value="0">总公司</option>
                <option value="1">分公司</option>
                <option value="3">小组</option>--%>
                <c:forEach items="${SysOrganizations}" var="sysOrganization">
                    <option value="${sysOrganization.id}">${sysOrganization.name}</option>
                </c:forEach>
            </select>
            <br>
            负责人：&nbsp&nbsp
            <input type="text" name="name" value="">
            <br>
            机构名称:
            <input type="text" name="name" value="">
            <br>
            地址:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <input type="text" name="address">
            <br>
            电话号码:
            <input type="text" name="phone">
            <br>
            邮政编码:
            <input type="text" name="post_code">
            <br>
            传真号:&nbsp&nbsp&nbsp
            <input type="text" name="fax">
            <br>
            <a id="btn" href="javascrp:()" onclick="subfrom()">提交</a>
    </form>
</div>


<script>
   $(function(){
       $('#btn').linkbutton({
           iconCls: 'icon-ok'
       });
   })
    function subfrom() {
        var jsondata=$("#sysform").serialize();
        $.ajax({
            type: "POST",
            url: "insertorganization.do",
            data: jsondata,
            success: function(data){
                if(data.success){
                    $.messager.show({
                        msg:data.msg,
                        tile:'成功'
                    });
                    obdatagrid.treegrid('reload');
                    obdatagrid.treegrid('unselectAll');
                    $('#addwin').window('close');
                }else{
                    obdatagrid.treegrid('rejectChanges');
                    $.messager.alert('错误'.data.msg,'error')
                }
            }
        });

   }

</script>
</body>
</html>