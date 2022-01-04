<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${contextPath }/resources/css/admin.css">
<title>Insert title here</title>

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
  
  <table class="table" border="1" style="width:1100px;">
  <caption><font size="5">일반회원</font></caption>
  <tr><th>아이디</th><th>비밀번호</th><th>주 소</th></tr>
  <c:choose>
  	<c:when test="${empty memberList }">
  		<tr><th colspan="3">검색결과가 없습니다.</th></tr>
  	</c:when>
  	<c:otherwise>
  		<c:forEach items="${memberList }" var="mem">
 		<tr>
 		<td class="tableId"><a href="info?id=${mem.id }">${mem.id }</a></td>
  		<td>${mem.pw }</td><td>${mem.addr }</td>
  		</tr>
  		</c:forEach>
  	</c:otherwise>
  </c:choose>
  
  </table>

  
  <div class="page">
  <c:choose>
  	<c:when test="${not empty param.id }">
  		<c:set var="str" value="${param.id }"/>
  		<c:forEach var="num" begin="1" end="${repeat }">
			<a href="memberInfo?num=${num }&id=${param.id}">[${num }]</a>
	  	</c:forEach>
  	</c:when>
  	<c:otherwise>
  		<c:forEach var="num" begin="1" end="${repeat }">
			<a href="memberInfo?num=${num }">[${num }]</a>
	 	</c:forEach>
  	</c:otherwise>
  </c:choose>
  
	  
  </div>
	<div class="search">
		<form action="${contextPath }/member/memberInfo" method="get">
			<input class="inputId" type="text" name="id" value="${param.id }" placeholder="Input Id">
			<input class="submitBtn" type="submit" value="아이디 검색">
		</form>
	</div>	
  </div>
  </div>
  <c:import url="../default/footer.jsp"/>
</body>
</html>