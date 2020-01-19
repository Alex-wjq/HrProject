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
<div class="easyui-panel" title="支持多文件上传用户" style="width:400px">

		<!-- 文件上传的表单 -->
		<form action="${pageContext.request.contextPath}/uploadFile"  method="post" enctype="multipart/form-data"   
		multiple="multiple"  onsubmit = "return checkd()">
		<br>
		<br>
		上传人：<input type = "text" name = "name"  id = "name"  value = "${user.username }">
		<br>
		<br>
		
		<input type = "button" value ="添加"  onclick="add()">
		<input type ="submit" value="上传文件" >

		
		<div id = "divId"></div>
		
		</form>
		
		
		</div>
</body>

<script type="text/javascript">

/*
 * 在上传之前先判断上传人是否为空
 */
function checkd(){
	//获得上传人的名字
	var name = $("#name").val();
	if(name==""){
		$.messager.alert("警告","上传人不能为空","error");
		return false;

	}
	
	//如果未为false，表单不会提交 
	return ture;
	
}


/*
 * 定义一个方法，可以动态添加上传文件栏
 */
function add(){
	
	var div=document.getElementById("divId");
	
	div.innerHTML +="<br><div><input type ='file' name= 'uploadfile'><input type = 'button' value = '删除' onclick='del(this)'></div>";

}
/*
 *删除按钮的功能 
 */
 function del(who){
	/*获取按钮的父控件*/
	
	var w = who.parentNode;
	w.parentNode.removeChild(w);

	
	
}

 
 /*得到后台返回的数据，并给出提示*/
 $(function(){
	 
	 var  uploadinfo = "${uploadinfo}";
	 if(uploadinfo!=""){
		 $.messager.alert("上传结果",uploadinfo,"info");
		 
	 }
	 if(uploadinfo=="0"){
		 $.messager.alert("上传结果","上传失败！","error");
	 }
	 
 });


</script>

</html>