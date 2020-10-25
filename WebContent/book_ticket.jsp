<%@ page language="java" contentType="text/html; charset=UTF-8" 
import="java.sql.*,java.io.*,java.util.*,com.dbutil.DBUtil,com.dao.*"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>You can book ticket here</title>
 <script type="text/javascript">
 	function next(){
		window.location = "UserTicket.jsp";
    }
</script>
</head>
<body background="timg.jpg" style="font-size: x-large">

	<div>
	<table align="center">
		<tr>
			<td>欢迎您：</td>
			<%
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8"); 
			response.setContentType("text/html; charset=utf-8");
			%>
			<td><%
			String sc = request.getParameter("username");
			sc = new String(sc.getBytes("iso-8859-1"),"utf-8");
			out.print(sc);
			 %></td>			
			
		</tr>
		<%
		try{
			TicketDao td = new TicketDao();
			//获取数据库中所有票的信息
			DBUtil dbu = new DBUtil();
			Connection con = dbu.connect();
			String sql = "select * from table_ticket_info";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			out.print("<tr>");
			out.print("<td>Departure</td>");
			out.print("<td>Destination</td>");
			out.print("<td>Price</td>");
			out.print("<td>Remaining</td>");
			out.print("</tr>");
			while(rs.next()){
				out.print("<tr>");
				String id = rs.getString("id");
				out.print("<td>"+rs.getString("qidian")+"</td>");
				out.print("<td>"+rs.getString("mudi")+"</td>");
				out.print("<td>"+rs.getString("price")+"</td>");
				out.print("<td>"+rs.getString("remaining")+"</td>");
				out.print("</tr>");
			}
			
		}catch(Exception e){
			out.print("error");
		}
		%>
	</table>
	</div>
	<form style="text-align: center;" action="check_ticker.jsp" method="post">
		<input type = "text" name = "Departure">
		<input type = "text" name = "Destination">
		<input type = "submit" value="查询">
	</form>
	<%
		request.setAttribute("username", sc);
	%>
		<a href='UserTicket.jsp?name=<%=sc%>'>
	查询当前行程
	</a>
	
	</body>
</html>