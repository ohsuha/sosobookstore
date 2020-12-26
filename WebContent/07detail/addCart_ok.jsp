<%@page import="java.sql.SQLException"%>
<%@page import="com.bookstore.cart.model.cartDAO"%>
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
	//1
	//bookDetail에서 post방식으로 submit
	request.setCharacterEncoding("utf-8");
	String bookQ = request.getParameter("bookQty");
	String bookN = request.getParameter("bookNo");
	int bookQty = Integer.parseInt(bookQ);
	int bookNo = Integer.parseInt(bookN);
	//나중에 회원 아이디 받아오기
	
	//2
	
	cartDAO dao = new cartDAO();
	try{
		int cnt = dao.insertCartDetail(bookNo, bookQty);
		System.out.println("장바구니 담기 성공여부 : "+cnt+", 매개변수 갯수 : "+bookQ+", 매개변수 도서 번호 : "+bookNo);
		if(cnt>0){%>
			<script type="text/javascript">
				alert("장바구니에 <%=bookQty%> 개의 도서가 담겼습니다.");
				location.href="/sosobookstore/07detail/bookDetail.jsp?no=<%=bookNo%>";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert("장바구니 담기 실패");
				location.href="/sosobookstore/07detail/bookDetail.jsp?no=<%=bookNo%>";
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>