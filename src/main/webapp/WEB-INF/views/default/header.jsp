<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
}

/* .wrap {
	width: 1000px;
	margin: auto;
} */

.header {
	display: flex;
	width: 100%;
	background-color: white;
}

.navdiv {
	display: flex;
	width: 100%;
}

nav {
	background-color: rgba( 255, 255, 255, 0 );
	width: 100%;
}

nav ul {
	list-style: none;
    display: flex;
    justify-content: space-evenly;
    align-items: center;
}

nav ul li {
	margin: 0 3px;
	padding: 20px 10px 0 10px;;
}

nav ul li a {
	text-decoration: none;
	color: white;
}

nav ul li a:hover {
	color: orange;
	padding-bottom: 3px; /* a태그 밑줄과 글씨 간격*/
	border-bottom: 2px solid orange;
	transition: all 0.25s;
}

/* .title { /*오른, 아래, 번짐*/
	text-shadow: 10px 10px 15px black;
	font-size: 70pt;
	text-align: center;
	margin-top: 0px;
	padding-bottom: 20px;
	color: burlywood;
	font-family: Gabriola;
} */

.content {
	margin-top: 50px;
}
</style>
</head>
<body>
	<div class="navdiv">
		<div class="wrap">
			<nav>
				<ul>
					<li><a href="${contextPath }/index">HOME</a></li>
					<li>
						<a href="${contextPath }/member/memberInfo">MEMBER_SHIP</a>
					</li>
					<li>
						<a href="${contextPath }/board/FAQ">FAQ</a>
					</li>
					<li>
						<a href="${contextPath }/map/KakaoMaps">지도</a>
					</li>
					
					<li>
						<c:choose>
							<c:when test="${loginUser != null }">
								<a href="${contextPath }/member/mypage">MYPAGE</a>
							</c:when>
						</c:choose>
					</li>
					
					<li>
						<c:choose>
							<c:when test="${loginUser != null }">
								<a href="${contextPath }/member/logout">LOGOUT</a>
							</c:when>
							<c:otherwise>
								<a href="${contextPath }/member/login">LOGIN</a>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>
