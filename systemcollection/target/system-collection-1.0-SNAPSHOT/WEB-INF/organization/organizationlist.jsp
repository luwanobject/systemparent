<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script type="text/javascript" charset="utf-8">
    (function($){
        function pagerFilter(data){
            if ($.isArray(data)){    // is array
                data = {
                    total: data.length,
                    rows: data
                }
            }
            var dg = $(this);
            var state = dg.data('treegrid');
            var opts = dg.treegrid('options');
            var pager = dg.treegrid('getPager');
            pager.pagination({
                onSelectPage:function(pageNum, pageSize){
                    opts.pageNumber = pageNum;
                    opts.pageSize = pageSize;
                    pager.pagination('refresh',{
                        pageNumber:pageNum,
                        pageSize:pageSize
                    });
                    dg.treegrid('loadData',state.originalRows);
                }
            });
            if (!state.originalRows){
                state.originalRows = data.rows;
            }
            var topRows = [];
            var childRows = [];
            $.map(state.originalRows, function(row){
                row._parentId ? childRows.push(row) : topRows.push(row);
            });
            data.total = topRows.length;
            var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
            var end = start + parseInt(opts.pageSize);
            data.rows = $.extend(true,[],topRows.slice(start, end).concat(childRows));
            return data;
        }

        var appendMethod = $.fn.treegrid.methods.append;
        var loadDataMethod = $.fn.treegrid.methods.loadData;
        $.extend($.fn.treegrid.methods, {
            clientPaging: function(jq){
                return jq.each(function(){
                    var state = $(this).data('treegrid');
                    var opts = state.options;
                    opts.loadFilter = pagerFilter;
                    var onBeforeLoad = opts.onBeforeLoad;
                    opts.onBeforeLoad = function(row,param){
                        state.originalRows = null;
                        onBeforeLoad.call(this, row, param);
                    }
                    $(this).treegrid('loadData', state.data);
                    $(this).treegrid('reload');
                });
            },
            loadData: function(jq, data){
                jq.each(function(){
                    $(this).data('treegrid').originalRows = null;
                });
                return loadDataMethod.call($.fn.treegrid.methods, jq, data);
            },
            append: function(jq, param){
                return jq.each(function(){
                    var state = $(this).data('treegrid');
                    if (state.options.loadFilter == pagerFilter){
                        $.map(param.data, function(row){
                            row._parentId = row._parentId || param.parent;
                            state.originalRows.push(row);
                        });
                        $(this).treegrid('loadData', state.originalRows);
                    } else {
                        appendMethod.call($.fn.treegrid.methods, jq, param);
                    }
                })
            }
        });

    })(jQuery);

    function formatProgress(value){
        if (value){
            var s = '<div style="width:100%;border:1px solid #ccc">' +
                '<div style="width:' + value + '%;background:#cc0000;color:#fff">' + value + '%' + '</div>'
            '</div>';
            return s;
        } else {
            return '';
        }
    }


    $(function(){
        loadtagrid();
        $('#tr').treegrid().treegrid('clientPaging');
    });
    var obdatagrid;
    var objaddinde=undefined;
    var onClickRow=undefined;
    function loadtagrid(){
        obdatagrid =$('#tr').treegrid({
            url:'organizationlistpage.do',
            idField:'id',
            treeField:'name',
            pageSize: 2,
            pageList: [2,5,10],
            pagination: true,
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
                    width:280,
                    align:'left',
                    editor:{
                    type:'validatebox',
                    options:{required:true},
                        align:'center'
                }},
                {
                    field:'pdName',
                    title:'上级部门',
                    width:100,
                    align:'left',
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {   field:'address',
                    title:'地址',
                    width:100,
                    align:'left',
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {field:'phone',title:'电话号码',width:100,align:'left', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'postCode',title:'邮政编码',width:100,align:'left', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'fax',title:'传真号',width:100,align:'left', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'type',title:'机构类型',width:100,align:'left', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'orderNo',title:'排序号',width:100,align:'left', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'code',title:'机构编码',width:100,align:'left', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'principalId',title:'机构负责人ID',width:100,align:'left', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'path',title:'机构路径',width:100,align:'left', editor:{
                    type:'validatebox',
                    options:{required:true}
                }},
                {field:'modifyTime',title:'修改时间',width:100,align:'left',
                    formatter: function(value,row,index){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString();
                    }

                },
                {field:'createTime',title:'创建时间',width:100,align:'left',
                    formatter: function(value,row,index){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString();
                    }
                },
            ]],
            title:"组织机构管理",
            iconCls:"icon-save",
            fit:true,
            fitColumns:true,
            nowrap:false,
            border:false,
            animate:true,
            toolbar:[{
                text:'增加',
                iconCls:'icon-add',
                handler:function () {
                    console.log(onClickRow);

                        $('#addwin').window({
                            width:600,
                            height:400,
                            modal:true,
                            href:'goto_addOrg.do'
                        });
                }
                },'-',
                {
                    text:'删除',
                    iconCls:'icon-remove',
                    handler:function () {
                        if(onClickRow==undefined){
                            $.messager.alert('警告','您还没有选择要删除的选项');
                            return;
                        }

                        var rows= obdatagrid.treegrid('getChildren',onClickRow);
                        if(rows.length>0){
                            $.messager.confirm('请确认','您确定要删除吗？',function (r) {
                                if(r){
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
                            jsonData1 = {

                            }
                            jsonData1["ids[0]"] = onClickRow;
                            $.ajax({
                                type: "POST",
                                url: "deletorganization.do",
                                data: jsonData1,
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
            onDblClickRow:function(row){
                    if(objaddinde!=undefined){
                        obdatagrid.treegrid('endEdit',objaddinde);
                    }
                    if(objaddinde==undefined){

                        obdatagrid.treegrid('beginEdit',row.id);
                        objaddinde=row.id;
                    }
                },
            onClickRow:function (row) {
                onClickRow=row.id;
            }



        });

    }
    function seach(){
        obdatagrid.treegrid('load',{
            name:$('#organizationserForm').find('[name=name]').val()

        });

    }

</script>
<div  class="easyui-tabs" fit="true" border="false" >
    <div title="组织机构"  class="easyui-layout"  border="false" closable="true" >
        <div region="north" border="false">

        </div>
        <div region="center"  border="false" style="height:500px">
            <table id="tr">
                <div id="addwin">

                </div>
            </table>
        </div>
    </div>
</div>



