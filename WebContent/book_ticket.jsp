<%@ page language="java" contentType="text/html; charset=utf-8" 
import="java.sql.*,java.io.*,java.util.*,com.dbutil.DBUtil,com.dao.*"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>购买机票界面</title>
 <script type="text/javascript">
 	function next(){
		window.location = "UserTicket.jsp";
    }
 	function redirt(){

 	    var dom1 = document.getElementById("depart");
 	    var p1 = dom1.options[dom1.selectedIndex].text;

 	    var dom2 = document.getElementById("destin");
 	    var p2 = dom2.options[dom2.selectedIndex].text;
 	    
		//var p1 = document.getElementById("dep").text;
		//var p2 = document.getElementById("des").text;
		var username = document.getElementById("username").text;
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
				<!-- <td colspan="3">欢迎您：</td>
				 -->
				 <%
					request.setCharacterEncoding("UTF-8");
					response.setCharacterEncoding("UTF-8"); 
					response.setContentType("text/html; charset=utf-8");
				%>
				<td colspan="7">
				<%
					String sc = "";
					try{
						sc = request.getParameter("username");
						sc = new String(sc.getBytes("iso-8859-1"),"utf-8");
						out.print("<a id=\"username\">欢迎您："+sc+"</a>");
					}catch(Exception e){
						e.printStackTrace();
					}
				 %></td>			
				
			</tr>
			<tr>
				<td colspan="6">票务信息</td>
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
				out.print("<td>出发时间</td>");
				out.print("<td>到达时间</td>");

				out.print("<td>&nbsp&nbsp&nbsp价格&nbsp&nbsp&nbsp</td>");
				out.print("<td>剩余票数</td>");
				out.print("</tr>");
				while(rs.next()){
					out.print("<tr>");
					String id = rs.getString("id");
					out.print("<td>"+rs.getString("qidian")+"</td>");
					out.print("<td>"+rs.getString("mudi")+"</td>");
					out.print("<td>"+rs.getString("departure_time")+"</td>");
					out.print("<td>"+rs.getString("arrive_time")+"</td>");

					out.print("<td>"+rs.getString("price")+"</td>");
					out.print("<td>"+rs.getString("remaining")+"</td>");
					out.print("</tr>");
				}
				new DBUtil().CloseDB(con);
			}catch(Exception e){
				out.print("error");
			}
			%>
			<!-- 
			<tr>
				<td colspan="3">起点</td>
				<td colspan="3">终点</td>
			</tr>
			 -->
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
				<td colspan="3">
				终点：
					<select id="depart">
						<%
							while(rs.next()){
								out.print("<option id=\"dep\" name=\"dep\" value =\"Departure\">"+rs.getString("qidian")+"</option>");
							}
						%>
					</select>
				</td>
				
				<td colspan="3">
					终点：
					<select id="destin">
					<%
						rs = pstmt.executeQuery();
						while(rs.next()){
							out.print("<option id=\"des\" name=\"des\" value =\"Destination\">"+rs.getString("mudi")+"</option>");
						}
						new DBUtil().CloseDB(con);

					 %>
					</select>
				</td>
			<tr>
			<tr>
				<td colspan="6"><input id="but" type="button" onclick="redirt()" value="跳转信息填写界面"/>
				
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
	<div align="center" style="text-align: center;font-size: medium">
	<a href='UserTicket.jsp?name=<%=sc%>'>
		查询当前行程
	</a>
	</div>
	</body>
</html>