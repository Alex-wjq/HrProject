<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script type="text/javascript" src="easyui/jquery.min.js"></script> 
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body>
<div style="margin:20px 0;"></div>
<div class="easyui-panel" title="添加用户" style="width:700%;max-width:500px;padding:40px 60px 20px 60px;">
        <form id="ff" method="post" class = "easyui-form">
        <table cellpadding="10"></table>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="id" style="width:100%" data-options="label:'用户编号:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="deptId" style="width:100%" data-options="label:'部门编号:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="jobId" style="width:100%" data-options="label:'职位编号:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="name" style="width:100%" data-options="label:'用户名称:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="cardId" style="width:100%" data-options="label:'身份编号:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="address" style="width:100%" data-options="label:'联系住址:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="postCode" style="width:100%" data-options="label:'邮政编码:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="tel" style="width:100%" data-options="label:'固话号码:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="phone" style="width:100%" data-options="label:'手机号码:',required:true,validType:'length[11,11]'">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="qqNum" style="width:100%" data-options="label:'QQ号码:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="email" style="width:100%" data-options="label:'邮箱地址:',required:true">
            </div>
             <div style="margin-bottom:20px">
                <select class="easyui-combobox" name="sex" label="性别" style="width:100%">
                <option value="1">男性</option>
                <option value="2">女性</option>
                </select>
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="party" style="width:100%" data-options="label:'所属党派:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="race" style="width:100%" data-options="label:'民族:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="education" style="width:100%" data-options="label:'学历:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="speciality" style="width:100%" data-options="label:'专业:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="hobby" style="width:100%" data-options="label:'兴趣爱好:',required:true">
            </div>
             <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="remark" style="width:100%" data-options="label:'备注:'">
            </div>
        </form>
        <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">添加</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">重置</a>
        </div>
    </div>
    <script type="text/javascript">
/*     $(function(){
 	   $("input",$("#number").next("span")).blur(function(){
 	   var number = $("#number").val();
 	   var json = {
 			   "number":number
 	   };
 	   $.post("registerAjax",json,function(data){
     	   if(data=="1"){
     		   //如果返回的数据是1，说明用户已经被注册
     		  $.messager.alert('温馨提示','该账号已被注册!','error');
     	   }
 		   });
 	   });

    }); */
        function submitForm(){
            $('#ff').form('submit',{
            	url : "addEmp",
            	onSubmit : function() {
            		return $(this).form('enableValidation').form('validate');
            	},
            	success : function(data){
            		
            		if(data == "1"){
            			$.messager.alert('注册成功','恭喜你注册成功','info');
            		}else{
            			$.messager.alert('注册失败','对不起，注册失败','error');
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