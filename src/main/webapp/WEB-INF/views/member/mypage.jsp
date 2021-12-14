<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <c:import url="../default/header.jsp"/>
  <div class="wrap content">
  
  <p><font size="5">마이페이지</font></p><br>
  
  <c:choose>
  	<c:when test="${loginWay == 1 }">
  	[카카오 계정으로 로그인중입니다]<br>
  		카카오 아이디 : ${info.id } <br>
  		카카오 이메일 : ${info.email }<br>
  		주소 : ${info.addr }<br>
  		<br><button onclick="location.href='modify'">회원정보 수정</button>
  	</c:when>
  	<c:otherwise>
   		아이디 : ${info.id }<br>
   		주소 : ${info.addr }<br>
   		<br><button onclick="location.href='modify'">회원정보 수정</button>
  	</c:otherwise>
  </c:choose>
  
  </div>
  <c:import url="../default/footer.jsp"/>
</body>
</html>