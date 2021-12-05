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
<div align="center"><h1>로그인 페이지 입니다</h1></div>
<div align="right">
    <form action = "/root/member/user_check" method="post">
        <table>
  <tr>
  <td><input type="text" name="id" placeholder="아이디"></td>
  <td rowspan="2">
  <input type="submit" value="로그인"style="width:60px;height:55px;">
  </td></tr>
  <tr><td><input type="text" name="pw" placeholder="비밀번호"></td></tr>
  <tr><td colspan="2" align="left"><a href="register_form">회원가입</a>
  		<input type="checkbox" name="autoLogin">로그인 유지
  			</td></tr>
        </table>
    </form>

   
    <a id="custom-login-btn" href="javascript:loginWithKakao()">
  <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/>
</a>
<div onclick="kakaoLeave();"><a href="javascript:void(0)"><span>카카오 연결해제(DB삭제기능 미구현)</span></a></div>

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
    		        	alert('이메일 제공에 동의해주세요 - 연결 해제 후 다시가입 필요')
    		        	//카카오 이메일 계정을 필수동의로 설정하지 못하여 발생한 문제
    		        	location.href="login";
    		        }
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
<c:import url="../default/footer.jsp"/>

</body>
</html>