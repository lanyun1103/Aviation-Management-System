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
		
		Connection con = new DBUtil().connect();
		TicketDao td = new TicketDao();
		boolean boo = td.BookTicket(con, id);
		if(boo){
			String site = "book_ticket.jsp";
			response.sendRedirect(site+"?username="+name);
		}
		else{
			String site = "book_ticket.jsp";
			response.sendRedirect(site+"?username="+name);
		}
	%>
		
	
</body>
</html>