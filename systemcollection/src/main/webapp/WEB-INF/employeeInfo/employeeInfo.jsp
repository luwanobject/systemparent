<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script type="text/javascript" charset="utf-8">

    $(function(){
        loadtagrid();
    });
    var obdatagrid;
    var objaddinde=undefined;
    var onClickRow=undefined;
    function loadtagrid(){
        obdatagrid =$('#tr').treegrid({
            url:'EmployeeInfolistpage.do',
            columns:[[
                {   field:'id',
                    title:'id',
                    width:100,
                    checkbox:true
                },
                {
                    field:'status',
                    title:'员工状态',
                    width:100,
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    },
                    formatter: function(value,row,index){

                       if(row.status==1){

                           return "<a href='javascript:;' onclick=delHsCode(2,"+row.id+")  style='cursor: pointer'>启用</a>";
                       }else{
                           return "<a href='javascript:;' onclick=delHsCode(1,"+row.id+")  style='cursor: pointer'>停用</a>";
                       }
                    }

                },
                {
                    field:'loginName',
                    title:'员工账号',
                    width:100,
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {
                    field:'contactMode',
                    title:'联系方式',
                    width:100,
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {
                    field:'ccLogin',
                    title:'坐席用户',
                    width:100,
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {
                    field:'ccPwd',
                    title:'坐席密码',
                    width:100,
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {
                    field:'ccServer',
                    title:'服务地址',
                    width:100,
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {
                    field:'ccPhone',
                    title:'坐席号',
                    width:100,
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {
                    field:'ccPhone',
                    title:'坐席号',
                    width:100,
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {
                    field:'ccPhone',
                    title:'坐席号',
                    width:100,
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {field:'joinTime',title:'入职时间',width:100,align:'right',
                    formatter: function(value,row,index){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString();
                    }

                }
            ]],
            title:"员工表",
            iconCls:"icon-save",
            pagination:true,
            pageSize:5,
            pageNumber:1,
            pageList:[5,10,15,20,25],
            fit:true,
            fitColumns:true,
            nowrap:false,
            border:false,
            idField:'id',
            animate:true,
            toolbar:[{
                text:'增加',
                iconCls:'icon-add',
                handler:function () {
                    if(onClickRow==undefined){
                        $('#addwin').window({
                            width:900,
                            height:400,
                            modal:true,
                            href:'go_employeeadd.do'
                        });


//                        $('#addwin').window('refresh', 'addOrg.do');*/
                    }


                }
                },'-',
                {
                    text:'删除',
                    iconCls:'icon-remove',
                    handler:function () {
                        var rows= obdatagrid.treegrid('getSelections');
                        if(rows.length>0){
                            $.messager.confirm('请确认','您确定要删除吗？',function (r) {
                                if(r){
                                    console.log(rows);
                                    jsonData = {

                                    }
                                    $.each(rows, function(i, opt) {
                                        jsonData["ids[" + i + "]"] = opt.id;
                                    });

                                    console.log(jsonData);
                                    $.ajax({
                                        type: "POST",
                                        url: "deletorganization.do",
                                        data: jsonData,
                                        dataType:'json',
                                        success: function(data){
                                            if(data.success){
                                                $.messager.show({
                                                    msg:data.msg,
                                                    tile:'成功'
                                                });
                                                obdatagrid.treegrid('reload');
                                                obdatagrid.treegrid('unselectAll');
                                            }else{
                                                obdatagrid.treegrid('rejectChanges');
                                                $.messager.alert('错误'.data.msg,'error')
                                            }
                                        }
                                    });


                                }
                            });
                        }else{
                            $.messager.alert('提示','请选择要删除的记录','error');
                        }
                    }
                },'-',
                {
                    text:'修改',
                    iconCls:'icon-edit',
                    handler:function () {
                       var rows= obdatagrid.treegrid('getSelections');
                        if(rows.length==1){
                            if(objaddinde!=undefined){
                                obdatagrid.treegrid('endEdit',objaddinde);
                            }
                            if(objaddinde==undefined){
                               var rowindex= obdatagrid.treegrid('getRowIndex',rows[0]);
                                obdatagrid.treegrid('beginEdit',rowindex);
                                objaddinde=rowindex;
                            }
                        }
                    }
                },'-',
                {

                    text:'保存',
                    iconCls:'icon-save',
                    handler:function () {
                        obdatagrid.treegrid('endEdit',objaddinde);
                    }
                },'-',
                {

                    text:'取消编辑',
                    iconCls:'icon-redo',
                    handler:function () {

                        obdatagrid.treegrid('cancelEdit',objaddinde);
                        objaddinde=undefined;

                        obdatagrid.treegrid('rejectChanges');
                        obdatagrid.treegrid('unselectAll');

                    }
                },'-'
                ],
            onAfterEdit:function (row,changes) {

                var inserted=obdatagrid.treegrid('getChanges','inserted');
                var updated=obdatagrid.treegrid('getChanges','updated');


                var url="";
                if(inserted.length>0){
                    url='insertorganization.do';
                }
                jsonData={
                    path:row.path,
                    id:row.id
                }

                if(updated.length>0){
                    url='updateorganization.do';
                }
                $.ajax({
                    type: "POST",
                    url: url,
                    data: jsonData,
                    dataType:'json',
                    success: function(data){
                       if(data.success){
                           obdatagrid.treegrid('acceptChanges');
                           $.messager.show({
                               msg:data.msg,
                               tile:'成功'
                           });
                       }else{
                           obdatagrid.treegrid('rejectChanges');
                           $.messager.alert('错误'.data.msg,'error')
                       }
                        objaddinde=undefined;
                        obdatagrid.treegrid('unselectAll');
                    }
                });


            },
            onClickRow:function (row) {
                onClickRow=row;
                objaddinde=row.id;



            }



        });

    }
    function seach(){
        obdatagrid.treegrid('load',{
            name:$('#organizationserForm').find('[name=name]').val()

        });

    }

    function submitForm(){
        $('#organizationserForm').form('submit');
    }
    function clearForm(){
        $('#organizationserForm').form('clear');
    }
    function delHsCode(value,id) {

        jsonCodeData={
            status:value,
            id:id
        };

        $.ajax({
            type: "POST",
            url: "updateemployeeInfo.do",
            data: jsonCodeData,
            success: function(data){
               if(data.success){
                   var index = $('.tabs-selected').index();

                   obdatagrid.treegrid('reload',index);


               }
            }
        });
    }

</script>
<div  class="easyui-tabs" fit="true" border="false" >
    <div title="员工管理"  class="easyui-layout"  border="false" closable="true" >
        <div region="north" border="false" title="过滤" style="height:80px;overflow: hidden;">

               <div id="" style="margin-left: 80px; margin-top: 18px;" >
                   <form id="organizationserForm" style="float:left;">
                       <label>员工状态:</label>
                       <input  type="text" name="name"  />
                       <label>机构:</label>
                       <input  type="text" name="name"/>
                       <label>账号:</label>
                       <input class="easyui-validatebox" type="text" name="name"  />
                       <label>姓名:</label>
                       <input class="easyui-validatebox" type="text" name="name"  />

                   </form>
                   <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" >查询</a>
                   <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()"  style="float: left">重置查询</a>

               </div>
        </div>
        <div region="center"  border="false" style="height:500px">
            <table id="tr">
                <div id="addwin">

                </div>
            </table>
        </div>
    </div>
</div>



