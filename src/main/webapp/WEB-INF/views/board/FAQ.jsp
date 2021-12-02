<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#faq{font-size: 25pt; font: bold; padding: 0 0 20px 0 }
	.qt{display: flex; align-items:center; padding: 0 0 20px 0; cursor:pointer}
	.q{font-size: 20pt; font-weight: bold; color: #DBC000}
	.a{font-size: 17pt;font-weight: bold; color: #993800}
	.aPlusAnswer1{display: flex; align-items:center; padding: 0 0 20px 0;}
	#ans{background-color: #EAEAEA; padding: 10px}
	.qt:hover{color: #DBC000}
</style>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script type="text/javascript">
	function slide_down(clicked_id) {
		var ansClass = clicked_id
		if($("."+ansClass).is(":visible")){
			$("."+ansClass).slideUp("slow");
		}else{
			$("."+ansClass).slideDown("slow");
		}
		
	}

</script>
</head>
<body>

<c:import url="../default/header.jsp"/>
<div class="wrap content">

<div id="faq">FAQ<hr style="margin-top:10px"></div>

<hr style="margin:10px 0; border:solid 1px black;">
<div class="qt" id="qt1" onclick="slide_down(this.id)">
	<div class="q">Q.&nbsp;<br></div>
	<div class="question">예약을 취소/환불 받고 싶어요.</div>
</div>

<div class="qt1" id="ans" style="display: none;">
<div class="aPlusAnswer1">
	<div class="a">A.&nbsp;<br></div>
	<div class="answer1">여행 일정에 차질이 발생하셨나요?</div>
</div>
	<div class="answer2">
		예약 취소/환불은 아래와 같이 이루어집니다.<br>
		1. 홈페이지 예약: 서비스 이용 전날 21시 전까지 예약을 취소한 경우, 결제 금액의 90%를 환불받으실 수 있습니다.<br>
		서비스 이용 전날 21시 이후에는 취소는 가능하지만 환불은 불가합니다.<br>
		2. 매장 현장접수: 영수증을 지참하신 경우 취소/환불이 가능합니다. 단, 고객님의 수화물 운송이 시작되면 취소/환불이 불가합니다.
	</div>
</div>

<hr style="margin-top:10px">	
	
<div class="qt" id="qt2" onclick="slide_down(this.id)">
	<div class="q">Q.&nbsp;<br></div>
	<div class="question">예약을 변경하고 싶어요</div>
</div>

<div class="qt2" id="ans" style="display: none;">
<div class="aPlusAnswer1">
	<div class="a">A.&nbsp;<br></div>
	<div class="answer1">일정이 변경되셨나요?</div>
</div>
	<div class="answer2">
		 오기재하셨거나 이용일자에 변동이 있으신 경우 1234-5678로 문의주시면 예약 내용 수정을 도와드리겠습니다. 
	</div>
</div>

<hr style="margin-top:10px">	

<div class="qt" id="qt3" onclick="slide_down(this.id)">
	<div class="q">Q.&nbsp;<br></div>
	<div class="question">영업시간이 궁금합니다</div>
</div>

<div class="qt3" id="ans" style="display: none;">
<div class="aPlusAnswer1">
	<div class="a">A.&nbsp;<br></div>
	<div class="answer1">영업시간은 다음과 같습니다.</div>
</div>
	<div class="answer2">
		월 ~ 토요일 오전 9시 ~ 오후 7시 까지 이며, 일요일 / 공휴일은 영업을 하지 않습니다. <br>
		유선통화 는 월~금요일 오전 9시 반 ~ 오후 6시 (휴무일 : 토/일/공휴일) – 토요일의 경우 예약된 고객에 한해 서비스가 진행됩니다.
	</div>
</div>

<hr style="margin-top:10px">	

<div class="qt" id="qt4" onclick="slide_down(this.id)">
	<div class="q">Q.&nbsp;<br></div>
	<div class="question">보관 비용이 궁금합니다</div>
</div>

<div class="qt4" id="ans" style="display: none;">
<div class="aPlusAnswer1">
	<div class="a">A.&nbsp;<br></div>
	<div class="answer1">5일 이상 보관은 금지되며, 장기보관 신청시 별도의 장소에 보관됩니다. 보관 비용은 다음과 같습니다.</div>
</div>
	<div class="answer2">
		<table border="1">
			<tr>
				<th>사이즈</th>
				<th>기본 4시간</th>
				<th>추가 4~12시간(1시간당 과금)</th>
				<th>추가 12시간(12시간당 과금)</th>
				<th>1일</th>
				<th>장기보관(1개월)</th>
			</tr>
			<tr>
				<th>S</th>
				<th>2000원</th>
				<th>1시간당 500원 과금</th>
				<th>+2000</th>
				<th>8000원</th>
				<th>50000원</th>
			</tr>
			<tr>
				<th>M</th>
				<th>3000원</th>
				<th>1시간당 800원 과금</th>
				<th>+3000</th>
				<th>12400원</th>
				<th>80000원</th>
			</tr>
			<tr>
				<th>L</th>
				<th>4000원</th>
				<th>1시간당 1000원 과금</th>
				<th>+4000</th>
				<th>16000원</th>
				<th>100000원</th>
			</tr>
		</table>
	</div>
</div>

<hr style="margin-top:10px">	

<div class="qt" id="qt5" onclick="slide_down(this.id)">
	<div class="q">Q.&nbsp;<br></div>
	<div class="question">보관금지 물품이 궁금합니다</div>
</div>

<div class="qt5" id="ans" style="display: none;">
<div class="aPlusAnswer1">
	<div class="a">A.&nbsp;<br></div>
	<div class="answer1">보관금지 물품은 다음과 같습니다.</div>
</div>
	<div class="answer2">
		- 귀중품 보관 금지(금, 현금, 보석 등)<br>
		- 식품 보관 금지(보관 시 폐기처리)<br>
		- 동,식물, 총기, 마약 등 보관금지
	</div>
</div>

<hr style="margin-top:10px">	




	
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>