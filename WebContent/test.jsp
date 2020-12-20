<%@page import="java.sql.SQLException"%>
<%@page import="com.bookstore.search.model.bookVO"%>
<%@page import="com.bookstore.search.model.bookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	bookDAO dao = new bookDAO();
	bookVO vo = new bookVO();
	vo.setBooktitle("테스트");
	vo.setISBN("9255457");
	vo.setOrderno(8);
	vo.setPrice(35000);
	vo.setPublisher("출판사테스트");
	vo.setWriter("작가테스트");
	int cnt =0;
	try {
		cnt = dao.insertbook(vo);
		System.out.println("insertbook 결과 cnt="+cnt+", 매개변수 vo="+vo);
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
</body>
<h1>테스트 결과 <%=cnt %></h1>
</html>