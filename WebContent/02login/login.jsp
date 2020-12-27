<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../00inc/top.jsp"%>
<%@ include file="../00inc/search.jsp"%>
<script type="text/javascript">
	$(function(){
		$('#userid').focus();
		
		$('form[name=bookLogin]').submit(function(){
			$('.call').each(function(idx, item){
				if($(this).val().length<1){
					alert($(this).prev().text() +"를 입력하세요");
					$(this).focus();
					event.preventDefault();
					return false;
				}
			});
		});
	});
</script>

<body>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../bs/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>로그인</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">메인페이지</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>로그인</h4>
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                    <form name="bookLogin" method="post" action="login_ok.jsp">
                                        <p><span>아이디</span><input type="text" name="userid" id="userid" class="call" ></p>
                                        <p><span>비밀번호</span><input type="text" name="password" id="password" class="call"></p>
                                        <button type="submit" class="site-btn" name="booklogin">로그인</button>
                                        </form>
                                        <button type="submit" class="site-btn" name="register" onclick="location='../01register/register.jsp'")>회원가입</button>
                                    </div>
                                </div>
                            </div>
                        </div>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
    
    <!-- Footer Section Begin -->
	<%@include file="../00inc/footer.jsp" %>
    <!-- Footer Section End -->

</body>
</html>