<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath }/resources/css/admin.css">
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

<div class="header" style="margin-bottom: 20px;">
  <c:import url="../default/header.jsp"/>
</div>

<div class="wrap content">
<h1 class="nav" style="margin-left:750px; margin-bottom: 10px;">[ FAQ ]</h1>
<div id="faq">자주 묻는 질문<hr style="margin-top:10px; "></div>

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
		예약 취소는 아래와 같이 이루어집니다.서비스 이용 1시간 전까지 홈페이지를 통해 예약 취소가 가능하며,<br>
		그 이후엔 유선 1234-5678을 통해 안내를 도와드리겠습니다.
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
		월 ~ 토요일 오전 8시 ~ 오후 8시 까지 이며, 일요일 / 공휴일은 영업을 하지 않습니다. <br>
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
	<div class="answer1">당일예약 및 보관 서비스만을 지원하고 있으며, 장기보관 신청시 별도의 장소에 보관됩니다. 보관 비용은 다음과 같습니다.</div>
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
	<div class="question">유실물은 어떨게 되나요</div>
</div>

<div class="qt5" id="ans" style="display: none;">
<div class="aPlusAnswer1">
	<div class="a">A.&nbsp;<br></div>
	<div class="answer1">유실물은 다음과 같이 보관됩니다.</div>
</div>
	<div class="answer2">
		회수를 잊으신 단기예약 물품의 경우 보관함 대여일로 부터 5일간 보관함에 과금 및 보관이 되며,<br>
		그이후엔 별도의 보관 장소에 한달간 보관후 폐기처리 되며, 보관비용은 일마다 추가로 부과 됩니다.<br>
		당사는 고객님의 과실로 인한 물품 폐기건에 대하여 책임지지 않습니다.<br>
		
	</div>
</div>

<hr style="margin-top:10px">	


<div class="qt" id="qt6" onclick="slide_down(this.id)">
	<div class="q">Q.&nbsp;<br></div>
	<div class="question">보관금지 물품이 궁금합니다</div>
</div>

<div class="qt6" id="ans" style="display: none;">
<div class="aPlusAnswer1">
	<div class="a">A.&nbsp;<br></div>
	<div class="answer1">보관금지 물품은 다음과 같습니다.</div>
</div>
	<div class="answer2">
		- 귀중품 보관 금지(금, 현금, 보석 등)<br>
		- 식품 보관 금지(보관 시 폐기처리)<br>
		- 동,식물, 총기, 마약 등 보관금지<br>
		- 당사는 고객님 과실로 인한 물품 폐기건에 대하여 책임지지 않습니다.
	</div>
</div>

<hr style="margin-top:10px">	



<div class="qt" id="qt7" onclick="slide_down(this.id)">
	<div class="q">Q.&nbsp;<br></div>
	<div class="question">보관물품을 배송해주는 입출고 서비스도 있나요?</div>
</div>

<div class="qt7" id="ans" style="display: none;">
<div class="aPlusAnswer1">
	<div class="a">A.&nbsp;<br></div>
	<div class="answer1">배송및 입출고 서비스는 다음과 같습니다.</div>
</div>
	<div class="answer2">
		저희는 셀프스토리지 서비스이기 때문에 고객님께서 직접 보관물품을 입출고 해주셔야 합니다.

	</div>
</div>

<hr style="margin-top:10px">	



<div class="qt" id="qt8" onclick="slide_down(this.id)">
	<div class="q">Q.&nbsp;<br></div>
	<div class="question">할인혜택이 궁금합니다.</div>
</div>

<div class="qt8" id="ans" style="display: none;">
<div class="aPlusAnswer1">
	<div class="a">A.&nbsp;<br></div>
	<div class="answer1">다양한 할인혜택은 다음과 같습니다.</div>
</div>
	<div class="answer2">
		다양한 할인혜택의 경우 메인홈페이지에 팝업으로 상시 공지해 드리고 있습니다.
	</div>
</div>

<hr style="margin-top:10px">	





	
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>