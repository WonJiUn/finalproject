<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${contextPath }/resources/css/admin.css">

</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">
  <c:import url="../default/header.jsp"/>
</div>
  <div class="wrap content">
  <div align="center">
  <h1 class="nav">[ ADMIN ]</h1>
  <h3 class="search">
  <a href="${contextPath }/member/memberInfo">[일반회원목록]</a> 
  &nbsp;&nbsp;&nbsp;&nbsp; 
  <a href="${contextPath }/member/kakaoMemberInfo">[카카오회원목록]</a> 
  &nbsp;&nbsp;&nbsp;&nbsp; 
  <a href="${contextPath }/member/bookingList">[예약목록]</a></h3>
  
  <table border="1" class="table" style="width:1100px;">
  <caption><font size="5">카카오회원</font></caption>
  <tr><th>아이디</th><th>이메일</th><th>주 소</th></tr>
  <c:choose>
  	<c:when test="${empty kakaoList }">
  		<tr><th colspan="3">검색결과가 없습니다.</th></tr>
  	</c:when>
  	<c:otherwise>
  		<c:forEach items="${kakaoList }" var="kakao">
	    <tr>
	    <td class="tableId"><a href="kakaoInfo?email=${kakao.email }">${kakao.id }</a></td>
	    <td>${kakao.email }</td><td>${kakao.addr }</td>
  		</tr>
  		</c:forEach>
  	</c:otherwise>
  </c:choose>
  
  </table>
  
  <div class="page">
  <c:choose>
  	<c:when test="${not empty param.email }">
  		<c:set var="str" value="${param.email }"/>
  		<c:forEach var="num" begin="1" end="${repeat }">
			<a href="kakaoMemberInfo?num=${num }&email=${param.email}">[${num }]</a>
	  	</c:forEach>
  	</c:when>
  	<c:otherwise>
  		<c:forEach var="num" begin="1" end="${repeat }">
			<a href="kakaoMemberInfo?num=${num }">[${num }]</a>
	 	</c:forEach>
  	</c:otherwise>
  </c:choose>

  </div>
  
  <div class="search">
		<form action="${contextPath }/member/kakaoMemberInfo" method="get">
			<input class="inputId" type="text" name="email" placeholder="Input Email">
			<input class="submitBtn" type="submit" value="이메일 검색">
		</form>
  </div>
  
  </div>
  </div>
  <c:import url="../default/footer.jsp"/>
</body>
</html>