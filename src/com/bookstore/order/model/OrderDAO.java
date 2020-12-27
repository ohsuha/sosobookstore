package com.bookstore.order.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.bookstore.db.ConnectionPoolMgr;
import com.bookstore.orderDetail.model.OrderDetailDTO;

public class OrderDAO {
	private ConnectionPoolMgr pool;
	
	public OrderDAO(){
		pool=ConnectionPoolMgr.getInstance();
	}
	
	//주문 생성 order insert
	public int insertOrder(OrderDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con=pool.getConnection();

			String sql ="insert into bookorder(o_no, bu_userid, o_zipcode, o_address1, o_address2, o_totalprice, o_orderdate)\r\n" + 
					"values(bookorder_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getBu_userid());
			ps.setString(2, dto.getO_zipcode());
			ps.setString(3, dto.getO_address1());
			ps.setString(4, dto.getO_address2());
			ps.setInt(5, dto.getO_totalPrice());
			int cnt = ps.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	//특정 회원아이디로 3초안에 주문이 들어간 것의 주문 번호를 구하기
	public int selectOrderByTime(String userid) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con=pool.getConnection();
			String sql ="SELECT o_no FROM bookorder\r\n" + 
					"WHERE o_orderdate >= SYSDATE - 1/((24*60*60)*3) and bu_userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			int no = 0;
			if(rs.next()) {
				no = rs.getInt("o_no");
			}
			return no;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//주문취소 -> del falg만 Y로 update하기
	
	
}
