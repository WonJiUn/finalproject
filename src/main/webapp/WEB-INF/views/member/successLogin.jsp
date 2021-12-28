<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/booking.css">
<link rel="stylesheet" href="../resources/css/location.css">

<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script type="text/javascript">
	/* function init() {
		document.getElementById('station-btn').click();
	} */
	
	function station(){
		var selectedStation = $("select[name=station]").val()
		document.getElementById('stationResult').innerText = selectedStation;
		document.getElementById('stationResult2').innerText = selectedStation;
		document.getElementById('station-btn').click();
		document.getElementById('date-btn').click();
	}
	
	function date(){
		/* var selectedDate = $("#year, #month, #day, #days").text(); */
		var year = $("#year").text();
		var month = $("#month").text();
		var day = $("#day").text();
		var days = $("#days").text();
		
		var selectedDate = year + "-" + month + "-" + day + "-" + days;
		console.log(selectedDate)
		document.getElementById('dateResult2').innerText = selectedDate;
		document.getElementById('date-btn').click();
		document.getElementById('time-btn').click();
	}
	
	function time(){
		var selectedTime = $("select[name=hour]").val()
		document.getElementById('timeResult').innerText = selectedTime;
		document.getElementById('timeResult2').innerText = selectedTime;
		document.getElementById('time-btn').click();
		document.getElementById('size-btn').click();
	}
	
	function size(){
		var selectedSize = $("#sel-locker").text();
		/* document.getElementById('sizeResult').innerText = checkedSize; */
		document.getElementById('sizeResult2').innerText = selectedSize;
		document.getElementById('size-btn').click();
		document.getElementById('conf-btn').click();
	}	
</script>

<!-- 사물함 선택 -->
<script>
function test(statusItem) {
	console.log(statusItem);
	var locker = $(statusItem).text();
	console.log(locker);
	var colors=["#a2d8ff","#ffc800"];
	
	/* 락커 색 바꾸기(시작) */
	var lockers = document.querySelectorAll(".loc");
	console.log(lockers);
	
	for(i=0; i<lockers.length; i++){
		lockers[i].classList.remove("color1");
		lockers[i].style.backgroundColor=colors[0];
		lockers[i].classList.add("color0");
	}
	statusItem.classList.remove("color0");
	statusItem.classList.add("color1");
	
	document.querySelector('.color1').style.backgroundColor=colors[1];
	/* 락커 색 바꾸기(끝) */
	
	document.getElementById('sel-locker').innerText = locker;
}
</script>

