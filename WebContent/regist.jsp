<%@ page language="java" contentType="text/html; charset=utf-8"
import="java.sql.*,dbutil.*,com.dao.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册界面</title>
<script>
function redirect(){
	window.location="index.jsp";
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
	<p align="center">天剑飞机用户注册</p>
	<form action="regist.jsp" method="post">
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
				<td colspan="2"><input type ="submit" value="注册"></td>
			</tr>
		</table>
	</form>
	</div>
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
		new DBUtil().CloseDB(con);
	%>
	<div align="center" style="text-align: center">
		<button onclick="redirect()">返回登录页面</button>
	</div>
</body>
</html>