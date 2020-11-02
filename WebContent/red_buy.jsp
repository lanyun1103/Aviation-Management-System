<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    import="com.dao.*,java.sql.*,com.dbutil.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		int id = Integer.parseInt(request.getParameter("id"));
		
		String d1_t = request.getParameter("d1_t");
		String d2_t = request.getParameter("d2_t");
		
		String qidian = request.getParameter("qidian");
		String mudi = request.getParameter("mudi");
		String username = request.getParameter("username");

		//建立连接，进行订票操作
		Connection con = new DBUtil().connect();
		TicketDao td = new TicketDao();
		boolean boo = td.BookTicket(con, username, id, d1_t, d2_t, qidian, mudi);
		//如果订票成功，那么重新转到订票界面，如果可以的话，后面可以加上一个弹窗提示信息。
		if(boo){
			String site = "book_ticket.jsp";
			response.sendRedirect(site+"?username="+username);
		}
		else{
			String site = "book_ticket.jsp";
			response.sendRedirect(site+"?username="+username);
		}
	%>
		
	
</body>
</html>