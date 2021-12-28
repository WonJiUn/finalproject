<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="resources/css/home.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 자동 스크롤 -->
<script>

	jQuery(document).ready(function($) {

		$(".scroll").click(function(event){            

		event.preventDefault();

		$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);

		});

	});
	
</script>



	<title>Home</title>
</head>
<body>
<%-- <h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P> --%>
<div class="home">
	<div class="nav_bar">
		<c:import url="default/header.jsp"></c:import>
	</div>
	<div class="main">
		<div class="logo">
			<img class="logo_img" src="resources/images/logo999.png">
<!-- 			<h2>LIGHT</h2>
			<h2>TRIP</h2> -->
		</div>
		<h1 class="massage">To Travel<br>
		Is<br>
		To Live</h1>
		<a href="member/index"><input class="go" type="button" value="GO"></a>
		<div class="show">
			<a class="scroll" href="#cont1">
				<img class="down" src="resources/images/down-arrow.png">
			</a>
		</div>
	</div>
</div>

<div class="container" id="container">
	<div class="cont1 cont0" id="cont1">
	<div class="title">
		<div class="nav">
			<h1>Light Trip이란?</h1>
			<div class="nav_div">
				<a class="scroll" href="#cont1">서비스 소개</a>
				<a class="scroll" href="#cont2">간편 이용방법</a>
				<a class="scroll" href="#cont3">요금 소개</a>
			</div>
		</div>
		<hr>
		<div class="title_txt">
			<h2>도심형 개인 락커 서비스</h2>
			<p>잠시 짐을 맡겨야 할 때,<br>
				여행 중 무거운 짐이 있을 때,<br>
				언제든 가까운 곳에 Light Trip이 있습니다.
			</p>
		</div>
	</div>
	<div class="expln">
		<div class="ex1 exp">
			<div class="exp_img">
				<img alt="booking" src="resources/images/booking.png">
			</div>
			<div class="exp_cont">
				<h3>예약하고.</h3><br>
				<p>여행날짜와 장소를 정한 후<br>예약해주세요</p>
			</div>
		</div>
		<div class="ex2 exp">
			<div class="exp_img">
				<img alt="travelbag" src="resources/images/travelbag.png">
			</div>
			<div class="exp_cont">
				<h3>맡기고.</h3><br>
				<p>예약일정에 맞추어<br>짐을 맡겨주세요</p>
			</div>
		</div>
		<div class="ex3 exp">
			<div class="exp_img">
				<img alt="beach" src="resources/images/beach.png">
			</div>
			<div class="exp_cont">
				<h3>즐기고!</h3><br>
				<p>짐에 대한 걱정과 부담없이<br>여행을 즐기세요</p>
			</div>
		</div>
	</div>
	</div>
	
	<div class="cont2 cont0" id="cont2">
	<div class="title">
		<div class="nav">
			<h1>간편 이용방법</h1>
			<div class="nav_div">
				<a class="scroll" href="#cont1">서비스 소개</a>
				<a class="scroll" href="#cont2">간편 이용방법</a>
				<a class="scroll" href="#cont3">요금 소개</a>
			</div>
		</div>
		<hr>
		<div class="title_txt">
			<h2>예약 및 이용</h2>
			<p>로그인 > 체크인 > 체크아웃 시스템으로<br>
				누구나 간편하고 쉽게 이용이 가능합니다.<br>
				언제든 가까운 곳에 Light Trip이 있습니다.
			</p>
		</div>
	</div>
	<div class="expln">
		<div class="ex1 exp">
			<div class="exp_img">
				<img alt="booking" src="resources/images/login.png">
			</div>
			<div class="exp_cont">
				<h3>LOG-IN</h3><br>
				<p>간단한 정보를 입력하고<br>회원가입을 해주세요</p>
			</div>
		</div>
		<div class="ex2 exp">
			<div class="exp_img">
				<img alt="travelbag" src="resources/images/import.png">
			</div>
			<div class="exp_cont">
				<h3>CHECK-IN</h3><br>
				<p>원하는 날짜, 장소, 시간에 맞춰<br>짐을 맡겨주세요</p>
			</div>
		</div>
		<div class="ex3 exp">
			<div class="exp_img">
				<img alt="beach" src="resources/images/export.png">
			</div>
			<div class="exp_cont">
				<h3>CHECK-OUT</h3><br>
				<p>체크아웃 시간에 돌아와<br>짐을 찾아가세요</p>
			</div>
		</div>
	</div>
	<p class="FAQ">*자세한 내용은 <a href="board/FAQ">FAQ게시판</a>에서 확인하실 수 있습니다</p>
	</div>
	
	<div class="cont3 cont0" id="cont3">
	<div class="title">
		<div class="nav">
			<h1>요금 소개</h1>
			<div class="nav_div">
				<a class="scroll" href="#cont1">서비스 소개</a>
				<a class="scroll" href="#cont2">간편 이용방법</a>
				<a class="scroll" href="#cont3">요금 소개</a>
			</div>
		</div>
		<hr>
		<div class="title_txt">
		</div>
	</div>
	<div class="expln price">
		<div class="ex1 exp">
			<div class="exp_img">
				<img alt="booking" src="resources/images/box.png">
			</div>
			<div class="exp_cont">
				<h1>Small</h1><br><h3>50x30x60(cm)</h3><br><h6>가로x세로x깊이(cm)</h6><br>
			</div>
			<div class="exp_price">
				<table>
					<tr><td>4H(기본)</td><td>1일</td><td>1개월</td></tr>
					<tr><td colspan="3"><hr></td></tr>
					<tr><td>2,000</td><td>8,000</td><td>50,000</td></tr>
				</table>
			</div>
		</div>
		<div class="ex2 exp">
			<div class="exp_img">
				<img alt="travelbag" src="resources/images/cart.png">
			</div>
			<div class="exp_cont">
				<h1>Medium</h1><br><h3>50x45x60(cm)</h3><br><h6>가로x세로x깊이(cm)</h6><br>
			</div>
			<div class="exp_price">
				<table>
					<tr><td>4H(기본)</td><td>1일</td><td>1개월</td></tr>
					<tr><td colspan="3"><hr></td></tr>
					<tr><td>3,000</td><td>12,400</td><td>80,000</td></tr>
				</table>
			</div>
		</div>
		<div class="ex3 exp">
			<div class="exp_img">
				<img alt="beach" src="resources/images/forklift.png">
			</div>
			<div class="exp_cont">
				<h1>Large</h1><br><h3>50x90x60(cm)</h3><br><h6>가로x세로x깊이(cm)</h6><br>
			</div>
			<div class="exp_price">
				<table>
					<tr><td>4H(기본)</td><td>1일</td><td>1개월</td></tr>
					<tr><td colspan="3"><hr></td></tr>
					<tr><td>4,000</td><td>16,000</td><td>100,000</td></tr>
				</table>
			</div>
		</div>
	</div>
		<p class="FAQ">*자세한 내용은 <a href="board/FAQ">FAQ게시판</a>에서 확인하실 수 있습니다</p>
	</div>
</div>
<div class="gobk" onclick="location.href='member/index';">
	<h2>예약하기</h2>
</div>
<c:import url="default/footer.jsp"></c:import>
</body>
</html>
