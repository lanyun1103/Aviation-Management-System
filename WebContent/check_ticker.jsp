<%@ page language="java" contentType="text/html; charset=utf-8"
import="com.dbutil.*,java.sql.*,com.dao.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body style="text-align:center;font-size: xx-large;" background="timg.jpg">
	<%
		//接收参数
		TicketDao td = new TicketDao();
		
		String dep = request.getParameter("Departure");
		String des = request.getParameter("Destination");
		
		Connection con = new DBUtil().connect();
		int id = td.SearTicket(con, dep, des);
		if(id!=0){
			out.print("您确定需要购买从  "+dep+"  到  "+des+ "的车票嘛，请输入你的信息");
		}
		else{
			out.print("not found");
		}
		
	%>
	<form style="font-size: x-large;" action="red_buy.jsp" method="post" id="data_form">
		<table align="center">
			<tr>
				<td>姓名</td>
				<td><input type ="text" name = "name"></td>	
			</tr>
			<tr>
				<td>飞机编号</td>
				<td><input type="number" name="id" value=<%=id%> > </td>
			</tr>
			<tr>
				<td><input type ="submit" value="购买"></td>
			</tr>
		</table>
			
	</form>
</body>
</html>