<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>查询失败界面</title>
<style type="text/css">
1 div{
2     width: 100px;
3     height: 100px;
4     position: absolute;
5     left: 50%;
6     top: 50%;
7     margin: -50px 0 0 -50px;
8 }
</style>
</head>
<body background="timg.jpg">
	<%
		String username = request.getParameter("username");
	%> 
	<div>
		<a style="display: inline-block; text-align: center;" href="book_ticket.jsp?username=<%=username %>">对不起，没有这张票</a>
	</div>
</body>
</html>