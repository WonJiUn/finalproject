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

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function bookingCancel(lockerId){
		var form = {cancelId : lockerId}
		
		var confirmValue = confirm(lockerId.toUpperCase() + ' : 정말 취소하시겠습니까?')
		
		if(confirmValue == true){
			$.ajax({
				url : "ajax_bookingCancel",
				type : "POST",
				data : JSON.stringify(form),
				dataType: "text",
				contentType: 'application/json',
				success:function(result){
					alert(lockerId.toUpperCase() + ' : 예약이 취소되었습니다')
					location.reload();
				}
			})
		}
		
	}
	
	
</script>

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
  <tr><th>사물함번호</th><th>예약여부</th><th>예약날짜</th><th>아이디</th><th>이메일</th><th>예약취소</th></tr>
  
  <c:choose>
  	<c:when test="${empty bookingList }">
  		<tr><th colspan="6">검색결과가 없습니다.</th></tr>
  	</c:when>
  	<c:otherwise>
  		<c:forEach items="${bookingList }" var="booking">
	   <tr>
	   <td class="tableId">${fn:toUpperCase(booking.lockerId)}</td>
	   <td>${booking.checkIn }</td>
	   <td>${booking.sDate }</td>
	   <td>${booking.id }</td>
	   <td>${booking.email }</td>
	   <th style="width:80px;"><input type="button" value="예약취소" name="cancel" onclick="bookingCancel('${booking.lockerId}')"></th>
	   </tr>
	   </c:forEach>
  	</c:otherwise>
  </c:choose>
  
  </table>
  
  <div class="page">
  <c:choose>
  	<c:when test="${not empty param.inputValue }">
  		<c:set var="str" value="${param.inputValue }"/>
  		<c:forEach var="num" begin="1" end="${repeat }">
			<a href="bookingList?searchOption=${param.searchOption}&inputValue=${param.inputValue}&num=${num }">[${num }]</a>
	  	</c:forEach>
  	</c:when>
  	<c:otherwise>
  		<c:forEach var="num" begin="1" end="${repeat }">
			<a href="bookingList?num=${num }">[${num }]</a>
	 	</c:forEach>
  	</c:otherwise>
  </c:choose>

  </div>
  
  <div class="search">
		<form action="${contextPath }/member/bookingList" method="get">
			<select name="searchOption" style="height:31px;">
				<option value="lockerid">사물함번호</option>
				<option value="id">아이디</option>
				<option value="email">이메일</option>
			</select>
			<input class="inputId" type="text" name="inputValue" value="${param.inputValue}" placeholder="Input Value">
			<input class="submitBtn" type="submit" value="검색">
		</form>
  </div>

  </div>
  </div>
  <c:import url="../default/footer.jsp"/>
</body>
</html>