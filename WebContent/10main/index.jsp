<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../00inc/top.jsp"%>
<%
	BookDetailDAO dao=new BookDetailDAO();
	
	List<BookDetailVo> list=null;
	try{
		list=dao.showMainBook();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	DecimalFormat df=new DecimalFormat("#,###");

%>
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <%@include file="../00inc/bookfield.jsp" %>
                <div class="col-lg-9">
                <%@include file="../00inc/searchMain.jsp" %>
                    <div class="hero__item set-bg" data-setbg="../bs/img/hero/banner.jpg">
                        <div class="hero__text">
                            <span> - 소 소 책 방 - </span>
                            <h2>SOSO<br />BOOKSTORE</h2>
                            <p>오픈 기념 행사, 배송비 무료</p>
                            <a href="../06search/bookList.jsp" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>All Books</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active mixitup-control-active">New Arrivals</li>
                            <li class="selected_bestitem">Best Item</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            
            <%for(int i=0;i<list.size();i++){
            	BookDetailVo vo=list.get(i);
            	String title=vo.getBd_title();
            	int price=vo.getBd_price();%>
	                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
	                    <div class="featured__item">
	                        <div class="featured__item__pic">
	                        	<img class="bgimage" src="<%=vo.getBd_image()%>">
	                        </div>
	                        <div class="featured__item__text">
	                            <h6><a href="/sosobookstore/07detail/bookDetail.jsp?no=<%=vo.getBd_no() %>"><%=title %></a></h6>
	                            <h5><%=df.format(price) %></h5>
	                        </div>
	                    </div>
	                </div>
	             <%}//for %>
	             
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Footer Section Begin -->
	<%@include file="../00inc/footer.jsp" %>
    <!-- Footer Section End -->
</body>
</html>