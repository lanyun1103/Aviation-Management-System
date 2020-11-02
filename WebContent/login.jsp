<%@page import="java.io.Console"%>
<%@ page import="com.dao.UserDao,java.sql.Connection,com.dbutil.DBUtil,
				com.model.User,com.dao.UserDao" 
language="java" 
contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>认证信息</title>
</head>
<body background="timg.jpg">
	Login in page
	<% 
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//创建数据库连接
		DBUtil dbu = new DBUtil();
		Connection con = dbu.connect();
		
		//创建两个对象，一个查询，一个用传来的用户名密码创建一个user对象，在数据库中查找
		UserDao userD = new UserDao();
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		
		User user_cur = new User();
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
	
	<jsp:forward page="book_ticket.jsp"></jsp:forward>
	<%
		}else{
	%>
		<jsp:forward page="index.jsp"></jsp:forward>
	<%
		}
	%>
</body>
</html>