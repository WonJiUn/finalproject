<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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
  <caption><font size="5">예약목록</font></caption>
  <tr><th>사물함번호</th><th>예약시간</th><th>예약날짜</th><th>예약아이디</th></tr>
  <c:forEach items="${bookingList }" var="booking">
  <tr>
  <td class="tableId">${fn:toUpperCase(booking.lockerId)}</td>
  <td>${booking.checkIn }</td>
  <td>${booking.sDate }</td>
  <td>${booking.id }</td>
  </tr>
  </c:forEach>
  </table>
  

  </div>
  </div>
  <c:import url="../default/footer.jsp"/>
</body>
</html>