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
		
		$('form[name=userregister]').submit(function(){
			if('button[name=register]'){
				alert("회원가입창으로 이동합니다.");
				event.preventDefault();
				return false;
			}else{
				$('.call').each(function(idx, item){
					if($(this).val().length<1){
						alert($(this).prev().text() +"를 입력하세요");
						$(this).focus();
						event.preventDefault();
						return false;
					}
				});
			}
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
                        <h2>회원가입</h2>
                        <div class="breadcrumb__option">
                            <a href="../11.login/login.jsp">로그인</a>
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
                <h4>회원가입</h4>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            
                            <div class="col-lg-8">
                            	<div class="checkout__input">
                                 <p>이름</p>
                                 <input type="text">
                             </div>
                            <div class="checkout__input">
                                 <p>아이디</p>
                                <input type="text" placeholder="중복체크를 해주세요">
                                 <div class="blog__sidebar__item__tags">
                                 <a href="#" class="blog__sidebar__item__tags">중복체크</a>
                                 </div>
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호</p>
                                <input type="text">
                            </div>
                            </div>
                            <div class="col-lg-5">
                            	<div class="checkout__input">
                                <p>우편번호</p>
                                <input type="text">
                            </div>
                            </div>
                             <div class="checkout__input">
                                <p>주소</p>
                                <input type="text" disabled>
                            </div>
                             <div class="checkout__input">
                                <p>상세주소</p>
                                <input type="text">
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="acc">주소 입력 안하기<input type="checkbox" id="acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="checkout__input">
                                <p>전화번호</p>
                                <input type="text">
                            </div>
                            <button type="submit" class="site-btn">회원가입하기</button>
                        </div>
                        <div class="col-lg-4 col-md-6">
                        
                    </div>
                </form>
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