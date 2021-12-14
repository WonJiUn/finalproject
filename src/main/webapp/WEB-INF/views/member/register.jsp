<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../resources/css/register.css">

<script src="<%=request.getContextPath()%>/resources/js/daumpost.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function register() {
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
	<div class="center">
		<h1>Sign Up</h1>
		<form id="fo" action="register" method="post">
			<div class="txt_field">
				<input type="text" required name="id">
				<span></span>
				<label>Enter ID</label>
			</div>
			<div class="txt_field">
				<input type="text" required name="pw">
				<span></span>
				<label>Enter Password</label>
			</div>
			<div class="txt_field postal">
				<input type="text" readonly id="addr1" name="addr">
				<span></span>
				<label>Postal Code</label>
			</div>
			
				<input class="postal_btn" type="button" onclick="daumPost()" value="Postal Code">
			
			<div class="txt_field">
				<input type="text" readonly id="addr2">
				<span></span>
				<label>Address</label>
			</div>
			<div class="txt_field">
				<input type="text" required id="addr3">
				<span></span>
				<label>Street address</label>
			</div>
			
				<input type="submit" onclick="register()" value="submit">
		</form>
	</div>
</body>
</html>