</head>
<body onload="init()">
	<div class="nav_bar">
		<c:import url="../default/header.jsp"></c:import>
	</div>
	<%-- <h1>${loginUser }님 환영합니다</h1> --%>

	<div class="popup">

		<div id="stationPopup">
 
			<div class="p-content">
				<div class="container">
    				<h1>LOCATION</h1>
    				<div class="album">
      					<div class="images">
        					<img src="../resources/images/image1.jpeg">
        					<img src="../resources/images/image2.jpeg">
        					<img src="../resources/images/image3.jpeg">
        					<img src="../resources/images/image4.jpeg">
        					<img src="../resources/images/image5.jpeg">
      					</div>
    				</div>
    				<button class="prev">PREV</button>
    				<button class="next">NEXT</button>  
  				</div>
  				<script src="../resources/js/script.js"></script>
				[ 장소 선택 ]<br>
			<select name="station">
				<option value="undefined">=== 선택 ===</option>
				<option value="시청역 1호선점">시청역 1호선점</option>
				<option value="을지로입구역 2호선점">을지로입구역 2호선점</option>
				<option value="서울역 1호선점">서울역 1호선점</option>
				<option value="광화문역 5호선점">광화문역 5호선점</option>
				<option value="종로3가 3호선점">종로3가 3호선점</option>	
			</select>
			
			<button onclick="station();">선택하기</button><br>
			선택된 값 : <span id="stationResult"></span>
			</div>

			<a class="close" onclick="stationPopupToggle()">
				<img src="../resources/css/cancel.png">
			</a>
		</div>
		
		<div id="datePopup">
			<div class="p-content">
				<div class="c-title"><h3>날짜확인</h3>&nbsp;<h4>(당일 예약만 가능)</h4></div>
				<div class="calendars">
					<div class="calendar yesterday">
						<div class="year0"></div>
						<div class="month0"></div>
						<div class="day0"></div>
						<div class="days0"></div>
					</div>
					<div class="calendar today">
						<div class="year" id="year"></div>
						<div class="month" id="month"></div>
						<div class="day" id="day"></div>
						<div class="days" id="days"></div>
					</div>
					<div class="calendar tomorrow">
						<div class="year2"></div>
						<div class="month2"></div>
						<div class="day2"></div>
						<div class="days2"></div>
					</div>
				</div>
				<div class="c-select">
					<button onclick="date();">선택하기</button>
				</div>
			</div>
			
			<a class="close" onclick="datePopupToggle()">
				<img src="../resources/css/cancel.png">
			</a>
		</div>
		
		<div id="timePopup">
			<div class="p-content">
			[ 시간 선택 ]<br>
			<select name="hour">
				<option value="undefined">=== 선택 ===</option>
				<option value="1시">1시</option>
				<option value="3시">3시</option>
				<option value="5시">5시</option>
				<option value="7시">7시</option>
				
			</select>
			
			<button onclick="time();">선택하기</button><br>
			선택된 값 : <span id="timeResult"></span>
			</div>
			
			<a class="close" onclick="timePopupToggle()">
				<img src="../resources/css/cancel.png">
			</a>
			
		</div>
		
		<div id="sizePopup">
			<div class="p-content">
				<div class="c-title"><h3>사이즈 선택</h3>&nbsp;<h4>(1개만 가능)</h4></div>
				<div class="lockers">
					<div>
						<table width="600">
							<tr height="50">
								<td class="loc ls01" id="S01" onclick="test(this)">S01</td> 
								<td class="loc ls02" id="S02" onclick="test(this)">S02</td> 
								<td class="loc ls03" id="S03" onclick="test(this)">S03</td> 
								<td class="loc ls04" id="S04" onclick="test(this)">S04</td> 
								<td class="loc ls05" id="S05" onclick="test(this)">S05</td>
							</tr>
							<tr height="50">
								<td class="loc ls06" id="S06" onclick="test(this)">S06</td> 
								<td class="loc ls07" id="S07" onclick="test(this)">S07</td> 
								<td class="loc ls08" id="S08" onclick="test(this)">S08</td> 
								<td class="loc ls09" id="S09" onclick="test(this)">S09</td> 
								<td class="loc ls10" id="S10" onclick="test(this)">S10</td>
							</tr>
							<tr height="70">
								<td class="loc lm01" id="M01" onclick="test(this)">M01</td> 
								<td class="Kiosk" id="Kiosk" rowspan="2">Kiosk</td> 
								<td class="loc lm02" id="M02" onclick="test(this)">M02</td> 
								<td class="loc lm03" id="M03" onclick="test(this)">M03</td> 
								<td class="loc lm04" id="M04" onclick="test(this)">M04</td>
							</tr>
							<tr height="70">
								<td class="loc ll01" id="L01" rowspan="2" onclick="test(this)">L01</td> 
								<td class="loc ll02" id="L02" rowspan="2" onclick="test(this)">L02</td> 
								<td class="loc lm05" id="M05" onclick="test(this)">M05</td> 
								<td class="loc ll03" id="L03" rowspan="2" onclick="test(this)">L03</td>
							</tr>
							<tr height="70">
								<td class="loc lm06" id="M06" onclick="test(this)">M06</td> 
								<td class="loc lm07" id="M07" onclick="test(this)">M07</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="selected">
					<!-- <input type="radio" name="size" value='S'>&nbsp;&nbsp;S
					<input type="radio" name="size" value="M">&nbsp;&nbsp;M
					<input type="radio" name="size" value="L">&nbsp;&nbsp;L
					<button onclick="size();">선택하기</button>
					선택된 값 : <span id="sizeResult"></span> -->
					<h3>선택된 사물함 : </h3><h3 id="sel-locker"></h3>
					<button onclick="size();">선택하기</button>
				</div>
			</div>
			
				
			<a class="close" onclick="sizePopupToggle()">
				<img src="../resources/css/cancel.png">
			</a>
		</div>
		
		<div id="confPopup">
			<div class="p-content">
				장소 : <span id="stationResult2"></span><br>
				날짜 : <span id="dateResult2"></span><br>
				시간 : <span id="timeResult2"></span><br>
				사이즈 : <span id="sizeResult2"></span><br>
				<input class="p-button" type="button" value="보관함 조회하기">
				<div class="dbSearchResult">
					DB검색결과 : 
				</div>
			</div>
			
			<a class="close" onclick="confPopupToggle()">
				<img src="../resources/css/cancel.png">
			</a>
		</div>
		
	</div>

	<div class="navigation">
		<ul>
			<li class="list active">
				<a id="station-btn" class="station-btn" onclick="stationPopupToggle()" style="cursor: pointer;"> 
					<span class="icon">
						<ion-icon name="earth-outline"></ion-icon>
					</span> 
					<span class="text">장소</span>
				</a>
			</li>
			
			<li class="list">
				<a id="date-btn" class="date-btn" onclick="datePopupToggle()" style="cursor: pointer;">
					<span class="icon">
						<ion-icon name="calendar-outline"></ion-icon>
					</span> 
					<span class="text">날짜</span>
				</a>
			</li>
			
			<li class="list">
				<a id="time-btn" class="time-btn" onclick="timePopupToggle()" style="cursor: pointer;"> 
					<span class="icon"> 
						<ion-icon name="time-outline"></ion-icon>
					</span> 
					<span class="text">시간</span>
				</a>
			</li>
			
			<li class="list">
				<a id="size-btn" class="size-btn" onclick="sizePopupToggle()" style="cursor: pointer;"> 
					<span class="icon"> 
						<ion-icon name="expand-outline"></ion-icon>
					</span> 
					<span class="text">사이즈</span>
				</a>
			</li>
			
			<li class="list">
				<a id="conf-btn" class="conf-btn" onclick="confPopupToggle()" style="cursor: pointer;" > 
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
		function sizePopupToggle() {
			const popup = document.getElementById('sizePopup');
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
		
	<!-- calendar -->
<script>
	var day = new Date();
	var month = ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"];
	var days = ["SUN(일)", "MON(월)", "TUE(화)", "WED(수)", "THU(목)", "FRI(금)", "SAT(토)"];
	
	console.log(day);
	document.querySelector(".year").innerHTML=day.getFullYear();
	document.querySelector(".month").innerHTML=month[day.getMonth()];
	document.querySelector(".day").innerHTML=day.getDate();
	document.querySelector(".days").innerHTML=days[day.getDay()];
	
	var dayY = new Date(day.setDate(day.getDate()-1));
	console.log(dayY);
	document.querySelector(".year0").innerHTML=day.getFullYear();
	document.querySelector(".month0").innerHTML=month[day.getMonth()];
	document.querySelector(".day0").innerHTML=day.getDate();
	document.querySelector(".days0").innerHTML=days[day.getDay()];

	var dayT = new Date(day.setDate(day.getDate()+2));
	console.log(dayT);
	
	document.querySelector(".year2").innerHTML=day.getFullYear();
	document.querySelector(".month2").innerHTML=month[day.getMonth()];
	document.querySelector(".day2").innerHTML=day.getDate();
	document.querySelector(".days2").innerHTML=days[day.getDay()];
</script>

</body>
</html>
