<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../00inc/top.jsp"%>
<%@ include file="../00inc/search.jsp"%>

    <!-- Blog Details Hero Begin -->
    <section class="blog-details-hero set-bg" data-setbg="../bs/img/blog/details/details-hero.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog__details__hero__text">
                        <h2>Notice</h2>
                        <ul>
                            <li>고객센터</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5 order-md-1 order-2">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__item">
                            <h4>이용안내</h4>
                            <ul>
                                <li><a href="#">전체보기</a></li>
                                <li><a href="#">주문 및 결제</a></li>
                                <li><a href="#">반품/교환/환불</a></li>
                                <li><a href="#">배송</a></li>
                                <li><a href="#">회원정보</a></li>
                                <li><a href="#">기타</a></li><br>
                            </ul>
                            <h4>공지사항</h4>
                            <ul>
                                <li><a href="#">공지사항</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
	                <div class="col-lg-9 col-md-7 order-md-1 order-1">
	                <!-- 테이블 들어갈 자리 -->
	                <table class="table">
					<thead>
		                	<tr style="text-align: center;">
		                		<th style="width: 10%">번호</th>
		                		<th style="width: 50%">제목</th>
		                		<th style="width: 25%">관리자</th>
		                		<th style="width: 25%">등록일</th>
		                	</tr>
		                </thead>
		                <tbody>
		                <!-- 글목록 출력 -->
		                	<tr>
		                		<td>1</td>
		                		<td>제목제목제목제목</td>
		                		<td>관리자</td>
		                		<td>2020-12-28</td>
		                	</tr>
		                </tbody>
	                </table>
	                <hr>
	                <input type="button" class="site-btn" value="글쓰기" 
	                	onclick="location.href='notice_write.jsp'" 
	                		style="text-align: right;">
	                </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->

<%@ include file="../00inc/footer.jsp"%>