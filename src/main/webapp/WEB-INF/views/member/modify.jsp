<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="<%=request.getContextPath()%>/resources/js/daumpost.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

function modify(){
	addr1 = $("#addr1").val()
	addr2 = $("#addr2").val()
	addr3 = $("#addr3").val()
	addr = addr1 + "/" + addr2 + "/" + addr3
	$("#addr1").val(addr)
	fo.submit()
	//주소를 하나로 합쳐서 submit함
}
</script>

</head>
<body>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  <c:import url="../default/header.jsp"/>
  <div class="wrap content">
  
  <p><font size="5">회원정보 수정</font></p><br>
  <c:choose>
  	<c:when test="${loginWay == 1 }">
  		[카카오 계정으로 로그인중입니다]<br>
  		<form id="fo" action="${contextPath }/root/member/modify_save" method="post">
  		<input type="hidden" value="${loginWay }" name="loginWay">
  		<input type="hidden" value="${info.id }" name="id">
  		<input type="hidden" value="${info.email }" name="email">
  		
  		카카오 아이디 : <input type="text" value="${info.id }" disabled="disabled"><br>
  		카카오 이메일 : <input type="text" value="${info.email }" disabled="disabled"><br>
  		
  		<c:set var="addr" value="${fn:split(info.addr,'/') }"/>
  		우편번호 : <input type="text" value="${addr[0] }" id="addr1" name="addr1" readonly>
  		<input type="button" onclick="daumPost()" value="우편번호 찾기"><br>
  		주소 : <input type="text" value="${addr[1] }" id="addr2" name="addr2" readonly><br>
  		상세주소 : <input type="text" value="${addr[2] }" id="addr3" name="addr3"><br>
  		</form>
  		<br><input type="button" onclick="modify()" value="수정하기">
  	</c:when>
  	<c:otherwise>
  		<form id="fo" action="${contextPath }/root/member/modify_save" method="post">
  		<input type="hidden" value="${loginWay }" name="loginWay">
  		<input type="hidden" value="${info.id }" name="id">
  		
  		아이디 : <input type="text" value="${info.id }" name="id" disabled="disabled"><br>
  		비밀번호 : <input type="text" name="pw"><br>
  		
  		<c:set var="addr" value="${fn:split(info.addr,'/') }"/>
  		우편번호 : <input type="text" value="${addr[0] }" id="addr1" name="addr1" readonly>
  		<input type="button" onclick="daumPost()" value="우편번호 찾기"><br>
  		주소 : <input type="text" value="${addr[1] }" id="addr2" name="addr2" readonly><br>
  		상세주소 : <input type="text" value="${addr[2] }" id="addr3" name="addr3"><br>
  		</form>
  		<br><input type="button" onclick="modify()" value="수정하기">
  	</c:otherwise>
  </c:choose>
 
  
  </div>
  <c:import url="../default/footer.jsp"/>
</body>
</html>