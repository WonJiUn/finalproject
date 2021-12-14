<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:350px; }


#info{font-size: 25pt; font: bold; }
	.addr{display: flex; align-items:center; padding: 0 0 10px 0; cursor:pointer}
	.q{font-size: 20pt; font-weight: bold; color: #DBC000}
	.a{font-size: 17pt;font-weight: bold; color: #993800}
	.aPlusbox_info1{display: flex; align-items:center; padding: 0 0 10px 0;}
	#box_info{background-color:  white; padding: 10px}
	.addr:hover{color: #DBC000}
	
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
<body >
	<c:import url="../default/header.jsp" />
	
	<div class="map_wrap">
			<div id="map" style="width: 700px; height: 400px; position: relative; margin-top: 20px; margin-bottom:10px; margin-left:500px; overflow: hidden ;"></div>	

	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6eaf5454c1d56a8e8e152088b0cfa32b&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.56876, 126.97976), // 지도의 중심좌표
		        level: 5, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	

		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [
		    {
		        title: '시청역 1호선', 
		        latlng: new kakao.maps.LatLng(37.566296886217216, 126.9773960028717)
		    },
		    {
		        title: '을지로입구역 2호선점', 
		        latlng: new kakao.maps.LatLng(37.56606798243041, 126.98238772558801)
		    },
		    {
		        title: '서울역 1호선점', 
		        latlng: new kakao.maps.LatLng(37.557605925256816, 126.97332992891664)
		    },
		    {
		        title: '광화문역 5호선점',
		        latlng: new kakao.maps.LatLng(37.57171588664107, 126.97497758856254)
		    
		    },
		    {
		        title: '종로3가 3호선점',
		        latlng: new kakao.maps.LatLng(37.570962, 126.991732)
		    
		    }
		];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://i.postimg.cc/QdX9v4TD/place.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		   
		
		 
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		 
		}
	
		
	</script>
	
			</div>
	<div class="wrap content">

<div id="info">&nbsp;&nbsp;사물함 정보<hr style="margin-top:10px"></div>

<hr style="margin:10px 0; border:solid 1px black;">
<div class="addr" id="addr1" onclick="slide_down(this.id)">
	<div class="q">L-1&nbsp;<br></div>
	<div class="station_n">시청역 1호선</div>
</div>
<div class="addr1" id="box_info" style="display: none;">
<div class="aPlusbox_info1">
	<div class="a">Address :&nbsp;<br></div>
	<div class="box_info1">서울특별시 중구 세종대로 101, 시청역 5번출구</div>
</div>
	<div class="box_info2">
		<table border="1" style="border-color:#DBC000 ">
			<tr>
				<th>사이즈</th>
				<th>총 보관함수</th>
				<th>현재 사용중</th>
				<th>사용가능</th>
				<th rowspan="4">선택</th>
			</tr>
			<tr>
				<th>S</th>
				<th>10개</th>
				<th> </th>
				<th> </th>
			</tr>
			<tr>
				<th>M</th>
				<th>7개</th>
				<th> </th>
				<th> </th>
			</tr>
			<tr>
				<th>L</th>
				<th>3개</th>
				<th> </th>
				<th> </th>
			</tr>
		</table>
	</div>
</div>

<hr style="margin-top:10px">	
	
<div class="addr" id="addr2" onclick="slide_down(this.id)">
	<div class="q">L-2&nbsp;<br></div>
	<div class="station_n">을지로입구역 2호선점</div>
</div>

<div class="addr2" id="box_info" style="display: none;">
<div class="aPlusbox_info1">
	<div class="a">Address :&nbsp;<br></div>
	<div class="box_info1">서울특별시 중구 을지로 42,2층 안내센터 옆</div>
</div>
	<div class="box_info2">
		<table border="1" style="border-color:#DBC000 ">
			<tr>
				<th>사이즈</th>
				<th>총 보관함수</th>
				<th>현재 사용중</th>
				<th>사용가능</th>
				<th rowspan="4">선택</th>
			</tr>
			<tr>
				<th>S</th>
				<th>10개</th>
				<th> </th>
				<th> </th>
			</tr>
			<tr>
				<th>M</th>
				<th>7개</th>
				<th> </th>
				<th> </th>
			</tr>
			<tr>
				<th>L</th>
				<th>3개</th>
				<th> </th>
				<th> </th>
			</tr>
		</table>
	</div>
</div>

<hr style="margin-top:10px">	

<div class="addr" id="addr3" onclick="slide_down(this.id)">
	<div class="q">L-3&nbsp;<br></div>
	<div class="station_n">서울역 1호선점</div>
</div>

<div class="addr3" id="box_info" style="display: none;">
<div class="aPlusbox_info1">
	<div class="a">Address :&nbsp;<br></div>
	<div class="box_info1">서울특별시 중구 세종대로 2, 4번 출구</div>
</div>
	<div class="box_info2">
		<table border="1" style="border-color:#DBC000 ">
			<tr>
				<th>사이즈</th>
				<th>총 보관함수</th>
				<th>현재 사용중</th>
				<th>사용가능</th>
				<th rowspan="4">선택</th>
			</tr>
			<tr>
				<th>S</th>
				<th>10개</th>
				<th> </th>
				<th> </th>
			</tr>
			<tr>
				<th>M</th>
				<th>7개</th>
				<th> </th>
				<th> </th>
			</tr>
			<tr>
				<th>L</th>
				<th>3개</th>
				<th> </th>
				<th> </th>
			</tr>
		</table>
	</div>
</div>

<hr style="margin-top:10px">	

<div class="addr" id="addr4" onclick="slide_down(this.id)">
	<div class="q">L-4&nbsp;<br></div>
	<div class="station_n">광화문역 5호선점</div>
</div>

<div class="addr4" id="box_info" style="display: none;">
<div class="aPlusbox_info1">
	<div class="a">Address :&nbsp;<br></div>
	<div class="box_info1">서울 종로구 세종대로 172,1번 출구</div>
</div>
	<div class="box_info2">
		<table border="1" style="border-color:#DBC000 ">
			<tr>
				<th>사이즈</th>
				<th>총 보관함수</th>
				<th>현재 사용중</th>
				<th>사용가능</th>
				<th rowspan="4">선택</th>
			</tr>
			<tr>
				<th>S</th>
				<th>10개</th>
				<th> </th>
				<th> </th>
			</tr>
			<tr>
				<th>M</th>
				<th>7개</th>
				<th> </th>
				<th> </th>
			</tr>
			<tr>
				<th>L</th>
				<th>3개</th>
				<th> </th>
				<th> </th>
			</tr>
		</table>
	</div>
</div>

<hr style="margin-top:10px">	

<div class="addr" id="addr5" onclick="slide_down(this.id)">
	<div class="q">L-5&nbsp;<br></div>
	<div class="station_n">종로3가 3호선점</div>
</div>

<div class="addr5" id="box_info" style="display: none;">
<div class="aPlusbox_info1">
	<div class="a">Address :&nbsp;<br></div>
	<div class="box_info1">서울특별시 종로구 돈화문로 30,2-1번 출구</div>
</div>
	<div class="box_info2">
		<table border="1" style="border-color:#DBC000 ">
			<tr>
				<th>사이즈</th>
				<th>총 보관함수</th>
				<th>현재 사용중</th>
				<th>사용가능</th>
				<th rowspan="4">선택</th>
			</tr>
			<tr>
				<th>S</th>
				<th>10개</th>
				<th> </th>
				<th> </th>
			</tr>
			<tr>
				<th>M</th>
				<th>7개</th>
				<th> </th>
				<th> </th>
			</tr>
			<tr>
				<th>L</th>
				<th>3개</th>
				<th> </th>
				<th> </th>
			</tr>
		</table>
	</div>
</div>

<hr style="margin-top:10px">	




	
</div>		
			
	<c:import url="../default/footer.jsp" />
</body>
</html>