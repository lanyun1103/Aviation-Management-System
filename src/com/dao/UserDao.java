package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.model.User;

/**
 * 用户可以进行的操作
 * 
 * @author 14215
 *
 */
public class UserDao {
	/**
	 * 登陆成功，返回一个
	 * 
	 * @param con
	 * @param user
	 * @return 返回对象，如果没查询得到就返回一个null
	 * @throws Exception
	 */
	public User login(Connection con, User user) throws Exception {
		User res = null;
		String sql = "select * from t_user_info where username = ? and password = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getUsername());
		pstmt.setString(2, user.getPassword());
		// rs用来储存执行pstmt的返回值
		ResultSet rs = pstmt.executeQuery();
		// 在数据集中遍历，直接将
		if (rs.next()) {
			res = new User();
			res.setId(rs.getInt("id"));
			res.setUsername(rs.getString("username"));
			res.setPassword(rs.getString("password"));

		}
		return res;
	}

	public void regis(Connection con, String username, String password) throws Exception {
		String sql = "insert into t_user_info (username,password) VALUES (?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, username);
		pstmt.setString(2, password);
		pstmt.execute();
	}
}
