package com.dbutil;

import com.dao.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
/**
 *	
 * @author 14215
 *
 */
public class DBUtil {
	
	private String dbURL = "jdbc:mysql://localhost:3306/db_ticket?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	private String dbUserName = "root";
	private String dbPWD ="lollol1103";
	private String jdbcName = "com.mysql.jdbc.Driver";
	
	public Connection getCon() throws Exception{
		Class.forName(jdbcName);
		Connection con = DriverManager.getConnection(dbURL,dbUserName,dbPWD);
		return con;
	}
	
	public void CloseDB(Connection con) throws Exception {
		if(con != null) {
			con.close();
		}
	}
	/**
	 * @param args
	 */
	public Connection connect() {
		DBUtil dbu = new DBUtil();
		try {
			Connection con = dbu.getCon();
			System.out.println("链接成功啦");
			return con;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("链接失败啦");
			return null;
		}
	}
		
}

//Statement stmt = con.createStatement();
//ResultSet rs = stmt.executeQuery("select * from t_user_info");
//while(rs.next()) {
//	System.out.println(rs.getString("password"));
//}
//UserDao user = new UserDao();
//user.regis(con, "sunyongda", "sun123456");
//System.out.println("ע��ɹ�");
