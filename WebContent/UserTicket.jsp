<%@ page language="java" contentType="text/html; charset=utf-8"
import="com.dao.*,java.sql.*,com.dbutil.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body style="font-size:x-large;">
	<table align="center">
	<%
	//建立连接，书写sql语句
	//格式化输出结果
		try{
			String username = request.getParameter("name");
			System.out.println(username);
			Connection con = new DBUtil().connect();
			String sql = "select * from t_voyage_info where user = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			
			//获取数据库中所有票的信息
			ResultSet rs = pstmt.executeQuery();
			out.print("<tr>");
			out.print("<td>Num</td>");
			out.print("<td>User</td>");
			out.print("<td>Ticket_id</td>");
			out.print("</tr>");
			while(rs.next()){
				out.print("<tr>");
				out.print("<td>"+rs.getString("id")+"</td>");
				out.print("<td>"+rs.getString("user")+"</td>");
				out.print("<td>"+rs.getString("ticket_id")+"</td>");
				out.print("</tr>");
			}
		}catch(Exception e){
			out.print("error");
		}
	%>
	<tr>
		<td><a href="book_ticket.jsp">订票页面</a></td>
		<td><a href="index.jsp">登录界面</a></td>
	</tr>
	</table>
</body>
</html>