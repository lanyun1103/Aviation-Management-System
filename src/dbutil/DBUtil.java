package dbutil;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * 
 * @author 14215
 *
 */
public class DBUtil {

	private String dbURL = "jdbc:mysql://localhost:3306/db_ticket?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	private String dbUserName = "root";
	private String dbPWD = "lollol1103";
	private String jdbcName = "com.mysql.jdbc.Driver";

	
	public Connection getCon() throws Exception {
		Class.forName(jdbcName);
		Connection con = DriverManager.getConnection(dbURL, dbUserName, dbPWD);
		return con;
	}

	public void CloseDB(Connection con) throws Exception {
		if (con != null) {
			System.out.println("链接关闭啦");
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
