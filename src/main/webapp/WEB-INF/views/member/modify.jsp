<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보수정</title>

<link rel="stylesheet" href="../resources/css/modify.css">

<script src="<%=request.getContextPath()%>/resources/js/daumpost.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	function modify() {
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

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<div class="center">
		<div class="title">
			<img class="user" src="../resources/images/user.png">
			<c:choose>
				<c:when test="${loginWay == 1 }">
					<h1>KAKAO회원</h1>
				</c:when>
				<c:otherwise>
					<h1>LT회원</h1>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="info">
			<c:choose>
				<c:when test="${loginWay == 1 }">
					<div class="contents">
						<form id="fo" action="${contextPath }/root/member/modify_save" method="post">
							<input type="hidden" value="${loginWay }" name="loginWay">
							<input type="hidden" value="${info.id }" name="id"> 
							<input type="hidden" value="${info.email }" name="email">
							<div>
								<table>
									<tr>
										<th>아이디</th>
										<td>${info.id }</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>${info.email }</td>
									</tr>
									<c:set var="addr" value="${fn:split(info.addr,'/') }" />
									<tr>
										<th>우편번호</th>
										<td><input type="text" value="${addr[0] }" id="addr1" name="addr1" readonly></td>
									</tr>
									<tr>
										<td colspan="2"><input type="button" onclick="daumPost()" value="우편번호 찾기"></td>
									</tr>
									<tr>
										<th>주소</th>
										<td><input type="text" value="${addr[1] }" id="addr2" name="addr2" readonly></td>
									</tr>
									<tr>
										<th>상세주소</th>
										<td><input type="text" value="${addr[2] }" id="addr3" name="addr3"></td>
									</tr>
								</table>
							</div>
						</form>
						<input type="button" onclick="modify()" value="수정하기">
					</div>
				</c:when>
				<c:otherwise>
					<div class="contents">
						<form id="fo" action="${contextPath }/root/member/modify_save" method="post">
							<input type="hidden" value="${loginWay }" name="loginWay">
							<input type="hidden" value="${info.id }" name="id">
							<div>
								<table>
									<tr>
										<th>아이디</th>
										<td>${info.id }</td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><input type="password" name="pw" placeholder="현재 비번을 입력 해주세요"></td>
									</tr>
									<c:set var="addr" value="${fn:split(info.addr,'/') }" />
									<tr>
										<th>우편번호</th>
										<td><input type="text" value="${addr[0] }" id="addr1" name="addr1" readonly></td>
									</tr>
									<tr>
										<td colspan="2"><input type="button" onclick="daumPost()" value="우편번호 찾기"></td>
									</tr>
									<tr>
										<th>주소</th>
										<td><input type="text" value="${addr[1] }" id="addr2" name="addr2" readonly></td>
									</tr>
									<tr>
										<th>상세주소</th>
										<td><input type="text" value="${addr[2] }" id="addr3" name="addr3"></td>
									</tr>
								</table>
							</div>
						</form>
						<input type="button" onclick="modify()" value="수정하기">
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

</body>
</html>