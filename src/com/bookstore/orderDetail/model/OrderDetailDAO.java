package com.bookstore.orderDetail.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bookstore.db.ConnectionPoolMgr;

public class OrderDetailDAO {
	private ConnectionPoolMgr pool;
	
	public OrderDetailDAO(){
		pool=ConnectionPoolMgr.getInstance();
	}
	
	//주문 상세 입력
	public int insertOrderDeatil(OrderDetailDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con=pool.getConnection();
			String sql = "insert into orderdetail (od_no, od_qty, o_no, bd_no)\r\n" + 
					"values(orderdetail_seq.nextval, ?, ?, ?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, dto.getOd_qty());
			ps.setInt(2, dto.getO_no());
			ps.setInt(3, dto.getBd_no());
			int cnt = ps.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
