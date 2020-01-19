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

	<div id="dlg" class="easyui-dialog" title="修改职员信息"
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
						<td>员工编号:</td>
						<td><input class="easyui-textbox" disabled="disabled"
							type="text" name="id" id="id"
							data-options="required:true"></td>

					</tr>
					<tr>
						<td>部门编号:</td>
						<td><input class="easyui-textbox" disabled="disabled"
							type="text" name="deptId" id="deptId"
							data-options="required:true"></td>

					</tr>
					<tr>
						<td>职位编号:</td>
						<td><input class="easyui-textbox" disabled="disabled"
							type="text" name="jobId" id="jobId"
							data-options="required:true"></td>

					</tr>
					<tr>
						<td>身份编号:</td>
						<td><input class="easyui-textbox" disabled="disabled"
							type="text" name="cardId" id="cardId"
							data-options="required:true"></td>

					</tr>

					<tr>
						<td>姓名:</td>
						<td><input class="easyui-textbox" type="text" name="name"
							id="name" data-options="required:true"></td>

					</tr>
					<tr>
						<td>性别:</td>
						<td><input class="easyui-textbox" type="text" name="sex"
							id="sex" data-options="required:true"></td>

					</tr>


					<tr>
						<td>手机号码:</td>
						<td><input class="easyui-textbox" type="text"
							name="phone" id="phone"
							data-options="required:true,validType:'length[11,11]'"></td>
					</tr>
					
					<tr>
						<td>邮箱地址:</td>
						<td><input class="easyui-textbox" type="text"
							name="email" id="email"
							data-options="required:true"></td>
					</tr>
					<tr>
						<td>家庭地址:</td>
						<td><input class="easyui-textbox" type="text"
							name="address" id="address"
							data-options="required:true"></td>
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

		var id = $("#id").val();
		var deptId = $("#deptId").val();
		var jobId = $("#jobId").val();
		var cardId = $("#cardId").val();
		var name = $("#name").val();
		var email = $("#email").val();
		var phone = $("#phone").val();
		var sex = $("#sex").val();
		var address = $("#address").val();

		//将得到的学生信息构建成json数据

		var json = {
			"id" : id,
			"deptId":deptId,
			"jobId":jobId,
			"cardId":cardId,
			"name" : name,
			"email" : email,
			"sex" : sex,
			"phone" : phone,
			"address" : address
		};
		//完成ajax操作
		$.post("updateEmp", json, function(data) {

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
		url : '${pageContext.request.contextPath}/selectEmp',
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
			field : 'id',
			title : '账号',
			width : 180
		},{
			field : 'deptId',
			title : '部门',
			width : 180
		},{
			field : 'jobId',
			title : '职位',
			width : 180
		}, {
			field : 'name',
			title : '姓名',
			width : 180
		}, {
			field : 'sex',
			title : '性别',
			width : 180
		}, {
			field : 'tel',
			title : '固话',
			width : 180
		},  {
			field : 'phone',
			title : '电话号码',
			width : 180
		},  {
			field : 'email',
			title : '邮箱地址',
			width : 180
		}, {
			field : 'education',
			title : '学历',
			width : 180
		}, 
		{
			field : 'speciality',
			title : '专业',
			width : 180
		}, {
			field : 'address',
			title : '家庭住址',
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
										+ row.name + ')吗?', function(r) {
									if (r) {
										//ajax：完成后天交互
										$.get("deleteEmp?id="
												+ row.id, null, function(
												data) {

											$.messager.alert('结果', data,
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
									$("#id")
											.textbox('setValue', row.id);
									$("#deptId")
									.textbox('setValue', row.deptId);
									$("#jobId")
									.textbox('setValue', row.jobId);
									$("#cardId")
									.textbox('setValue', row.cardId);
									$("#name").textbox('setValue',
											row.name);
									$("#email").textbox('setValue',
											row.email);
									$("#phone").textbox('setValue',
											row.phone);
									$("#address").textbox('setValue',
											row.address);
									$("#sex").textbox('setValue',
											row.sex);
									
									$('#dlg').dialog('open');
								}

							}

						}
					} ]
		});

	})
</script>

</html>