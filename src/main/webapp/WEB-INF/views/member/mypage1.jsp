<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		var id = ${info.id };
		var condition = "카카오 계정으로 로그인 중 입니다.";
		if(${info.addr != null }){
			var addr = ${info.addr}
			document.getElementById('addr').innerText = addr;
		}else{
			document.getElementById('addr').innerText = "저장된 주소가 없습니다";
		}
		document.getElementById('id').innerText = "Kakao회원";
		document.getElementById('condition').innerText = condition;
		
		document.getElementById('id-right').innerText = id;
		document.getElementById('condition-right').innerText = condition;
	}else{
		var id = ${info.id };
		var condition = "일반 계정으로 로그인 중 입니다";
		if(${info.addr != null }){
			var addr = ${info.addr};
			document.getElementById('addr').innerText = addr;
		}else{
			document.getElementById('addr').innerText = "저장된 주소가 없습니다";
		}
		document.getElementById('id').innerText = id;
		document.getElementById('condition').innerText = condition;
		
		document.getElementById('id-right').innerText = id;
		document.getElementById('condition-right').innerText = condition;
		
		document.getElementById('email').innerText = "등록된 이메일이 없습니다";
	}
	/* console.log(condition, id, addr); */
})

</script>
</head>

<body>
	<div class="center">
		<div class="left">
			<img>
			<div class="left-container">
				<span id="id"></span>
				<span id="condition"></span>
			</div>
			<img><button onclick="location.href='modify'">회원정보 수정</button>
		</div>
  		<div class="right">
  			<div class="title">
  				<h1>Infomation</h1>
  			</div>
  			<div class="info">
  				<div class="id">
  					<h3>User ID</h3>
  					<h3 id="id-right"></h3>
  				</div>
  				<div class="condition">
  					<h3>로그인 상태</h3>
  					<h3 id="condition-right"></h3>
  				</div>
  			</div>
  			<div class="info">
  				<div class="addr">
  					<h3>Address</h3>
  					<h3 id="addr"></h3>
  				</div>
  				<div class="email">
  					<h3>E-Mail</h3>
  					<h3 id="email"></h3>
  				</div>
  			</div>
  			<div>
  			</div>
  			<div>
  			</div>
  			<div>
  			</div>
  			<%-- <c:choose>
  				<c:when test="${loginWay == 1 }">
  					[카카오 계정으로 로그인 중 입니다]<br>
  					카카오 아이디 : ${info.id } <br>
  					카카오 이메일 : ${info.email }<br>
  					주소 : ${info.addr }<br>
  					<!-- <br><button onclick="location.href='modify'">회원정보 수정</button> -->
  				</c:when>
  				<c:otherwise>
  					[일반 계정으로 로그인 중 입니다]
   					아이디 : ${info.id }<br>
   					주소 : ${info.addr }<br>
   					<!-- <br><button onclick="location.href='modify'">회원정보 수정</button> -->
  				</c:otherwise>
  			</c:choose> --%>
  		</div>
  </div>
</body>
</html>