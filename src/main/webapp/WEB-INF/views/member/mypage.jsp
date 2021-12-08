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
  
  <font size="5">마이페이지</font><br>
  
  <c:choose>
  	<c:when test="${loginWay == 1 }">
  		아이디 : ${info.id } <br>
  		이메일 : ${info.email }<br>
  		주소 : ${info.addr }<br>
  	</c:when>
  	<c:otherwise>
   		아이디 : ${info.id }<br>
  		비밀번호 : ${info.pw }<br>
   		주소 : ${info.addr }<br>
  	</c:otherwise>
  </c:choose>
  
  이제 form 만들어서 수정시 DB에 정보 저장하는거 만들어야함<br>
  주소쪽에는 다음 주소 api 적용하기<br>
  일반로그인 비밀번호 수정은 처음 수정창 들어갔을때 공백으로 표시하고 수정저장시 암호화
  
  </div>
  <c:import url="../default/footer.jsp"/>
</body>
</html>