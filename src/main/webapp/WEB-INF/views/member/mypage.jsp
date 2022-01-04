<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My-Page</title>
<link rel="stylesheet" href="../resources/css/mypage.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	if(${loginWay == 1 }){
		var condition = "Kakao 계정으로 로그인 중 입니다.";
		document.getElementById('condition').innerText = condition;
		document.getElementById('condition-right').innerText = condition;
	}else{
		var condition = "일반 계정으로 로그인 중 입니다";
		document.getElementById('condition').innerText = condition;
		document.getElementById('condition-right').innerText = condition;
	}
	/* console.log(condition, id, addr); */
})

</script>

<script>
function previous() {
	window.history.back();
}
</script>

<script>
function modify() {
	var url = "${contextPath }/root/member/modify";
	var option = "width=500,height=400,top=200,left=700,scrollbars=no,location=no,toolbars=no,status=no"
	console.log(url);
	window.open(url,"new",option);
}
</script>

<script type="text/javascript">
function bookingCancel(lockerId){
	var form = {cancelId : lockerId}
	
	var confirmValue = confirm(lockerId.toUpperCase() + ' : 정말 취소하시겠습니까?')
	
	if(confirmValue == true){
		$.ajax({
			url : "ajax_bookingCancel",
			type : "POST",
			data : JSON.stringify(form),
			dataType: "text",
			contentType: 'application/json',
			success:function(result){
				alert(lockerId.toUpperCase() + ' : 예약이 취소되었습니다')
				location.reload();
			}
		})
	}
	
}
</script>

</head>

<body>
	<div>
		<img title="돌아가기" class="previous" src="../resources/images/previous.png" onclick="previous()">
	</div>
	<div class="center">
		<div class="left">
			<img class="user" src="../resources/images/user.png">
			<div class="left-container">
				<c:choose>
					<c:when test="${loginWay == 1 }">
						<span id="id">Kakao회원</span>
					</c:when>
					<c:otherwise>
						<span id="id">${info.id }</span>
					</c:otherwise>
				</c:choose>
				<span id="condition"></span>
			</div>
			<img class="edit" src="../resources/images/edit.png" 
				onclick="modify()" title="내 정보 수정">
			<!-- <button onclick="location.href='modify'">회원정보 수정</button> -->
		</div>
  		<div class="right">
  			<div class="title">
  				<h1>Information</h1>
  			</div>
  			<div class="info">
  				<div class="id info-child">
  					<h3>User ID</h3>
  					<h4 id="id-right">${info.id }</h4>
  				</div>
  				<div class="condition info-child">
  					<h3>로그인 상태</h3>
  					<h4 id="condition-right"></h4>
  				</div>
  			</div>
  			
  			<div class="info">
  				<c:choose>
  					<c:when test="${loginWay == 1 }">
  						<div class="addr info-child">
  							<h3>Address</h3>
  							<h4 class="addr">${info.addr }</h4>
  						</div>
  						<div class="email info-child">
  							<h3>E-Mail</h3>
  							<h4 class="email">${info.email }</h4>
  						</div>
  					</c:when>
  					<c:otherwise>
  						<div class="addr info-child">
  							<h3>Address</h3>
  							<h4 class="addr">${info.addr }</h4>
  						</div>
  						<div class="email info-child">
  							<div>
  								<h3>E-Mail</h3>
  							</div>
  							<h4 class="email">카카오 로그인 전용</h4>
  						</div>
  					</c:otherwise>
  				</c:choose>
  			</div>
  			<div class="info">
  				<div class=" info-child">
  					<h3>예약현황(취소)</h3>
  					<h4>
  					<table>
  						<c:choose>
  							<c:when test="${empty mypage_booking }">
  								예약없음
  							</c:when>
  							<c:otherwise>
  								<c:forEach items="${mypage_booking }" var="booking">
  				
  									<tr>
  										<td>${fn:toUpperCase(booking.lockerId) } / ${booking.sDate }</td>
  										<td><input type="button" value="예약취소" name="cancel" onclick="bookingCancel('${booking.lockerId}')"></td>
  									</tr>
  									
  								</c:forEach>
  							</c:otherwise>
  						</c:choose>
  						</table>
  					</h4>
  				</div>
  			</div>
  		</div>
  </div>
</body>
</html>