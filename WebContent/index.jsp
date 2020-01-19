<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>五邑大学子系统登录-登录</title>
<style type="text/css"></style>
<!-- CSS:写前端，如果不是专业的，那就用框架，我们这个项目用了：easyui框架，其他框架还有：bootstrap -->
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="login_style/css/supersized.css">
<link rel="stylesheet" href="login_style/css/login.css">
</head>
<body>

	<div id="div_login">
		<p>五邑大学子系统</p>
		<div id="div_form">
			<img src="login_style/img/yida02.jpg" alt="找不到图片">
			<form action="${pageContext.request.contextPath}/login"
				method="post">
				<table>
					<tr>
						<td class="td1"><img src="login_style/img/memeber.gif" alt=""
							style="width: 16px; text-align: right"></td>
						<td><input type="text" name="number"></td>
					</tr>
					<tr>
						<td class="td1"><img src="login_style/img/lock.gif" alt=""
							style="width: 16px;"></td>
						<td><input type="password" name="password"></td>
					</tr>
					<tr style="background-color: inherit">

						<td colspan="1.5">
							<div>
								<input id="input_regist" type="regist" value="注册">
							</div>
							
						</td>
						<form action="">
							<td colspan="1.5">
							<div>
								<input id="input_submit" type="submit" value="登录">
							</div>
							
						</td>
						${loginfo}
                      </form>
					</tr>

				</table>
			</form>
		</div>
	</div>
	<!-- Javascript -->
	<script src="login_style/js/supersized.3.2.7.min.js"></script>
	<script src="login_style/js/supersized-init.js"></script>

</body>
<!-- js：javascript代码 -->
<script type="text/javascript">
	$(function() {
		var loginfo = '${loginfo}';
		if (loginfo != "") {
			//easyui的提示框
			$.messager.alert('登录失败', loginfo, 'error');
		}

			$("#input_regist").click(function() {
					addTab("#tt","注册","icon-search","registUser.jsp");
			});
		
	});
</script>
</html>