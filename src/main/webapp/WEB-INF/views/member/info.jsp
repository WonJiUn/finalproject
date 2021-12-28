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
 
<div align="center">
    <table border="1" class="table" style="width:1100px;">
   <caption><font size="5">${info.id } 회원정보</font></caption>
   <tr><th>아이디</th><td>${info.id }</td></tr>
   <tr><th>비밀번호</th><td>${info.pw }</td></tr>
   <tr><th>주소</th><td>${info.addr }</td></tr>
    </table>
</div>

</div>
</div>
<c:import url="../default/footer.jsp"/>

</body>
</html>