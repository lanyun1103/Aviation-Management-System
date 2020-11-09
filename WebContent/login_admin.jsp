<%@page import="com.model.Admin"%>
<%@page import="com.dao.AdminDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.model.User"%>
<%@page import="com.dao.UserDao"%>
<%@page import="dbutil.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
Login in page
	<% 
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//创建数据库连接
		DBUtil dbu = new DBUtil();
		Connection con = dbu.connect();
		
		//创建两个对象，一个查询，一个用传来的用户名密码创建一个user对象，在数据库中查找
		AdminDao userD = new AdminDao();
		Admin user = new Admin();
		user.setUsername(username);
		user.setPassword(password);
		
		Admin user_cur = new Admin();
		user_cur.setUsername("null");
		try{
			//调用login方法，返回的如果账号密码正确，那么返回的应该是一个包含账号密码信息的对象
			//如果查询失败，那么返回的是一个没有账号密码的空对象，可能是null，测试一下
			user_cur = userD.login(con, user);
		}catch(Exception e){
			e.printStackTrace();
		}
		new DBUtil().CloseDB(con);

	%>
	Login successfully
	<%	
	//
		if(user_cur!=null){
		request.setAttribute("username", username);
		
	%>
	
		<jsp:forward page="AdminManage.jsp"></jsp:forward>
	<%
		}else{
	%>
		<jsp:forward page="index.jsp"></jsp:forward>
	<%
		}
	%>
</body>
</html>