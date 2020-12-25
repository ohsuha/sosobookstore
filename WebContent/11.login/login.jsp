<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="../bs/js/jquery-3.5.1.min.js"></script>
<!DOCTYPE html>
<html lang="zxx">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>소소책방 :: 도서관</title>

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
<%
//로그인
//회원가입-페이지이동
request.setCharacterEncoding("utf-8");

String userid=request.getParameter("userid");
String password=request.getParameter("password");

if(userid==null){
	userid="";
}
if(password==null){
	password="";
}
System.out.println("a"+userid+"b"+password);

%>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../bs/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>로그인</h2>
                        <div class="breadcrumb__option">
                            <a href="../10_main/index.jsp">메인페이지</a>
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
                                        <p><span>아이디</span><input type="text" name="userid" id="userid" class="call" value="<%=userid%>"></p>
                                        <p><span>비밀번호</span><input type="text" name="password" id="password" class="call" value="<%=password%>"></p>
                                        <button type="submit" class="site-btn" name="booklogin">로그인</button>
                                        </form>
                                        <button type="submit" class="site-btn" name="register" onclick="location='../12.register/register.jsp'")>회원가입</button>
                                    </div>
                                </div>
                            </div>
                        </div>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

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