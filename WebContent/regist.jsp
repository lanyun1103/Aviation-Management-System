<%@ page language="java" contentType="text/html; charset=utf-8"
import="java.sql.*,com.dbutil.*,com.dao.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body background="timg.jpg" style="font-size: x-large">
	<p align="center">天剑飞机用户注册</p>
	<form action="regist.jsp" method="post">
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
				<td><input type ="submit" value="注册"></td>
			</tr>
		</table>
	</form>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Connection con = new DBUtil().connect();
		UserDao ud = new UserDao();
		try{
		ud.regis(con, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<div align="center">
		<a href="login.jsp">返回登录页面</a>
	</div>
</body>
</html>