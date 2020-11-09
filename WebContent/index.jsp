<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飞机订票系统</title>
<script>
function redirect(){
	window.location="regist.jsp";
}
function login(){
	document.getElementById("form1").action = "login.jsp";
	document.getElementById("form1").submit();
}
function adminlogin(){
	document.getElementById("form1").action = "login_admin.jsp";
	document.getElementById("form1").submit();
}
</script>
<style>
	.main{
		width: 300px;
		height: 150px;
		position: fixed;
		top: 20%;
		left: 0;
		right: 0;
		margin:0 auto;
	}
</style>
</head>
<body background="timg.jpg" style="font-size: x-large">
	
	<div class="main">
	<p align="center">天剑飞机用户登陆界面</p>
	
		<form action="" method="post" id="form1">
			<table align = "center" style="text-align: center">
				<tr>
					<td>用户名信息</td>
					<td><input type ="text" name = "username"></td>	
				</tr>
				<tr>
					<td>密码</td>
					<td><input type = "password" name = "password"></td>
				</tr>
				<tr>
					<td><button onclick="login()">登录</button></td>
					<td><button onclick="adminlogin()">管理员登录</button></td>
				</tr>
				<tr>
					<td colspan="2"><a href="regist.jsp">注册用户</a></td>
				</tr>
			</table>
		</form>
		
</body>
</html>