<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飞机订票系统</title>
</head>
<body background="timg.jpg" style="font-size: x-large">
	<p align="center">天剑飞机用户登陆过</p>
			
	<form action="login.jsp" method="post">
		<table align = "center">
			
			<tr>
				<td>用户名信息</td>
				<td><input type ="text" name = "username"></td>	
			</tr>
			<tr>
				<td>密码</td>
				<td><input type = "password" name = "password"></td>
			</tr>
			<tr>
				<td><input type ="submit" value="登陆"></td>
			</tr>
		</table>
	</form>
	<div align="center">
		<a href="regist.jsp">注册用户</a>
	</div>
</body>
</html>