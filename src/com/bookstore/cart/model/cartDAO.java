package com.bookstore.cart.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bookstore.db.ConnectionPoolMgr;

public class cartDAO {
	private ConnectionPoolMgr pool;
	
	public cartDAO(){
		pool=ConnectionPoolMgr.getInstance();
	}
	
	//리스트 페이지에서 장바구니에 담기
	public int insertCart(int bookNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		
		try {
			con=pool.getConnection();
			String sql="insert into cart(c_no, bu_userid, bd_no)\r\n" + 
					"values(cart_seq.nextval,'testuser',?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, bookNo);
			int cnt=ps.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	//도서 상세 페이지에서 장바구니 담기
	public int insertCartDetail(int bookNo, int bookQty) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		
		try {
			con=pool.getConnection();
			String sql="insert into cart(c_no, C_BOOKQTY, bu_userid, bd_no)\r\n" + 
					"values(cart_seq.nextval, ?,'testuser',?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, bookQty);
			ps.setInt(2, bookNo);
			int cnt=ps.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
