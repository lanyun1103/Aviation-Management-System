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
<%! String dep; %>
<%! String des; %>
	<%
	
		//接收参数
		TicketDao td = new TicketDao();
	
		String dep = request.getParameter("Departure");
	    dep = new String(dep.getBytes("iso-8859-1"),"utf-8"); 


		String des = request.getParameter("Destination");
	    des = new String(des.getBytes("iso-8859-1"),"utf-8"); 
	    
	    String username = request.getParameter("username");
	    username = new String(username.getBytes("iso-8859-1"),"utf-8");
	%>
	
	<%
		//建立连接查询是否有这票
		Connection con = new DBUtil().connect();
		int id = td.SearTicket(con, dep, des);
		if(id!=0){
			out.print("您确定需要购买从  "+dep+"  到  "+des+ "的车票嘛，请输入你的信息");
		}
		else{
			out.print("没有这列班车，请返回购买界面");
		}
		String[] infos = td.getInfo(con, id);
		String d1_t = infos[0];
		String d2_t = infos[1];
		String qidian = infos[2];
		String mudi = infos[3];
	%>
	<!-- 
		这个表格需要传递很多信息
		
	 -->
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
				<td>购买账号</td>
				<td><input type="text" name="username" value=<%=username%>> </td>	
				<td><input type="text" name="d1_t" value=<%=d1_t%>> </td>
				<td><input type="text" name="d2_t" value=<%=d2_t%>> </td>
				<td><input type="text" name="qidian" value=<%=dep%>> </td>
				<td><input type="text" name="mudi" value=<%=des %>> </td>
				
			</tr>
			<tr>
				<td colspan="4"><input type ="submit" value="购买"></td>
			</tr>
			<tr>
			
			<!-- 这里还需要传来一个username参数，不然返回购买界面会报错 -->
				<td><a href="book_ticket.jsp?username=<%= username %>">返回购买界面</a></td>
			</tr>
		</table>
	</form>
</body>
</html>