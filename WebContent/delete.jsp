<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbutil.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
	text-align: center;
	font-size: x-large;
}
</style>
<meta charset="utf-8" http-equiv="refresh" content="3;url=AdminManage.jsp">
<title>Insert title here</title>
</head>
<body background="timg.jpg">
	<%
	 	String[] ids = request.getParameterValues("id");
		if(ids==null){
			out.print("你没有选中任何机票！三秒钟后自动跳转。");
		}
		else{
			try{
			DBUtil dbu = new DBUtil();
			Connection con = dbu.connect();
			for(String string : ids){
				String sql = "delete from table_ticket_info where id=?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(string));
				pstmt.executeUpdate();
			}
			out.print("删除成功，三秒钟后自动跳转");
			new DBUtil().CloseDB(con);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	%>
</body>
</html>