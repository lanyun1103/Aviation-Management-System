<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    import="com.dao.*,java.sql.*,dbutil.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	一个中转界面
	接收传来的数据
	对数据进行购买票的操作
 -->
	<%
		String name = request.getParameter("name");
    	name = new String(name.getBytes("iso-8859-1"),"utf-8"); 

		int id = Integer.parseInt(request.getParameter("id"));
			
		String d1_t = request.getParameter("d1_t");
		String d2_t = request.getParameter("d2_t");
		
		String qidian = request.getParameter("qidian");
	    qidian = new String(qidian.getBytes("iso-8859-1"),"utf-8"); 

		String mudi = request.getParameter("mudi");
	    mudi = new String(mudi.getBytes("iso-8859-1"),"utf-8"); 

		String username = request.getParameter("username");
		//如果这个人没有输入名字，那么不给点（返回去
		if(name=="请输入姓名"){
			%>
				<jsp:forward page="check_ticker.jsp">
					<jsp:param value="<%=username %>" name="username"></jsp:param>
					<jsp:param value="<%=qidian %>" name="Departure"></jsp:param>
					<jsp:param value="<%=mudi %>" name="Destination"></jsp:param>
				</jsp:forward>
			<%
		}
		//建立连接，进行订票操作
		Connection con = new DBUtil().connect();
		TicketDao td = new TicketDao();
		boolean boo = td.BookTicket(con, username, id, d1_t, d2_t, qidian, mudi);
		new DBUtil().CloseDB(con);
		//如果订票成功，那么重新转到订票界面，如果可以的话，后面可以加上一个弹窗提示信息。
		if(boo){
			String site = "book_ticket.jsp";
			response.sendRedirect(site+"?username="+username);
		}
		//如果订票失败，那么还是返回这个页面，但是查询不到自己购买的票
		else{
			String site = "book_ticket.jsp";
			response.sendRedirect(site+"?username="+username);
		}
	%>
		
	
</body>
</html>