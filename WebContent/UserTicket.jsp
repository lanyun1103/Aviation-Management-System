<%@ page language="java" contentType="text/html; charset=utf-8"
import="com.dao.*,java.sql.*,dbutil.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户票务信息</title>
<style>
table{
    border-collapse: collapse;
    text-align: center
}
</style>

</head>
<body style="font-size:x-large;" background="timg.jpg">
	<table align="center" border="1.5">
	<%!String username; %>
	<%
	//建立连接，书写sql语句
	//格式化输出结果
	
		try{
			username = request.getParameter("name");
			System.out.println(username);
			Connection con = new DBUtil().connect();
			String sql = "select * from t_voyage_info where user = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			
			//获取数据库中所有票的信息
			ResultSet rs = pstmt.executeQuery();
			out.print("<tr>");
			out.print("<td>编号</td>");
			out.print("<td>购买账号</td>");
			//out.print("<td>真实姓名</td>");
			out.print("<td>机票编号</td>");
			out.print("<td>出发时间</td>");
			out.print("<td>到达时间</td>");
			out.print("<td>起点</td>");
			out.print("<td>终点</td>");

			out.print("</tr>");
			int id = 1;
			while(rs.next()){
				out.print("<tr>");
				out.print("<td>"+id+"</td>");
				out.print("<td>"+rs.getString("user")+"</td>");
				out.print("<td>"+rs.getString("ticket_id")+"</td>");
				out.print("<td>"+rs.getString("departure_time")+"</td>");
				out.print("<td>"+rs.getString("arrive_time")+"</td>");
				out.print("<td>"+rs.getString("qidian")+"</td>");
				out.print("<td>"+rs.getString("mudi")+"</td>");
				out.print("</tr>");
				id+=1;
			}
			new DBUtil().CloseDB(con);

		}catch(Exception e){
			out.print("error");
		}
	%>
	<tr>
		<td colspan="4"><a href="book_ticket.jsp?username=<%=username%>">返回订票页面</a></td>
		<td colspan="3"><a href="index.jsp?username=<%=username%>">返回登录界面</a></td>
	</tr>
	</table>
</body>
</html>