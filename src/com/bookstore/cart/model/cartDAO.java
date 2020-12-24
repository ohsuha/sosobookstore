package com.bookstore.cart.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<cartDTO> showCart(String bu_userid) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<cartDTO> list = new ArrayList<cartDTO>();

		try {
			con = pool.getConnection();
			
			String sql = "select c_bookqty, bd_title, bd_image, bd_price" + 
					" from cart c join bookdetail b" + 
					" on c.bd_no = b.bd_no" +
					" and bu_userid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, bu_userid);
			
			rs= ps.executeQuery();
			while(rs.next()) {
				cartDTO dto = new cartDTO();
				dto.setC_bookqty(rs.getInt("c_bookqty"));
				dto.setBd_title(rs.getString("bd_title"));
				dto.setBd_price(rs.getInt("bd_price"));
				dto.setBd_image(rs.getString("bd_image"));
				list.add(dto);
			}
			System.out.println("회원의 장바구니 목록 개수 : " + list.size());
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		} 
	}
	
}
