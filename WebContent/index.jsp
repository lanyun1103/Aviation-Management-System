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
		width: 400px;
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
   	#mod{
   		position:absolute;
   		left: 30px;
  		top: 20px;
   	}
   	#container{
   		position:absolute;
   		left: 140px;
  		top: 80px;
   	}
   	#scroler{
   		position: absolute;
   		top: 500px;
   		left: 400px;
   	}
   	#header{
   		font-size: xx-large;
   	}
</style>
</head>
<body background="timg.jpg" style="font-size: x-large">
    

	<div id="container"><span><font style="font-family:思源黑体 Regular">天剑飞机订票系统</font></span></div>
	<div class="main">
	<p align="center" id="header">天剑飞机用户登陆界面</p>
	
		<form action="" method="post" id="form1">
			<table align = "center" style="text-align: center" border=1.5;>
				<tr>
					<td>用户名信息</td>
					<td><input type ="text" placeholder="用户名" name = "username"></td>	
				</tr>
				<tr>
					<td>密码</td>
					<td><input type = "password" placeholder="密码" name = "password"></td>
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
	</div>
	<div id="mod">
		<img style="height: 100px;width: 100px;" src="head.jpg">
	</div>
	<div id="scroler">
	<MARQUEE onmouseover=stop() onmouseout=start() scrollAmount=2 loop=infinite deplay="0">
		<IMG src="imgs/stro1.jpg">
		<IMG src="imgs/stro2.jpg">
	</MARQUEE>
	</div>
</body>
</html>