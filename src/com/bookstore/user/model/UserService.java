package com.bookstore.user.model;

import java.sql.SQLException;

//Service - DB작업 이외의 로직을 담는 클래스
//jsp - DAO - DB
//jsp - Service - DAO - DB

public class UserService {
	//아이디 중복확인시 사용
	public static final int EXIST_ID=1;  //아이디가 이미 존재하는 경우
	public static final int NON_EXIST_ID=2; //존재하지 않는 경우
	
	//로그인 처리시 사용
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int ID_NONE=2; //아이디가 없는 경우
	public static final int PWD_DISAGREE=3; //비밀번호 불일치
		
	private UserDAO userDao;
	
	public UserService() {
		userDao=new UserDAO();
	}
	
	public int insertMember(UserVO vo) throws SQLException {
		int cnt=userDao.insertUser(vo);
		return cnt;
	}
	
	public int checkDup(String userid) throws SQLException {
		return userDao.checkDup(userid);
	}
		
	public int loginCheck(String userid, String pwd) throws SQLException {
		System.out.println("으악");
		return userDao.loginCheck(userid, pwd);
	}
		
	public UserVO selectMember(String userid) throws SQLException {
		return userDao.selectUser(userid);
	}
	
	public int updateMember(UserVO vo) throws SQLException {
		return userDao.updateUser(vo);
	}
	
	public int withdrawMember(String userid) throws SQLException {
		return userDao.withdrawUser(userid);
	}
	
}
