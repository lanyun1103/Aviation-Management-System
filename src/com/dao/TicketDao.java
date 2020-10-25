package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TicketDao {
	/**
	 * 
	 * @param con	链接
	 * @param id	飞机编号
	 * @throws Exception	
	 */
	public boolean BookTicket(Connection con,int id) throws Exception{
		//先查询还有多少张票
		String sql1 = "select * from table_ticket_info where id = ?";
		PreparedStatement pstmt1 = con.prepareStatement(sql1);
		pstmt1.setInt(1, id);
		ResultSet rs = pstmt1.executeQuery();
		int cur_remaining = 0;
		while(rs.next()) {
			cur_remaining = rs.getInt("remaining");
		}
		if(cur_remaining <=0) {
			return false;
		}
		
		String sql2 = "update table_ticket_info set remaining=? where id = ?";
		PreparedStatement pstmt2 = con.prepareStatement(sql2);
		int remaining = cur_remaining-1;
		pstmt2.setInt(1, remaining);
		pstmt2.setInt(2, id);
		pstmt2.executeUpdate();
		return true;
	}
	/**
	 * 
	 * @param con
	 * @param Dep 	获取起始地
	 * @param Des	获取目的地
	 * @return
	 * @throws Exception
	 */
	public int SearTicket(Connection con,String Dep,String Des) throws Exception{
		String sql = "select * from table_ticket_info where qidian=? and mudi=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, Dep);
		pstmt.setString(2, Des);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			return rs.getInt("id");
		}
		return 0;
	}
}
