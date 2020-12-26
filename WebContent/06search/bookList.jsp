<%@page import="com.bookstore.cart.model.cartDAO"%>
<%@page import="com.bookstore.common.PageVo"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.bookstore.book.model.BookDetailVo"%>
<%@page import="com.bookstore.book.model.BookDetailDAO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../bs/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../bs/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../bs/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../bs/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../bs/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../bs/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../bs/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../bs/css/style.css" type="text/css">
    
	<script type="text/javascript" src="../bs/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#addCart').click(function(){
			alert("장바구니에 책이 담겼습니다.");
			<%
				request.setCharacterEncoding("utf-8");
				String bookNo=request.getParameter("cartNo");
				String userId=(String)session.getAttribute("userid");
				System.out.println("로그인 한 유저아이디"+userId);

					if(bookNo!=null && !bookNo.isEmpty()){
						cartDAO cartDao=new cartDAO();
						int bdNo=Integer.parseInt(bookNo);
						try{
							int cnt = cartDao.insertCart(bdNo,userId);
							System.out.println("장바구니에 담음 결과 cnt: "+cnt);
						}catch(SQLException e){
							e.printStackTrace();
						}
					}
			%>
		});
	});
	</script>
</head>

<body>
<%
////////도서 리스트 보여주기///////
//[1] main 에서 shop 클릭하면 get방식으로 이동 
//[2] bookList.jsp에서 검색 버튼 클릭하면 post방식으로 submit
//[3] bookList.jsp에서 페이지 번호를 클릭하면 get방식으로 이동

//1.

String keyword=request.getParameter("searchKeyword");
String condition=request.getParameter("searchCondition");

//2.
BookDetailDAO bdDao = new BookDetailDAO();
List<BookDetailVo> list = null;
try {
	list = bdDao.showAll(keyword, condition);
	System.out.print("불러온 도서 레코드 수 :"+list.size());
} catch (SQLException e) {
	e.printStackTrace();
}

//3.
DecimalFormat df = new DecimalFormat("#,###");

if(keyword==null){
	keyword="";
}
if(condition==null){
	condition="";
}

//////베스트셀러 도서 리스트 보여주기///////
//1.
//2
List<BookDetailVo> bestList = null;
try{
	bestList=bdDao.showBestseller();
	System.out.print("베스트셀러 레코드 수 :"+bestList.size());
}catch(SQLException e){
	e.printStackTrace();
}


//페이징처리
//PageVo pageVo = new PageVo(int currentPage, int totalRecord, int pageSize, int blockSize);
int currentPage=1;
if(request.getParameter("currentPage")!=null){
	currentPage=Integer.parseInt(request.getParameter("currentPage"));
}

PageVo pageVo = new PageVo(currentPage, list.size(), 9, 5);

