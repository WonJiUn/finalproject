<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>


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

<!-- 비밀번호 확인  -->
<script>
	var pw_passed = true; // 추후 벨리데이션 처리시에 해당 인자값 확인을 위해

	function fn_pw_check() {

		var pw = document.getElementById("txtPassword1").value; //비밀번호
		var pw2 = document.getElementById("txtPassword2").value; // 확인 비밀번호
		var id = document.getElementById("txtId").value; // 아이디

		pw_passed = true;

		var pattern1 = /[0-9]/;
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[~!@\#$%<>^&*]/; // 원하는 특수문자 추가 제거
		var pw_msg = "";

		if (id.length == 0) {
			alert("아이디를 입력해주세요");
			return false;
		} else {
			//필요에따라 아이디 벨리데이션
		}

		if (pw.length == 0) {
			alert("비밀번호를 입력해주세요");
			return false;
		} else {
			if (pw != pw2) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		}

		if (!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw)
				|| pw.length<8||pw.length>50) {
			alert("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.");
			return false;
		}

		if (pw.indexOf(id) > -1) {
			alert("비밀번호는 ID를 포함할 수 없습니다.");
			return false;
		}

		var SamePass_0 = 0; //동일문자 카운트
		var SamePass_1 = 0; //연속성(+) 카운드
		var SamePass_2 = 0; //연속성(-) 카운드
		
		for (var i = 0; i < pw.length; i++) {
			var chr_pass_0;
			var chr_pass_1;
			var chr_pass_2;

			if (i >= 2) {
				chr_pass_0 = pw.charCodeAt(i - 2);
				chr_pass_1 = pw.charCodeAt(i - 1);
				chr_pass_2 = pw.charCodeAt(i);

				//동일문자 카운트
				if ((chr_pass_0 == chr_pass_1) && (chr_pass_1 == chr_pass_2)) {
					SamePass_0++;
				}
				else {
					SamePass_0 = 0;
				}

				//연속성(+) 카운드
				if (chr_pass_0 - chr_pass_1 == 1
						&& chr_pass_1 - chr_pass_2 == 1) {
					SamePass_1++;
				}
				else {
					SamePass_1 = 0;
				}

				//연속성(-) 카운드
				if (chr_pass_0 - chr_pass_1 == -1
						&& chr_pass_1 - chr_pass_2 == -1) {
					SamePass_2++;
				}
				else {
					SamePass_2 = 0;
				}
			}

			if (SamePass_0 > 0) {
				alert("동일문자를 3자 이상 연속 입력할 수 없습니다.");
				pw_passed = false;
			}

			if (SamePass_1 > 0 || SamePass_2 > 0) {
				alert("영문, 숫자는 3자 이상 연속 입력할 수 없습니다.");
				pw_passed = false;
			}

			if (!pw_passed) {
				return false;
				break;
			}
		}
		return true;
	}
</script>

<script>
 function txtIdChk(){
	
	 /* var txtIdChk = document.getElementById("txtId").value; */
	/*  var txtIdChk = $("#txtId").val();
	 var txtIdChk = $("#txtPassword1").val(); */
	 
	 var txtIdChk = $("input[type=text][name=id]").val();

	 console.log(txtIdChk);
	 
	 var form = {id:txtIdChk};
	 /* console.log(txtPassword1); */


	 $.ajax({
			url : "txtIdChk",
			type : "POST",
			data : JSON.stringify(form),
			dataType : "text",
			contentType : "application/json; charset=utf-8",
			success : function(result){
				console.log(result)
				alert(result);
			}

		})
 }
</script>

</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="center">
		<div class="left">
			<img alt="logo" src="../resources/images/logo.png">
			<h1>환영합니다!!</h1>
			<h2>welcome!!</h2>
			<P>
				잠시 짐을 맡겨야 할 때,<br>
				여행 중 무거운 짐이 있을 때,<br>
				언제든 가까운 곳에 Light Trip이 있습니다
			</P>
			<input class="login_btn" type="button" value="로그인" onclick="location.href='login';">
		</div>
	
		<div class="right">
			<h1>Sign Up</h1>
			<form id="fo" action="register" method="post">
				<div class="txt_field" style="margin-bottom: 3px">
					<input type="text" required name="id" id="txtId"> <span></span> 
					<label>Enter ID</label>
				</div>
			
				<input class="idChk_btn btn" type="button" onclick="txtIdChk()"
					value="ID 중복 확인">
				
				<div class="txt_field">
					<input type="password" required name="pw" id="txtPassword1"> <span></span> 
					<label>Enter Password</label>
				</div>
				<div class="txt_field">
					<input type="password" required name="pw2" id="txtPassword2" onchange="fn_pw_check()"> <span></span> 
					<label>Confirm Password</label>
				</div>
				<div class="txt_field" style="margin-bottom: 3px">
					<input type="text" required id="addr1" name="addr"> <span></span> 
					<label>Postal Code</label>
				</div>

				<input class="postal_btn btn" type="button" onclick="daumPost()"
					value="우편번호 찾기">

				<div class="txt_field">
					<input type="text" required id="addr2"> <span></span> <label>Address</label>
				</div>
				<div class="txt_field">
					<input type="text" required id="addr3"> <span></span> <label>Street address</label>
				</div>

				<input type="submit" onclick="register()" value="submit">
			</form>
		</div>
	</div>
</body>
</html>