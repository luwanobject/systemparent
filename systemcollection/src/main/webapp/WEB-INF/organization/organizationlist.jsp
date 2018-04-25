<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script type="text/javascript" charset="utf-8">

    $(function(){
        loadtagrid();
    });
    var obdatagrid;
    var objaddinde=undefined;
    function loadtagrid(){
        obdatagrid =$('#tr').datagrid({
            url:'organizationlistpage.do',
            columns:[[
                {   field:'id',
                    title:'id',
                    width:100,
                    checkbox:true
                },
                {
                    field:'version',
                    title:'版本',
                    width:100,
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {
                    field:'status',
                    title:'系统状态',
                    width:100,
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {   field:'name',
                    title:'机构名称',
                    width:100,
                    align:'right',
                    editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {
                    field:'parentId',
                    title:'上级部门',
                    width:100,
                    align:'right',
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {   field:'address',
                    title:'地址',
                    width:100,
                    align:'right',
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {field:'phone',title:'电话号码',width:100,align:'right', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'postCode',title:'邮政编码',width:100,align:'right', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'fax',title:'传真号',width:100,align:'right', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'type',title:'机构类型',width:100,align:'right', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'orderNo',title:'排序号',width:100,align:'right', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'code',title:'机构编码',width:100,align:'right', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'principalId',title:'机构负责人ID',width:100,align:'right', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'path',title:'机构路径',width:100,align:'right', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'modifyTime',title:'修改时间',width:100,align:'right'},
                {field:'createTime',title:'创建时间',width:100,align:'right'},
            ]],
            title:"组织机构管理",
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
            toolbar:[{
                text:'增加',
                iconCls:'icon-add',
                handler:function () {
                        if(objaddinde!=undefined){
                            obdatagrid.datagrid('endEdit',objaddinde);
                        }
                        if(objaddinde==undefined){

                            obdatagrid.datagrid('insertRow',{
                                index:0,
                                row:{

                                }
                            });
                            obdatagrid.datagrid('beginEdit',0);
                            objaddinde=0;
                        }

                    }
                },'-',
                {
                    text:'删除',
                    iconCls:'icon-remove',
                    handler:function () {
                        var rows= obdatagrid.datagrid('getSelections');
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
                                                obdatagrid.datagrid('load');
                                                obdatagrid.datagrid('unselectAll');
                                            }else{
                                                obdatagrid.datagrid('rejectChanges');
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
                       var rows= obdatagrid.datagrid('getSelections');
                        if(rows.length==1){
                            if(objaddinde!=undefined){
                                obdatagrid.datagrid('endEdit',objaddinde);
                            }
                            if(objaddinde==undefined){
                               var rowindex= obdatagrid.datagrid('getRowIndex',rows[0]);
                                obdatagrid.datagrid('beginEdit',rowindex);
                                objaddinde=rowindex;
                            }
                        }
                    }
                },'-',
                {

                    text:'保存',
                    iconCls:'icon-save',
                    handler:function () {
                        obdatagrid.datagrid('endEdit',objaddinde);
                    }
                },'-',
                {

                    text:'取消编辑',
                    iconCls:'icon-redo',
                    handler:function () {
                        objaddinde=undefined;
                        obdatagrid.datagrid('rejectChanges');
                        obdatagrid.datagrid('unselectAll');
                    }
                },'-'
                ],
            onAfterEdit:function (rowIndex,rowData,changes) {
                var inserted=obdatagrid.datagrid('getChanges','inserted');
                var updated=obdatagrid.datagrid('getChanges','updated');
                var url="";
                if(inserted.length>0){
                    url='insertorganization.do';
                }

                if(updated.length>0){
                    url='updateorganization.do';
                }
                $.ajax({
                    type: "POST",
                    url: url,
                    data: rowData,
                    dataType:'json',
                    success: function(data){
                       if(data.success){
                           obdatagrid.datagrid('acceptChanges');
                           $.messager.show({
                               msg:data.msg,
                               tile:'成功'
                           });
                       }else{
                           obdatagrid.datagrid('rejectChanges');
                           $.messager.alert('错误'.data.msg,'error')
                       }
                        objaddinde=undefined;
                        obdatagrid.datagrid('unselectAll');
                    }
                });


            },
            onDblClickRow:function(rowIndex, rowData){

                if(objaddinde!=undefined){
                    obdatagrid.datagrid('endEdit',objaddinde);
                }
                if(objaddinde==undefined){
                    alert(rowIndex);
                    obdatagrid.datagrid('beginEdit',rowIndex);
                    objaddinde=rowIndex;
                }
            }


        });

    }
    function seach(){
        obdatagrid.datagrid('load',{
            name:$('#organizationserForm').find('[name=name]').val()

        });

    }











</script>
<div  class="easyui-tabs" fit="true" border="false" >
    <div title="组织机构"  class="easyui-layout"  border="false" closable="true" >
        <div region="north" border="false" title="过滤" style="height:120px;overflow: hidden;">
            <form id="organizationserForm">
                <table class="tableForm datagrid-toolbar" style="width: 100%;height: 100%">
                    <tr>
                        <th>名称</th>
                        <td><input name="name" style="width: 230px;"></td>
                    </tr>
                    <tr>
                        <th>创建时间</th>
                        <td><input name="starttime" class="easyui-datetimebox" editable="false" style="width: 115px">
                        <input name="endtime" class="easyui-datetimebox" editable="false" style="width: 115px">
                        </td>
                    </tr>
                    <tr>
                        <th>最后修改时间</th>
                        <td><input name="starttime" class="easyui-datetimebox" editable="false" style="width: 115px">
                            <input name="endtime" class="easyui-datetimebox" editable="false" style="width: 115px">
                            <a href="javacript:void(0)" class="easyui-linkbutton" onclick="seach();">查询</a>
                            <a href="javacript:void(0)" class="easyui-linkbutton" onclick="">清空</a>
                        </td>

                    </tr>
                </table>
            </form>
        </div>
        <div region="center"  border="false" style="height:500px">
            <table id="tr">

            </table>
        </div>
    </div>
</div>



