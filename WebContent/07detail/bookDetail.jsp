<%@page import="com.bookstore.comment.model.CommentDAO"%>
<%@page import="com.bookstore.book.model.BookDetailVo"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.bookstore.book.model.BookDetailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>소소책방 :: 도서 상세</title>

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
</head>

<body>
<%
	String no=request.getParameter("no");
	if(no==null || no.isEmpty()){
		%>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href='/sosobookstore/06search/bookList.jsp';
		</script>
		<%
		return;
	}
	int intNo = Integer.parseInt(no);
	System.out.print("파라미터로 받은 no:"+intNo);
	
	//2
	BookDetailDAO bookDao=new BookDetailDAO();
	
	BookDetailVo vo = null;
	try{
		vo = bookDao.selectByNo(intNo);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	//도서 소개 줄임
	String content = vo.getBd_about();
	String shortCont = content.substring(0, 120)+"...";
	
	
	
	
	
	
	
%>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../bs/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2><%=vo.getBd_title() %></h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <a href="./index.html"><%=vo.getBk_kind_info() %></a>
                            <span>도서 상세</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="<%=vo.getBd_image() %>" alt="">
                        </div>
                        <!-- 여러 이미지 보여주기 썸네일
                        <div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl="../bs/img/product/details/product-details-2.jpg"
                                src="../bs/img/product/details/thumb-1.jpg" alt="">
                            <img data-imgbigurl="../bs/img/product/details/product-details-3.jpg"
                                src="../bs/img/product/details/thumb-2.jpg" alt="">
                            <img data-imgbigurl="../bs/img/product/details/product-details-5.jpg"
                                src="../bs/img/product/details/thumb-3.jpg" alt="">
                            <img data-imgbigurl="../bs/img/product/details/product-details-4.jpg"
                                src="../bs/img/product/details/thumb-4.jpg" alt="">
                        </div>
                         -->
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3><%=vo.getBd_title() %></h3>
                        <div class="product__details__rating">
                            <span>개의 리뷰가 있습니다.</span>
                        </div>
                        <div class="product__details__price">12,600원</div>
                        <p><%=shortCont%></p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div>
                        <a href="#" class="primary-btn">ADD TO CARD</a>
                        <ul>
                            <li><b>작가</b> <span><%=vo.getBd_author() %></span></li>
                            <li><b>출판사</b> <span><%=vo.getBd_publisher() %> </span></li>
                            <li><b>출판일</b> <span><%=vo.getBd_pubdate() %></span></li>
                            <li><b>장르</b> <span><%=vo.getBk_kind_info() %></span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">도서 소개</a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">Reviews <span>(1)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>도서 소개</h6>
                                    <p><%=content %></p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <p></p>
                                    <table>
                                    	<tr>
                                    		<th>작성자</th>
                                    		<th>리뷰 내용</th>
                                    	</tr>
                                    	<tr>
                                    	</tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    	<!-- 관련 상품
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div> -->
                <!-- 예시 멀쩡한 거
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
             	 -->
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->

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