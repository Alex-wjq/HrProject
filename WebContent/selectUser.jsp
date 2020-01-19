<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户查询</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<div id="tb" style="padding: 5px; height: auto">
		<div>
			账号: <input class="easyui-textbox" style="width: 150px; height: 25px name="number">
			姓名: <input class="easyui-textbox" style="width: 150px; height: 25px name="username">
			角色: <select class="easyui-combobox" panelHeight="auto"
				style="width: 100px; height: 25px"" name="status">
				<option value="1">普通用户</option>
				<option value="2">管理员</option>
				<option value="3">超级管理员</option>
				
			</select> <a href="#" class="easyui-linkbutton" iconCls="icon-search"
				style="height: 25px">查询</a>
		</div>
	</div>
	<table id="dg" style="width: 100%; height: 500px"></table>

	<div id="dlg" class="easyui-dialog" title="修改学生信息"
		style="width: 400px; height: 450px; padding: 10px"
		data-options="
				closed:true,
				iconCls: 'icon-edit',
				toolbar: '#dlg-toolbar',
				buttons: '#dlg-buttons'
			">
		<div>
			<form id="ff" class="easyui-form" method="post">
				<table cellpadding="10">
					<tr>
						<td>学号:</td>
						<td><input class="easyui-textbox" disabled="disabled"
							type="text" name="number" id="number"
							data-options="required:true"></td>

					</tr>

					<tr>
						<td>姓名:</td>
						<td><input class="easyui-textbox" type="text" name="userName"
							id="username" data-options="required:true"></td>

					</tr>

					<tr>
						<td>密码:</td>
						<td><input class="easyui-textbox" type="password"
							name="password" id="password"
							data-options="required:true,validType:'length[3,16]'"></td>
					</tr>
					
					<tr>
						<td>手机号:</td>
						<td><input class="easyui-textbox" type="text"
							name="phone" id="phone"
							data-options="required:true,validType:'length[11,11]'"></td>
					</tr>
					
					<tr>
						<td>角色:</td>
						<td><select id="status" class="easyui-combobox"
							name="status" style="width: 120px;">
								<option value="1">普通用户</option>
								<option value="2">管理员</option>
								<option value="3">超级管理员</option>
								
						</select></td>

					</tr>
				</table>
			</form>
		</div>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="save()">保存</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>

</body>
<script type="text/javascript">
	function save() {
		//获得控件中的数据

		var number = $("#number").val();
		var username = $("#username").val();
		var password = $("#password").val();
		var status = $("#status").val();
		var phone = $("#phone").val();

		//将得到的学生信息构建成json数据

		var json = {
			"number" : number,
			"username" : username,
			"password" : password,
			"status" : status,
			"phone" : phone,
		};
		//完成ajax操作
		$.post("updataUser", json, function(data) {

			var info = "对不起，修改失败！";
			var pic = "error"
			if (data == "1") {
				info = "恭喜，修改成功！！";
				pic = "info"
			}
			$.messager.alert('结果', info, pic, function() {

				window.location.reload();
			});

		});

	}

	$('#dg').datagrid({
		url : '${pageContext.request.contextPath}/selectUser',
		title : '用户列表',
		border : false,
		rownumbers : true,
		toolbar : '#tb',
		pagination : true,
		pageSize : "5",
		pageList : [ 5, 10, 15, 20 ],
		singleSelect : true,
		columns : [ [ {
			field : 'id',
			value : 'number',
			checkbox : true,
			title : '选择',
			width : 50
		}, {
			field : 'number',
			title : '账号',
			width : 220
		}, {
			field : 'username',
			title : '姓名',
			width : 220
		}, {
			field : 'status',
			title : '角色',
			width : 220
		},  {
			field : 'phone',
			title : '电话号码',
			width : 220
		},  {
			field : 'password',
			title : '密码',
			width : 220
		}, {
			field : 'creatdate',
			title : '注册时间',
			width : 220
		},  {
			field : 'remark',
			title : '备注',
			width : 220
		}] ]
	});

	$(function() {
		var pager = $('#dg').datagrid().datagrid('getPager'); // get the pager of datagrid

		pager.pagination({
			buttons : [
					{
						iconCls : 'icon-no',
						text : '删除',
						handler : function() {
							var row = $('#dg').datagrid('getSelected');
							if (row != null) {
								$.messager.confirm('确认是否要删除', '确定要删除('
										+ row.username + ')吗?', function(r) {
									if (r) {
										//ajax：完成后天交互
										$.get("deleteUser?number="
												+ row.number, null, function(
												data) {

											$.messager.alert('结', data,
													'info', function() {
														window.location
																.reload();
													});

										});
									}
								});
							}
						}
					},
					{

						iconCls : 'icon-edit',
						text : '修改',
						handler : function() {
							var row = $('#dg').datagrid('getSelected');
							if (row != null) {
								$('#dlg').dialog('open');
								var row = $('#dg').datagrid('getSelected');
								if (row != null) {

									//读取方式,根据row的字段row.xxx
									$("#number")
											.textbox('setValue', row.number);
									$("#username").textbox('setValue',
											row.username);
									$("#password").textbox('setValue',
											row.password);
									$("#status").combobox('setValue',
											row.status);
									$("#phone").textbox('setValue', 
											row.phone);
									$('#dlg').dialog('open');
								}

							}

						}
					} ]
		});

	})
</script>

</html>