<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="../resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
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
		<input class="login_btn" type="button" value="HOME" onclick="location.href='../';">
	</div>
	
	<div class="right">
		<div class="title"><h1>Log In</h1></div>
    	<form action = "/root/member/user_check" method="post">
    		
    		<div class="txt_field">
				<input type="text" required name="id" id="txtId"> <span></span>
				<label>Enter ID</label>
			</div>
  			
  			<div class="txt_field">
 				<input type="password" required name="pw"> <span></span>
  				<label>Enter Password</label>
  			</div>
  				
  			<input type="submit" value="Login">
  			<div class="reg_auto">
  				<a href="register_form">회원가입</a>
  				<div><input type="checkbox" name="autoLogin">로그인 유지</div>
  			</div>
    	</form>
    	<a id="custom-login-btn" href="javascript:loginWithKakao()">
  			<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/>
		</a>
<!-- 이메일 체크해제시 자동으로 연결해제(가입불가)하게 코드수정
<div onclick="kakaoLeave();"><a href="javascript:void(0)"><span>카카오 연결해제(DB삭제기능 미구현)</span></a></div>
-->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
Kakao.init('6eaf5454c1d56a8e8e152088b0cfa32b');
  function loginWithKakao() {
    Kakao.Auth.login({
      success: function(authObj) {
    	  Kakao.API.request({
    		    url: '/v2/user/me',
    		    data: {
    		        property_keys: ["kakao_account.email"]
    		    },
    		    success: function(response) {
    		        //console.log(response);
    		        //console.log(response.id);
    		        //console.log(response.kakao_account.email);
    		        var form = {id : response.id, email : response.kakao_account.email}
    		        if(response.kakao_account.email == null){
    		        	alert('가입실패 : 이메일 제공에 동의해주세요')
    		        	kakaoLeave();
    		        	//카카오 이메일 계정을 필수동의로 설정하지 못하여 발생한 문제
    		        	location.href="login";
    		        }
    		        else{
	    	    		//console.log(form)
	    	    		$.ajax({
	    				url : "ajax_kakaoLogin",
	    				type : "POST",
	    				data : JSON.stringify(form),
	    				dataType : "text",
	    				contentType : "application/json; charset=utf-8",
	    				success : function(result){
	    					//console.log(result)
	    					
	    					location.href="successLogin?id=" + result;
	    				}
			
	   					})
    		        }
    		        
    		    },
    		    fail: function(error) {
    		        console.log(error);
    		    }
    		});
      },
      fail: function(err) {
        alert(JSON.stringify(err))
        console.log(authObj)
      },
    })
  }
//카카오 계정 -> 연결된 서비스관리 -> 연결해제(DB삭제기능 미구현이므로 다시 가입하려면 DB는 직접삭제해야함)
//다른계정으로 로그인기능 미구현. 인터넷 브라우저 설정에서 kakao.com 쿠키삭제하면 다른 아이디로 로그인가능 
function kakaoLeave() {
      if (Kakao.Auth.getAccessToken()) {
        Kakao.API.request({
          url: '/v1/user/unlink',
          success: function (response) {
          	console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
        Kakao.Auth.setAccessToken(undefined)
      }
}  


</script>
    
	</div>
</div>
</body>
</html>