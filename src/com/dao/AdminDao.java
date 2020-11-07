package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.Admin;

public class AdminDao {
	public Admin login(Connection con, Admin user) throws Exception {
		Admin res = null;
		String sql = "select * from t_admin_info where username = ? and password = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getUsername());
		pstmt.setString(2, user.getPassword());
		// rs用来储存执行pstmt的返回值
		ResultSet rs = pstmt.executeQuery();
		// 在数据集中遍历，直接将
		if (rs.next()) {
			res = new Admin();
			res.setId(rs.getInt("id"));
			res.setUsername(rs.getString("username"));
			res.setPassword(rs.getString("password"));

		}
		return res;
	}
}
