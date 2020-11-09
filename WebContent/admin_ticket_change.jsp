<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbutil.DBUtil"%>
<%@page import="com.dao.TicketDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" http-equiv="refresh" content="3;url=AdminManage.jsp">
<title>Insert title here</title>
</head>
<body>
	<%
		String qidian = request.getParameter("qidian");
		String mudi = request.getParameter("mudi");
		String t1 = request.getParameter("t1");
		qidian = new String(qidian.getBytes("iso-8859-1"),"utf-8");
		mudi = new String(mudi.getBytes("iso-8859-1"),"utf-8");
		

		String t2 = request.getParameter("t2");
		String remaining_get = request.getParameter("remaining");
		String price_get = request.getParameter("price");
		
		int remaining = Integer.parseInt(remaining_get);
		
		Double price = Double.parseDouble(price_get);
		Connection con = new DBUtil().getCon();
		TicketDao td = new TicketDao();
		try{
			Boolean boo = td.AddTicket(con, qidian, mudi, t1, t2, remaining, price);
			
	%>
		<p>恭喜你添加成功</p>
		<a href="AdminManage.jsp">返回添加票务界面</a>
		
	<%
			
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>