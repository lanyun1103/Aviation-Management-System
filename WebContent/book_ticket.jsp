<%@ page language="java" contentType="text/html; charset=utf-8" 
import="java.sql.*,java.io.*,java.util.*,com.dbutil.DBUtil,com.dao.*"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>You can book ticket here</title>
 <script type="text/javascript">
 	function next(){
		window.location = "UserTicket.jsp";
    }
 	function redirt(){
		var p1 = document.getElementById("dep").text;
		var p2 = document.getElementById("des").text;
		var username = document.getElementById("username").text;
		alert(p1);
		var URL = "check_ticker.jsp?Departure="+p1+"&Destination="+p2+"&username="+username ;
		window.location.href=URL;
 	}
</script>
<style type="text/css">
table{
    border-collapse: collapse;
    text-align: center
}
#sub{
	width: 120px;
}
</style>
</head>
<body background="timg.jpg" style="font-size: x-large">

	<div>
		<table border="1.5" align="center" >
			<tr>
				<td colspan="2">欢迎您：</td>
				<%
					request.setCharacterEncoding("UTF-8");
					response.setCharacterEncoding("UTF-8"); 
					response.setContentType("text/html; charset=utf-8");
				%>
				<td colspan="2">
				<%
					String sc = "";
					try{
						sc = request.getParameter("username");
						sc = new String(sc.getBytes("iso-8859-1"),"utf-8");
						out.print("<a id=\"username\">"+sc+"</a>");
					}catch(Exception e){
						e.printStackTrace();
					}
				 %></td>			
				
			</tr>
			<tr>
				<td colspan="4">票务信息</td>
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
				out.print("<td>&nbsp&nbsp&nbsp起点&nbsp&nbsp&nbsp</td>");
				out.print("<td>&nbsp&nbsp&nbsp终点&nbsp&nbsp&nbsp</td>");
				out.print("<td>&nbsp&nbsp&nbsp价格&nbsp&nbsp&nbsp</td>");
				out.print("<td>剩余票数</td>");
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
			<tr>
				<td colspan="2">起点</td>
				<td colspan="2">终点</td>
			</tr>
			
			<%! PreparedStatement pstmt ;%>
			<%
				TicketDao td = new TicketDao();
				//获取数据库中所有票的信息
				DBUtil dbu = new DBUtil();
				Connection con = dbu.connect();
				String sql = "select * from table_ticket_info";
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
			%>
			<tr>
				<td colspan="2">
					<select>
						<%
							while(rs.next()){
								out.print("<option id=\"dep\" value =\"Departure\">"+rs.getString("qidian")+"</option>");
							}
						%>
					</select>
				</td>
				
				<td colspan="2">
					<select>
					<%
						rs = pstmt.executeQuery();
						while(rs.next()){
							out.print("<option id=\"des\" value =\"Destination\">"+rs.getString("mudi")+"</option>");
						}
					 %>
					</select>
				</td>
			<tr>
			<tr>
				<td colspan="4"><input id="but" type="button" onclick="redirt()" value="跳转信息填写界面"/>
				
				</td>
			</tr>
		</table>
	</div>
	<!-- 
	<form style="text-align: center;" action="check_ticker.jsp" method="post">
		<input type = "text" name = "Departure">
		<input type = "text" name = "Destination">
		<input type = "submit" id="sub" value="查询">
	</form>
	 -->
	
	<%
	try{
		request.setAttribute("username", sc);
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
		<a href='UserTicket.jsp?name=<%=sc%>'>
	查询当前行程
	</a>
	
	</body>
</html>