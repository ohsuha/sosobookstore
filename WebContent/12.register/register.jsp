<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="../bs/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../bs/js/member.js"></script>
<!DOCTYPE html>
<html lang="zxx">
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
		$('#regi').click(function(){
			if($('#name').val().length<1){
				alert('이름을 입력하세요');
				$('#name').focus();
				event.preventDefault();
				return false;
			}else if($('#userid').val().length<1){
				alert('아이디를 입력하세요');
				$('#userid').focus();
				event.preventDefault();
				return false;
			}else if(!validate_userid($('#userid').val())){
				alert('아이디는 영문,숫자,_만 가능합니다.');
				$('#userid').focus();
				event.preventDefault();
				return false;
			}else if($('#password').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#password').focus();
				event.preventDefault();
				return false;
			}else if($('#password').val()!=$('#passwordcheck').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#passwordcheck').focus();
				event.preventDefault();
				return false;
			}else if($('#hp').val().length<1){
				alert('전화번호는 필수입니다. 입력해 주세요');
				$('#hp').focus();
				event.preventDefault();
				return false;
			}else if(!validate_phone($('#hp').val())){
				alert('전화번호는 숫자만 가능합니다.');
				$('#hp').focus();
				event.preventDefault();
				return false;
			}else if($('#chkId').val() !='Y'){
				alert('아이디 중복확인하세요');
				$('#btnChkId').focus();
				event.preventDefault();
				return false;
			}
		});
});
</script>

<body>
<%
request.setCharacterEncoding("utf-8");

String userid=request.getParameter("userid");

if(userid==null){
	userid="";
}
%>

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
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                        	<form name="form2" method="post" action="register_ok.jsp">
                           		<div class="col-lg-8">
                            	<div class="checkout__input">
                                 <p>이름</p>
                                 <input type="text" name="name" id="name" style="ime-mode:active" value="<%=userid%>">
                             </div>
                            <div class="checkout__input">
                                 <p>아이디</p>
                                <input type="text" placeholder="중복체크를 해주세요" style="ime-mode:inactive" name="userid" id="userid">&nbsp;
                                <input type="button" value="중복확인" id="btnChkId" title="새창열림">
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호</p>
                                <input type="password" name="password" id="password">
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호확인</p>
                                <input type="password" name="passwordcheck" id="passwordcheck">
                            </div>
                            </div>
                            <div class="col-lg-5">
                            	<div class="checkout__input">
                                <p>우편번호</p>
                                <input type="text" name="zipcode" id="zipcode">&nbsp;
                                <input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림"><br />
                            </div>
                            </div>
                             <div class="checkout__input">
                                <p>주소</p>
                                <input type="text" name="add1" id="add1" readonly>
                                <p>상세주소</p>
                                <input type="text" name="add2" id="add2">
                            </div>
                            <div class="checkout__input">
                                <p>전화번호(-없이 입력)</p>
                                <input type="text" name="hp" id="hp">
                            </div>
                            <button type="submit" class="site-btn" id="regi" name="id">회원가입하기</button>
                            </form>
                        </div>
                        <div class="col-lg-4 col-md-6">
                    	</div>
	            </div>
            </div>
        </div>
    </section>
     <input type ="text" name="chkId" id="chkId">
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