<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加职位</title>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script type="text/javascript" src="easyui/jquery.min.js"></script> 
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body>
<div style="margin:20px 0;"></div>
<div class="easyui-panel" title="添加职位" style="width:700%;max-width:500px;padding:40px 60px 20px 60px;">
        <form id="ff" method="post" class = "easyui-form">
        <table cellpadding="10"></table>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="id" style="width:100%" data-options="label:'ID编号:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="name" style="width:100%" data-options="label:'职位名称:',required:true">
            </div>
                    <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="remark" style="width:100%" data-options="label:'备注:'">
            </div>

        </form>
        <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">添加</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">清空</a>
        </div>
    </div>
    <script type="text/javascript">
    function submitForm(){
        $('#ff').form('submit',{
        	url : "addJob",
        	onSubmit : function() {
        		return $(this).form('enableValidation').form('validate');
        	},
        	success : function(data){
        		
        		if(data == "1"){
        			$.messager.alert('添加成功','恭喜你添加成功','info');
        		}else{
        			$.messager.alert('添加失败','对不起，添加失败','error');
        		}
        	}
        });
    }
        function clearForm(){
            $('#ff').form('clear');
        }
    </script>
</body>
</html>