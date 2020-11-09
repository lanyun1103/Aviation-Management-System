<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.TicketDao"%>
<%@page import="dbutil.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>管理票务界面</title>
<style>
body{
	font-size: x-large;
	text-align: center;
}
table{
    background:rgba(0,0,0,0.1)/*0.1~1为透明度bai*/;
		border-collapse: collapse;
    	text-align: center;
    
}

</style>
<script>
function getValue(){
	var input = document.getElementsByTagName("input");
	var url="delete.jsp?";
    var str="选中的值为:";
    var count =0;
    for (var i = 0; i < input.length; i++)
    {
      var obj = input[i];
      //判断是否是checkbox并且已经选中
      if (obj.type == "checkbox" && obj.checked) 
      {
    	  if(count>0){
    		  url=url+"&";
    	  }
        var code = obj.value;//获取checkbox的值
        str=str+code;
        url=url+"id="+code;
        count=count+1;
      }
    }
    window.location.href=url;
}
</script>
</head>
<body background="timg.jpg">
	<form action="admin_ticket_change.jsp">
		<table align="center" border=1>
			<tr>
				<td colspan="2"><span><font color="grey">管理员管理系统</font></span></td>
			</tr>
			<tr>
				<td colspan="2">在这里<span><font color="red">添加机票信息</font></span></td>
			</tr>
			<tr>
				<td>起点</td>
				<td><input type="text" name="qidian"></td>
			</tr>
			<tr>
				<td>终点</td>
				<td><input type="text" name="mudi"></td>
			</tr>
			<tr>
				<td>起飞时间</td>
				<td><input type="text" name="t1"></td>
			</tr>
			<tr>
				<td>到达时间</td>
				<td><input type="text" name="t2"></td>
			</tr>
			<tr>
				<td>票量</td>
				<td><input type="text" name="remaining"></td>
			</tr>
			<tr>
				<td>价格</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="提交数据"></td>
			</tr>
			
	
		</table>
		</form>
		<table align="center" border=1>
		<tr>
			<td colspan="7"><span><font color="red">在这里删除机票</font></span></td>
		</tr>
		<tr>
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
			out.print("<td>&nbsp&nbsp&nbsp序号&nbsp&nbsp&nbsp</td>");
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
				out.print("<td><input type=\"checkbox\"  value=\""+id+"\"/><span>"+id+"</span></td>");
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
		</tr>
		<tr>
			<td colspan="7"><button onclick="getValue()">执行删除</button></td>
		</tr>
		
	</table>
	<a href="index.jsp">返回主页面</a>
</body>
</html>