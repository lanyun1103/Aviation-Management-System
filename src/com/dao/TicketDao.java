package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TicketDao {
	/**
	 * 订票，先查询还有多少张，然后将票量-1
	 * 
	 * @param con 链接
	 * @param id  飞机编号
	 * @throws Exception
	 */
	public boolean BookTicket(Connection con, String username, int id, String d1_t, String d2_t, String qidian,
			String mudi) throws Exception {
		// 先查询还有多少张票，如果小于等于0则返回false
		String sql1 = "select * from table_ticket_info where id = ?";
		PreparedStatement pstmt1 = con.prepareStatement(sql1);
		pstmt1.setInt(1, id);
		ResultSet rs = pstmt1.executeQuery();
		int cur_remaining = 0;
		while (rs.next()) {
			cur_remaining = rs.getInt("remaining");
		}
		if (cur_remaining <= 0) {
			return false;
		}
		// 执行减少票价
		String sql2 = "update table_ticket_info set remaining=? where id = ?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		int remaining = cur_remaining - 1;
		pstmt2.setInt(1, remaining);
		pstmt2.setInt(2, id);
		pstmt2.executeUpdate();

		// 插入航程信息需要六个信息，购买人的名字，航班编号，起飞、到达时间，起点，终点
		String sql3 = "insert into t_voyage_info " + "(user, ticket_id ,departure_time, arrive_time, qidian, mudi)"
				+ " values (?,?,?,?,?,?)";
		PreparedStatement pstmt3 = con.prepareStatement(sql3);
		pstmt3.setString(1, username);
		pstmt3.setInt(2, id);
		pstmt3.setString(3, d1_t);
		pstmt3.setString(4, d2_t);
		pstmt3.setString(5, qidian);
		pstmt3.setString(6, mudi);
		pstmt3.executeUpdate();

		return true;
	}

	/**
	 * 查询是否有这张票
	 * 
	 * @param con
	 * @param Dep 获取起始地
	 * @param Des 获取目的地
	 * @return
	 * @throws Exception
	 */
	public int SearTicket(Connection con, String Dep, String Des) throws Exception {
		String sql = "select * from table_ticket_info where qidian=? and mudi=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, Dep);
		pstmt.setString(2, Des);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			return rs.getInt("id");
		}
		return 0;
	}

	public String[] getInfo(Connection con, int id) throws Exception {
		String sql = "select * from table_ticket_info where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		String d1_t = "";
		String d2_t = "";
		String qidian = "";
		String mudi = "";
		while (rs.next()) {
			d1_t = rs.getString("departure_time");
			d2_t = rs.getString("arrive_time");
			qidian = rs.getString("qidian");
			mudi = rs.getString("mudi");
		}
		if (d1_t == "" && d2_t == "") {
			return null;
		}
		String[] res = new String[4];
		res[0] = d1_t;
		res[1] = d2_t;
		res[2] = qidian;
		res[3] = mudi;
		return res;

	}
}
