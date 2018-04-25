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
            url:'sysPositionpage.do',
            idField:'id',
            treeField:'name',
            columns:[[
                {   field:'id',
                    title:'id',
                    width:100,
                    checkbox:true
                },
                {
                    field:'name',
                    title:'职位名称',
                    width:100,
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {
                    field:'description',
                    title:'描述',
                    width:100,
                    editor:{
                        type:'validatebox',
                        options:{required:true}
                    }
                },
                {field:'createTime',title:'修改时间',width:100,align:'right',
                    formatter: function(value,row,index){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString();
                    }

                },
                {field:'modifyTime',title:'创建时间',width:100,align:'right',
                    formatter: function(value,row,index){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString();
                    }
                },
            ]],
            title:"职位表",
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
                    alert("11111111111111");
                    if(onClickRow==undefined){

                        $('#addwin').window({
                            width:300,
                            height:400,
                            modal:true,
                            title:"职位详细信息",
                            href:'goto_addPosition.do'
                        });


//                        $('#addwin').window('refresh', 'addOrg.do');*/
                    }


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
                                    console.log(rows);
                                    jsonData = {

                                    }
                                    $.each(rows, function(i, opt) {
                                        jsonData["ids[" + i + "]"] = opt.id;
                                    });

                                    console.log(jsonData);
                                    $.ajax({
                                        type: "POST",
                                        url: "deletsysPosition.do",
                                        data: jsonData,
                                        dataType:'json',
                                        success: function(data){
                                            if(data.success){
                                                console.log("成功");
                                                $.messager.show({
                                                    msg:data.msg,
                                                    tile:'成功'
                                                })
                                                onClickRow=undefined;
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
                            $.messager.confirm('请确认','您确定要删除吗？',function (r) {
                                if(r){
                                    jsonData1 = {

                                    }
                                    jsonData1["ids[0]"] = onClickRow;
                                    $.ajax({
                                        type: "POST",
                                        url: "deletsysPosition.do",
                                        data: jsonData1,
                                        dataType:'json',
                                        success: function(data){
                                            if(data.success){
                                                $.messager.show({
                                                    msg:data.msg,
                                                    tile:'成功'
                                                });
                                                onClickRow=undefined;
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

                        }
                    }
                },'-',
               /* {
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
                },'-',*/
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
                    url='insertsysPosition.do';
                }
                if(updated.length>0){
                    url='updatesysPosition.do';
                }
                console.log(row)
                $.ajax({
                    type: "POST",
                    url: url,
                    data: row,
                    dataType:'json',
                    success: function(data){
                       if(data.success){
                           obdatagrid.treegrid('acceptChanges');
                           $.messager.show({
                               msg:data.msg,
                               tile:'成功'


                           });
                           obdatagrid.treegrid('reload');
                       }else{
                           obdatagrid.treegrid('rejectChanges');
                           $.messager.alert('错误'.data.msg,'error')
                       }
                        objaddinde=undefined;
                        obdatagrid.treegrid('unselectAll');
                    }
                });


            },
            onDblClickRow:function(rowIndex, rowData){
                    console.log()
                    if(objaddinde!=undefined){
                        obdatagrid.treegrid('endEdit',objaddinde);
                    }
                    if(objaddinde==undefined){
                        obdatagrid.treegrid('beginEdit',rowIndex.id);
                        objaddinde=rowIndex.id;
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
    <div title="职位管理"  class="easyui-layout"  border="false" closable="true" >
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