%>
    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span id="selectMenu">전체</span>
                        </div>
                        <ul id="selectList">
                           <li><a href="/sosobookstore/06search/bookList.jsp?searchCondition=문학" >문학</a></li>
                           <li><a href="/sosobookstore/06search/bookList.jsp?searchCondition=사회과학">사회과학</a></li>
                           <li><a href="/sosobookstore/06search/bookList.jsp?searchCondition=예술">예술</a></li>
                           <li><a href="/sosobookstore/06search/bookList.jsp?searchCondition=철학">철학</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                        <!-- 검색 버튼 -->
                            <form action="bookList.jsp" method="post" name="searchFrm" >
                                <input type="text" name="searchKeyword" placeholder="검색하실 책의 제목 또는 작가명을 입력하세요." value="<%=keyword%>">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../bs/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <!-- Product Section Begin -->
    <!-- 사이드메뉴 -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                    	<!-- 책 장르 카테고리 -->
                        <div class="sidebar__item">
                            <h4>Book field</h4>
                            <ul>
                                <li><a href="/sosobookstore/06search/bookList.jsp" value="문학">전체</a></li>
                                <li><a href="/sosobookstore/06search/bookList.jsp?searchCondition=문학" >문학</a></li>
                                <li><a href="/sosobookstore/06search/bookList.jsp?searchCondition=사회과학">사회과학</a></li>
                                <li><a href="/sosobookstore/06search/bookList.jsp?searchCondition=예술">예술</a></li>
                                <li><a href="/sosobookstore/06search/bookList.jsp?searchCondition=철학">철학</a></li>
                            </ul>
                        </div>
                       
                       <!-- 추천 도서 소개 -->
                        <div class="sidebar__item"> 
                            <div class="latest-product__text">
                                <h4>추천 도서</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                        <!-- 최신 도서 소개 리스트 [반복] -->
                                        <%if(bestList!=null && !bestList.isEmpty()){
                                        	for(int i=0; i<3; i++) {
                                        		BookDetailVo vo = bestList.get(i);
                                        	%>
                                        	<a href="/sosobookstore/07detail/bookDetail.jsp?no=<%=vo.getBd_no() %>" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="<%=vo.getBd_image() %>" alt="도서 이미지">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6><%=vo.getBd_title() %></h6>
                                                <span><%=df.format(vo.getBd_price()) %>원</span>
                                            </div>
                                        </a>
                                        <%}//for
                                       	}//if%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                   <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <!-- <div class="filter__sort">
                            		<span>Sort By</span>
                                    <select>
                                        <option value="0">최신순</option>
                                        <option value="1">인기순</option>
                                    </select>
                                </div> -->
                            </div>
                            <div class="col-lg-4 col-md-4">

                            </div>
                            <div class="col-lg-4 col-md-3">
                                    <div class="filter__found">
                                    <h6><span>총 <%=list.size() %>개</span>의 도서가 있습니다.</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    <!-- 반복되는 상품 리스트 형식 -->
                    <% 
                    if(list==null && list.isEmpty()){%>
                    	<p> 검색 결과가 존재하지 않습니다. </p>
                    <%}else{
                    	int num = pageVo.getNum();
                    	int curPos = pageVo.getCurPos();
                    	for(int i=0; i<pageVo.getPageSize(); i++){
                    		if(num<1) break;
                    		
                    		BookDetailVo vo = list.get(curPos++);
                    		num--;
                    		%>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                            
                                <div class="product__item__pic set-bg" data-setbg="<%=vo.getBd_image()%>">
                                    <ul class="product__item__pic__hover">
                                        <li>
	                                        <a id="addCart" href="bookList.jsp?currentPage=<%=pageVo.getCurrentPage()%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>&cartNo=<%=vo.getBd_no()%>">
	                                        	<i class="fa fa-shopping-cart"></i>
	                                        </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="/sosobookstore/07detail/bookDetail.jsp?no=<%=vo.getBd_no() %>"><%=vo.getBd_title() %></a></h6>
                                    <h5><%=df.format(vo.getBd_price()) %>원</h5>
                                </div>
                            </div>
                        </div>
                      <%}//for 
                    }//if%>
                        
                    </div>
                    <!-- 페이지!!!!!!! -->
                    <div class="product__pagination">
                    	<!-- 이전 블럭으로 이동 -->
                    	<%if(pageVo.getFirstPage()>1) {%>
                    		<a href="bookList.jsp?currentPage=<%=pageVo.getFirstPage()-1%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>"><i class="fa fa-long-arrow-left"></i></a>
                    	<%} %>
                    	<!-- 1 2 3 4 5  -->
                        <% for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){
                        	if(i>pageVo.getTotalPage()) break;
                        	
                        	if(i==pageVo.getCurrentPage()){%>
                        		<a><%=i%></a>
                       	<%	}else{ %>
                       			<a href="bookList.jsp?currentPage=<%=i%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>"><%=i%></a>
                    	<%}//if
                    	}//for %>
                    	<!-- 1 2 3 4 5  -->
                    	<%if(pageVo.getLastPage()<pageVo.getTotalPage()){ %>
                        	<a href="bookList.jsp?currentPage=<%=pageVo.getLastPage()+1%>&searchKeyword=<%=keyword%>&searchCondition=<%=condition%>"><i class="fa fa-long-arrow-right"></i></a>
                        <%} %>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Js Plugins -->
    <script src="../bs/js/jquery-3.3.1.min.js"></script>
    <script src="../bs/js/bootstrap.min.js"></script>
    <script src="../bs/js/jquery.nice-select.min.js"></script>
    <script src="../bs/js/jquery-ui.min.js"></script>
    <script src="../bs/js/jquery.slicknav.js"></script>
    <script src="../bs/js/mixitup.min.js"></script>
    <script src="../bs/js/owl.carousel.min.js"></script>
    <script src="../bs/js/main.js"></script>

</body>

</html>