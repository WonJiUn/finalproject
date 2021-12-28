<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/booking.css">

</head>
<body>
	<div class="nav_bar">
		<c:import url="../default/header.jsp"></c:import>
	</div>
	<%-- <h1>${loginUser }님 환영합니다</h1> --%>

	<div class="popup">
		<div id="sizePopup">
			<div class="p-content">
				<input class="p-input" type="text"> 
				<input class="p-button" type="button" value="button">
			</div>

			<a class="close" onclick="sizePopupToggle()">
				<img src="../resources/css/cancel.png">
			</a>
		</div>

		<div id="stationPopup">
			<div class="p-content">
				<input class="p-input" type="text"> 
				<input class="p-button" type="button" value="button">
			</div>

			<a class="close" onclick="stationPopupToggle()">
				<img src="../resources/css/cancel.png">
			</a>
		</div>
		
		<div id="datePopup">
			<div class="p-content">
				<input class="p-input" type="text"> 
				<input class="p-button" type="button" value="button">
			</div>

			<a class="close" onclick="datePopupToggle()">
				<img src="../resources/css/cancel.png">
			</a>
		</div>
		
		<div id="timePopup">
			<div class="p-content">
				<input class="p-input" type="text"> 
				<input class="p-button" type="button" value="button">
			</div>

			<a class="close" onclick="timePopupToggle()">
				<img src="../resources/css/cancel.png">
			</a>
		</div>
		
		<div id="confPopup">
			<div class="p-content">
				<input class="p-input" type="text"> 
				<input class="p-button" type="button" value="button">
			</div>

			<a class="close" onclick="confPopupToggle()">
				<img src="../resources/css/cancel.png">
			</a>
		</div>
		
	</div>

	<div class="navigation">
		<ul>
			<li class="list active">
				<a class="size-btn" onclick="sizePopupToggle()" style="cursor: pointer;"> 
					<span class="icon"> 
						<ion-icon name="expand-outline"></ion-icon>
					</span> 
					<span class="text">사이즈</span>
				</a>
			</li>
			
			<li class="list">
				<a class="station-btn" onclick="stationPopupToggle()" style="cursor: pointer;"> 
					<span class="icon"> 
						<ion-icon name="earth-outline"></ion-icon>
					</span> 
					<span class="text">장소</span>
				</a>
			</li>
			
			<li class="list">
				<a class="date-btn" onclick="datePopupToggle()" style="cursor: pointer;">
					<span class="icon"> 
						<ion-icon name="calendar-outline"></ion-icon>
					</span> 
					<span class="text">날짜</span>
				</a>
			</li>
			
			<li class="list">
				<a class="time-btn" onclick="timePopupToggle()" style="cursor: pointer;"> 
					<span class="icon"> 
						<ion-icon name="time-outline"></ion-icon>
					</span> 
					<span class="text">시간</span>
				</a>
			</li>
			
			<li class="list">
				<a class="conf-btn" onclick="confPopupToggle()" style="cursor: pointer;"> 
					<span class="icon"> 
						<ion-icon name="checkmark-outline"></ion-icon>
					</span> 
					<span class="text">예약하기</span>
				</a>
			</li>
			
			<div class="indicator"></div>
		</ul>
	</div>

	<!-- 네비게이션 함수 -->
	<script>
		const list = document.querySelectorAll('.list');
		function activeLink() {
			list.forEach((item) =>
			item.classList.remove('active'));
			this.classList.add('active');
		}
		list.forEach((item) =>
		item.addEventListener('click', activeLink));
	</script>

	<!-- 모달 함수 -->
	<script>
		function sizePopupToggle() {
			const popup = document.getElementById('sizePopup');
			popup.classList.toggle('active')
		}
		function stationPopupToggle() {
			const popup = document.getElementById('stationPopup');
			popup.classList.toggle('active')
		}
		function datePopupToggle() {
			const popup = document.getElementById('datePopup');
			popup.classList.toggle('active')
		}
		function timePopupToggle() {
			const popup = document.getElementById('timePopup');
			popup.classList.toggle('active')
		}
		function confPopupToggle() {
			const popup = document.getElementById('confPopup');
			popup.classList.toggle('active')
		}
	</script>

	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
</html>
