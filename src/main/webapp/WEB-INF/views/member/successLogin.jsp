<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/booking.css">
<!-- <link rel="stylesheet" href="../resources/css/location.css"> -->

<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../resources/js/jquery-syaku.rolling.js"></script>
    <script type="text/javascript">
        jQuery(function() {
  
            jQuery("#srolling").srolling({
                data : $("#aaa > div"),  // 노출될 아이템
                auto : false,                    //자동 롤링 true , false
                width : 300,                 // 노출될 아이템 크기
                height : 50,                    // 노출될 아이템 크기
                item_count : 1,         // 이동 될 아이템 수
                cache_count : 1,            // 임시로 불러올 아이템 수
                delay : 1000,               // 이동 아이템 딜레이
                delay_frame : 500,      // 아이템 흐르는 속도
                move : 'top',               // 이동 방향 left , right , top , down
                prev : '#p_click',          // < 이동 버튼
                next : '#n_click'           // > 이동 버튼
            });
        });
        </script>

<script type="text/javascript">
	function fresh() {
		document.getElementById('station-btn').click();
	}
	
	function station(statusItem){
		/* var selectedStation = $("select[name=station]").val() */
		selectedStation = statusItem.id;
		var stName = "";
		console.log(statusItem)
		console.log(selectedStation)
		
		/* 선택된 역 색지정 */
		var selSt = document.querySelectorAll(".station");
		console.log(selSt)
		
		for(i=0; i<selSt.length; i++){
			selSt[i].classList.remove("sel-station");
		}
		
		statusItem.classList.add("sel-station");
		
		/* 역이름 정하기 */
		if(selectedStation=="ch"){
			stName = "시청역";
 		}else if(selectedStation=="ul"){
			stName = "을지로입구역";
 		}else if(selectedStation=="ss"){
			stName = "서울역";
		}else if(selectedStation=="gh"){
			stName = "광화문역";
 		}else{
 			stName = "종로3가역";
 		}
		console.log(stName)
 
		document.getElementById('stationResult').innerText = stName;
		document.getElementById('stationResult2').innerText = stName;
		/*document.getElementById('station-btn').click();
		document.getElementById('date-btn').click(); */
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
	
	function time(statusItem){
		var selectedTime = statusItem.id;
		var selectedPart = "시간을 선택해 주세요";
		lockerTime = "";
		console.log(selectedTime)
		console.log(selectedPart)
		
		var timePart = document.querySelectorAll(".time-part");
		console.log(timePart)
		
		for(i=0; i<timePart.length; i++){
			timePart[i].classList.remove("sel-time");
		}
		
		statusItem.classList.add("sel-time");
		
		if(selectedTime == "part1"){
			selectedPart = "08시-12시(4h)";
			lockerTime = "a";
			console.log(selectedPart)
		}else if(selectedTime == "part2"){
			selectedPart = "12시-16시(4h)";
			lockerTime = "b";
			console.log(selectedPart)
		}else{
			selectedPart = "16시-20시(4h)";
			lockerTime = "c";
			console.log(selectedPart)
		}
		
		/* db접근용 라커id 생성 */
		console.log("선택한 역 코드 : " + selectedStation)
		lockerST = selectedStation;
		console.log("전역변수에 대입 : " + lockerST)
		console.log("선택한 시간파트 : " + lockerTime)
		
		lockerId = lockerST + "-" + lockerTime;
		console.log("DB 비교용 락커이름 : " + lockerId)
		var form = {checkId : lockerId}
		bookedLokers = ''
		
		/* 컨트롤러로 락커id 보내기 */
		$.ajax({
			url : "ajax_lockerCheck",
			async:false,	// ajax의 결과값(result)을 전역변수로 넣기 위해 추가함
			type : "POST",
			data : JSON.stringify(form),
			dataType: "json",		/* 리스트 형태로 돌아오기 때문에 json으로 설정 */
			contentType: 'application/json',
			success:function(result){
				bookedLokers = result
				console.log(JSON.stringify(result))		/* json 전체 출력 */
				console.log(result)		/* 일반 arr형태로 출력 */
				$.each(result , function(idx, val) {
					console.log("체크인락커 불러오기") /* 인덱스와 함께 출력됨 */
					console.log(idx + " " + val.lockerId)
					})
			}
		})
		
		/* 받아온 예약된 락커에 'booked' 클래스추가 */
		console.log("전역변수로 저장 후 출력" + bookedLokers)
		var allLockers = document.querySelectorAll(".loc");
		for(i=0; i<bookedLokers.length; i++){
			bkLockerSize=bookedLokers[i].lockerId.substr(5,2) //문자열 자르기
			console.log("스플릿 : " + bkLockerSize)
			for(j=0; j<allLockers.length; j++){
				/* console.log(bkLockerSize+":"+allLockers[j].id) */
				if(bkLockerSize==allLockers[j].id){  // 모든락커 id와 자른 문자열 비교
					console.log("일치함 : "+bkLockerSize+":"+allLockers[j].id)
					document.getElementById(bkLockerSize).classList.add("booked") //예약된 락커에 클래스 추가
					document.getElementById(bkLockerSize).style.backgroundColor= "#bebebe";
					$('#'+bkLockerSize).attr('onclick','').unbind('click'); 
				}
			}
		}
		
		
		//
		
		document.getElementById('sel-part').innerText = selectedPart;
		document.getElementById('timeResult2').innerText = selectedPart;
		
		/* if(selectedTime == "part1"){
			document.getElementById('timeResult').innerText = selectedTime;
		}
		document.getElementById('timeResult2').innerText = selectedTime; */
	}
	
	function size(){
	      var selectedSize = $("#sel-locker").text();
	      /* document.getElementById('sizeResult').innerText = checkedSize; */
	      document.getElementById('sizeResult2').innerText = selectedSize;
	      if (selectedSize==""){
	         alert("락커를 먼저 선택해 주세요!");
	      }else{
	         document.getElementById('size-btn').click();
	         document.getElementById('conf-btn').click();
	      }
	   }   
</script>

<script>

function station_sel(){
	   var prevVal = $("#stationResult").text();
	   if (prevVal==""){
	      alert("장소를 먼저 선택해 주세요!");
	   }else{
	      document.getElementById('station-btn').click();
	      document.getElementById('date-btn').click();
	   }
	}

	function time_sel(){
	   var prevVal = $("#sel-part").text();
	   if (prevVal==""){
	      alert("시간을 먼저 선택해 주세요!");
	   }else{
	      document.getElementById('time-btn').click();
	      document.getElementById('size-btn').click();
	   }
	}

</script>

<!-- 사물함 선택 -->
<script>
function test(statusItem) {
	
	console.log(statusItem);
	locker = $(statusItem).text();
	console.log(locker);
	var colors=["#a2d8ff","#ffc800","#bebebe"];
	
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
	var colorGray = document.getElementsByClassName("booked");
	for(i=0; i<colorGray.length; i++){
		console.log("회색 : "+colorGray[i].id)
		colorGray[i].style.backgroundColor=colors[2];
	}
	/* 락커 색 바꾸기(끝) */
	
	document.getElementById('sel-locker').innerText = locker;
}
</script>

<script>
function confirm() {
	   console.log(lockerId)
	   var bookInfo = lockerId + "-" + locker
	   bookInfo = bookInfo.toLowerCase();
	   var form = {bookConfirm : bookInfo}
	   
	   $.ajax({
	         url : "ajax_booking_Confirm",
	         type : "POST",
	         data : JSON.stringify(form),
	         dataType: "text",      
	         contentType: 'application/json',
	         success:function(result){
	            if(result==1){
	               alert("예약이 완료되었습니다")
	               let url = "/root/"
	               location.replace(url)
	            }else{
	               alert("예약이 실패하였습니다")
	            }
	         }
	      })
	}
</script>

</head>
<body onload="fresh()">
	<div class="nav_bar">
		<c:import url="../default/header.jsp"></c:import>
	</div>
	<%-- <h1>${loginUser }님 환영합니다</h1> --%>

	<div class="popup">

		<div id="stationPopup">
 
			<div class="p-content container">
			
			
				<div class="c-title"><h3>장소선택</h3></div>
    			
    			<div>
    			
    			<a id="p_click" style="margin-bottom: 20px;">
					<img src="../resources/images/up.png">
				</a>
    			
    			
    			<div class="stations"id="srolling" style="margin-left:100px; margin-bottom:20px;position: relative;overflow:hidden;width:750px;height:50px;">
    					<div id="aaa" style="display:none;">
    			
    			
    				<div class="station ch" id="ch" onclick="station(this);">
    					<h1>시청역</h1>
    				</div>
    				<div class="station ul" id="ul" onclick="station(this);">
    					<h1>을지로입구역</h1>
    				</div>
    				<div class="station ss" id="ss" onclick="station(this);">
    					<h1>서울역</h1>
    				</div>
    				<div class="station gh" id="gh" onclick="station(this);">
    					<h1>광화문역</h1>
    				</div>
    				<div class="station gr" id="gr" onclick="station(this);">
    					<h1>종로3가역</h1>
    				</div>
    				
    				</div>
    				
    				
    				</div>
					<a id="n_click"><img src="../resources/images/down.png"></a>
    				</div>
    				
    				
    				<!-- <select name="station">
							<option value="undefined">=== 선택 ===</option>
							<option value="시청역 1호선점">시청역 1호선점</option>
							<option value="을지로입구역 2호선점">을지로입구역 2호선점</option>
							<option value="서울역 1호선점">서울역 1호선점</option>
							<option value="광화문역 5호선점">광화문역 5호선점</option>
							<option value="종로3가 3호선점">종로3가 3호선점</option>	
					</select> -->
    				<!-- <div class="album">
      					<div class="images">
        					<img src="../resources/images/image1.jpeg">
        					<img src="../resources/images/image2.jpeg">
        					<img src="../resources/images/image3.jpeg">
        					<img src="../resources/images/image4.jpeg">
        					<img src="../resources/images/image5.jpeg">
      					</div>
    				</div>
    				<div class="remote">
    					<button class="prev">PREV</button>
    					<button class="next">NEXT</button>  
  							<script src="../resources/js/script.js"></script>
						<select name="station">
							<option value="undefined">=== 선택 ===</option>
							<option value="시청역 1호선점">시청역 1호선점</option>
							<option value="을지로입구역 2호선점">을지로입구역 2호선점</option>
							<option value="서울역 1호선점">서울역 1호선점</option>
							<option value="광화문역 5호선점">광화문역 5호선점</option>
							<option value="종로3가 3호선점">종로3가 3호선점</option>	
						</select>
					</div> -->
				
				<div class="selected">
					<h3>선택 장소 : </h3><h3 id="stationResult"></h3>
				</div>
				<button onclick="station_sel();">Next</button><br>
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
				</div>
				<div>
					<button onclick="date();">Next</button>
				</div>
			</div>
			
			<a class="close" onclick="datePopupToggle()">
				<img src="../resources/css/cancel.png">
			</a>
		</div>
		
		<div id="timePopup">
			<div class="p-content">
				<div class="c-title"><h3>시간선택</h3></div>
				<div class="time">
					<div class="time-part" id="part1" onclick="time(this);">
						<h3>AM</h3>
						<h1>08:00</h1>
						<h1>~</h1>
						<h1>12:00</h1>
					</div>
					<div class="time-part" id="part2" onclick="time(this);">
						<h3>PM</h3>
						<h1>12:00</h1>
						<h1>~</h1>
						<h1>16:00</h1>
					</div>
					<div class="time-part" id="part3" onclick="time(this);">
						<h3>PM</h3>
						<h1>16:00</h1>
						<h1>~</h1>
						<h1>20:00</h1>
					</div>
				</div>
				<div class="selected">
					<h3>선택된 시간 : </h3><h3 id="sel-part"></h3>
				</div>
				<div>
					<button onclick="time_sel();">Next</button>
				</div>
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
								<td class="loc ls01" id="s1" onclick="test(this)">S1</td> 
								<td class="loc ls02" id="s2" onclick="test(this)">S2</td> 
								<td class="loc ls03" id="s3" onclick="test(this)">S3</td>
								<td class="loc ls04" id="s4" onclick="test(this)">S4</td>
								<td class="loc ls05" id="s5" onclick="test(this)">S5</td>
							</tr>
							<tr height="50">
								<td class="loc ls06" id="s6" onclick="test(this)">S6</td> 
								<td class="loc ls07" id="s7" onclick="test(this)">S7</td> 
								<td class="loc ls08" id="s8" onclick="test(this)">S8</td> 
								<td class="loc ls09" id="s9" onclick="test(this)">S9</td> 
								<td class="loc ls10" id="s10" onclick="test(this)">S10</td>
							</tr>
							<tr height="70">
								<td class="loc lm01" id="m1" onclick="test(this)">M1</td> 
								<td class="Kiosk" id="Kiosk" rowspan="2">Kiosk</td> 
								<td class="loc lm02" id="m2" onclick="test(this)">M2</td> 
								<td class="loc lm03" id="m3" onclick="test(this)">M3</td> 
								<td class="loc lm04" id="m4" onclick="test(this)">M4</td>
							</tr>
							<tr height="70">
								<td class="loc ll01" id="l1" rowspan="2" onclick="test(this)">L1</td> 
								<td class="loc ll02" id="l2" rowspan="2" onclick="test(this)">L2</td> 
								<td class="loc lm05" id="m5" onclick="test(this)">M5</td> 
								<td class="loc ll03" id="l3" rowspan="2" onclick="test(this)">L3</td>
							</tr>
							<tr height="70">
								<td class="loc lm06" id="m6" onclick="test(this)">M6</td> 
								<td class="loc lm07" id="m7" onclick="test(this)">M7</td>
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
					<div class="selected-1">
						<h4 class="blue">■</h4><h5>예약가능</h5>
						<h4 class="gray">■</h4><h5>예약불가</h5>
						<h4 class="orange">■</h4><h5>선택</h5>
					</div>
					<div class="selected-2">
						<h3>선택된 사물함 : </h3><h3 id="sel-locker"></h3>
					</div>
				</div>
				<div>
					<button onclick="size();">Next</button>
				</div>
			</div>
			
				
			<a class="close" onclick="sizePopupToggle()">
				<img src="../resources/css/cancel.png">
			</a>
		</div>
		
		<div id="confPopup">
			<div class="p-content">
				<div class="c-title"><h3>예약하기</h3></div>
				<div class="book-result">
					<div class="book-left">
						<img class="conf-img" src="../resources/images/booked.png">
						<h1>예약정보를</h1>
						<h1>확인해주세요</h1>
					</div>
					<div class="book-right">
						<!-- <div class="book-title">
  							<h1>예약 정보</h1>
  						</div> -->
  						<div class="book-info">
  							<div class="books book-station">
								<h3>장소</h3>
								<div>
									<img class="conf-img" src="../resources/images/place.png">
									<h4 id="stationResult2"></h4>
								</div>
								<!-- <span id="stationResult2"></span> -->
							</div>
							<div class="books book-date">
								<h3>날짜</h3>
								<div>
									<img class="conf-img" src="../resources/images/twelve.png">
									<h4 id="dateResult2"></h4>
								</div>
								<!-- <span id="dateResult2"></span> -->
							</div>
							<div class="books book-time">
								<h3>시간</h3>
								<div>
									<img class="conf-img" src="../resources/images/stopwatch.png">
									<h4 id="timeResult2"></h4>
								</div>
								<!-- <span id="timeResult2"></span> -->
							</div>
							<div class="books book-size">
								<h3>사이즈</h3>
								<div>
									<img class="conf-img" src="../resources/images/ruler.png">
									<h4 id="sizeResult2"></h4>
								</div>
								<!-- <span id="sizeResult2"></span> -->
							</div>
						</div>
					</div>
				</div>
				<div>
					<button onclick="confirm();">예약하기</button>
				</div>
<!-- 				<div class="dbSearchResult">
					DB검색결과 : 
				</div> -->
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
