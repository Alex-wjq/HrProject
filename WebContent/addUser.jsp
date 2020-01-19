<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body>

<p>Fill the form and submit it.</p>
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" title="添加用户" style="width:400px">
		<div style="padding:10px 60px 20px 60px">
	    <form id="ff" method="post">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>用户编号:</td>
	    			<td><input class="easyui-textbox" type="text" name="number" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>用户名称:</td>
	    			<td><input class="easyui-textbox" type="text" name="username" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>密码:</td>
	    			<td><input class="easyui-textbox" type="password" name="password" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>手机号码:</td>
	    			<td><input class="easyui-textbox" type="text" name="phone" data-options="required:true,validType:'length[11,11]'"></input></td>
	    		</tr>
	    		<tr>
	    			<td>备注:</td>
	    			<td><input class="easyui-textbox" type="text" name="remark" ></input></td>
	    		</tr>
	 
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
	    </div>
	    </div>
	</div>
	<script type="text/javascript">
	
	
	$(function(){
		$("input",$("#number").next("span")).blur
		var number = $("#number").val();
		var json = {
				"number" : number
		}
	});
	
	//easyui使用的是ajax做表单提交
    function submitForm(){
        $('#ff').form('submit',{
         url:"registerUser",
         onSubmit : function(){
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