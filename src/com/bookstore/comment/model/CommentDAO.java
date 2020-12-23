package com.bookstore.comment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.db.ConnectionPoolMgr;

public class CommentDAO {
	private ConnectionPoolMgr pool;
	
	CommentDAO(){
		pool=ConnectionPoolMgr.getInstance();
	}
	
	//[1] 도서상세 > 도서리뷰
	public List<CommentDTO> bookReview(int no) throws SQLException{
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		try { 
			con=pool.getConnection();
			String sql="select s.c_no,s.BD_NO, s.bu_userid, s.SC_ABOUT, s.SC_REGDATE, b.BD_TITLE\r\n" + 
					"from salecomment s join bookdetail b on s.BD_NO = b.BD_NO where s.bd_no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			rs=ps.executeQuery();
			while(rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setC_no(rs.getInt("c_no"));
				dto.setBd_no(rs.getInt("bd_no"));
				dto.setBu_userid(rs.getString("bu_userid"));
				dto.setSc_about(rs.getString("sc_about"));
				dto.setSc_regdate(rs.getDate("sc_regdate"));
				
				list.add(dto);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//[2] 마이페이지>도서 리뷰
}
