<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/main_bg.css">

</head>
<body>

<c:import url="default/header.jsp"></c:import>

	<div class="container">
		<h2><span>나의 짐을 맡아줘</span><br>Light Trip!</h2>		
	</div>
	
	<div class="container1">
		<div class="login">
		<form action="/root/member/user_check" method="post">
			<input class="id" type="text" name="id" placeholder="enter your id">
			<input class="pw" type="password" name="pw" placeholder="enter your password">
			<input class="submit" type="submit" value="login"><br>
			<div>
				<div>
					<input class="checkbox" type="checkbox" name="autoLogin">remember me
				</div>
				<a class="register" href="member/register_form">register now!</a>
			</div>
		</form>
		<a id="custom-login-btn" href="javascript:loginWithKakao()"> 
			<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
		</a>
	
<!-- 	<div onclick="kakaoLeave();">
			<a href="javascript:void(0)"><span>카카오 연결해제(DB삭제기능 미구현)</span></a>
		</div> -->
		</div>
	</div>
	<div class="container2"></div>

	<script src="resources/js/anime.min.js"></script>
	
	<script>
		const container2 = document.querySelector('.container2')
		for(var i=0; i<=100; i++){
			const blocks = document.createElement('div')
			blocks.classList.add('block')
			container2.appendChild(blocks)
		}
		
		function animateBlocks() {
			anime({
				targets: '.block',
				translateX: function() {
					return anime.random(-700,700);
				},
				translateY: function() {
					return anime.random(-500,500);
				},
				scale: function() {
					return anime.random(1,5);
				},
				
				//easing: 'linear',
				/* duration: 3000,
				delay: anime.stagger(1),
				complete: animateBlocks, */
			})
		}
		
		animateBlocks()
		
	</script>

<!-- 카카오 로그인 기능 -->
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
<!-- 카카오 로그인 -->
</body>
</html>
