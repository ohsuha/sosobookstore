package com.bookstore.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionPoolMgr3 {
	public ConnectionPoolMgr3(){
		//1. 드라이버 로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로딩 성공!");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패!");
			e.printStackTrace();
		}		
	}
	
	public Connection getConnection() throws SQLException {
		//2. db에 연결하는 Connection객체 생성
		String url="jdbc:oracle:thin:@DESKTOP-D9TOVH8:1521:xe";
		String user="semi6", upwd="semi666";
		Connection con = getConnection(url, user, upwd);
		
		return con;
	}
	
	public Connection getConnection(String url, String user, 
			String upwd) throws SQLException {
		Connection con = DriverManager.getConnection(url, user, upwd);
		System.out.println("db연결 con="+con);
		
		return con;
	}
	
	public Connection getConnection(String user, 
			String upwd) throws SQLException {
		String url="jdbc:oracle:thin:@DESKTOP-D9TOVH8:1521:xe";
		
		return getConnection(url, user, upwd);
	}
	
	public void dbClose(ResultSet rs, PreparedStatement ps,
			Connection con) throws SQLException {
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(con!=null) con.close();
	}
	
	public void dbClose(PreparedStatement ps,
			Connection con) throws SQLException {
		if(ps!=null) ps.close();
		if(con!=null) con.close();
	}
	
	
}
