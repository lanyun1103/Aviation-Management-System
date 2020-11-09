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
		width: 500px;
		height: 150px;
		position: fixed;
		top: 20%;
		left: 0;
		right: 0;
		margin:0 auto;
	}
	table{
		background:rgba(0,0,0,0.1)/*0.1~1为透明度bai*/;
		border-collapse: collapse;
    	text-align: center;
	}
	#shower{
		width: 500px;
		height: 150px;
		top: 10%;
		margin:0 auto;
		left: 30px;
		right: 0;
		position: fixed;
	}
</style>
</head>
<body background="timg.jpg" style="font-size: x-large">
	<div class="main">
	<p align="center">天剑飞机用户注册</p>
	<form action="regist.jsp" method="post">
		<table align = "center" style="text-align: center" border="1.5">
			<tr>
				<td>用户名</td>
				<td><input placeholder="请输入全英文账号名" type="text" name = "username"></td>	
			</tr>
			<tr>
				<td>密码</td>
				<td ><input placeholder="密码不得少于6位" type = "password" name = "password"></td>
			</tr>
			<tr>
				<td>身份账号</td>
				<td ><input type="text" name="idcard"></td>
			</tr>
			<tr>
				<td colspan="2"><input type ="submit" value="注册"></td>
			</tr>
			<tr>
				<td colspan="2"><a href="index.jsp">返回登录页面</a></td>
			</tr>
		</table>
	</form>
	
	</div>
	<p id="shower"></p>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String idcard = request.getParameter("idcard");
		Connection con = new DBUtil().connect();
		
		try{
			if(username!=""&&password!=""&&idcard!=""){
				if(password.length()>=6){
					UserDao ud = new UserDao();
					ud.regis(con, username, password,idcard);
	%>
		<script type="text/javascript">

			document.getElementById("shower").innerHTML="注册成功，请返回登录界面。";

		</script>
		
	<%
					
				}
				else{
	%>
		<script type="text/javascript">
			document.getElementById("shower").innerHTML="好好输密码啊喂";
		</script>
	<%
				}
			}else{
	%>
	<script type="text/javascript">
		document.getElementById("shower").innerHTML="你为什么不输入值？嗯？";
	</script>
	<%			
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		new DBUtil().CloseDB(con);
	%>
</body>
</html>