package com.bookstore.search.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bookstore.db.ConnectionPoolMgr;

public class bookDAO {
	private ConnectionPoolMgr pool;
	
	public bookDAO(){
		pool=pool.getInstance();
		System.out.println("인스턴스 생성성공");
	}
	
	public int insertbook(bookVO vo) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		try { // ('978-89-7297',8,'나의 라임오렌지나무','동녘','J.M. 바스콘셀로스',13000);
			con=pool.getConnection();
			String sql="insert into bookinfo\r\n" + 
						"values(?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getISBN());
			ps.setInt(2, vo.getOrderno());
			ps.setString(3, vo.getBooktitle());
			ps.setString(4, vo.getPublisher());
			ps.setString(5, vo.getWriter());
			ps.setInt(6, vo.getPrice());
			
			int result=ps.executeUpdate();
			System.out.println("insertbook 결과 result="+result+", 매개변수 vo="+vo);
			return result;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
