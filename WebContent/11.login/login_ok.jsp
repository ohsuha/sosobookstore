<%@page import="com.bookstore.user.model.UserService"%>
<%@page import="com.bookstore.user.model.UserVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="userservice" class="com.bookstore.user.model.UserService" 
	scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("password");
	
	String msg="로그인 처리 실패", url="11.login/login.jsp";
	try{
		System.out.println(userid+"비명"+pwd);
		int result=userservice.loginCheck(userid, pwd);
		
		if(result==UserService.LOGIN_OK){
	session.setAttribute("userid", userid);
	UserVO vo=userservice.selectMember(userid);
	session.setAttribute("userName", vo.getBu_name());
	
	msg=vo.getBu_name() + "님 로그인되었습니다.";
	url="/html.jsp";//로그인 성공시 메인페이지로 이동
	
		}else if(result==UserService.PWD_DISAGREE){
	msg="비밀번호가 일치하지 않습니다.";
		}else if(result==UserService.ID_NONE){
	msg="해당 아이디가 존재하지 않습니다.";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	//3
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);

	String ctxPath = request.getContextPath();
	url = ctxPath + url;
%>
<jsp:forward page="message.jsp"></jsp:forward>
</body>
</html>