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
    border-collapse: collapse;
    text-align: center;
    
}
</style>
</head>
<body background="timg.jpg">
	<form action="admin_ticket_change.jsp">
		<table align="center" border=1>
			<tr>
				<td colspan="2">管理员管理系统</td>
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
	<a href="index.jsp">返回主页面</a>
</body>
</html>