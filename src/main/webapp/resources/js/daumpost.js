function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            //R : 도로명, J : 지번
            console.log("data.userSelectedType : " + data.userSelectedType)
            console.log("data.roadAddress : " + data.roadAddress)
            console.log("data.jibunAddress : " + data.jibunAddress)
            console.log("data.zonecode(우편번호) : " + data.zonecode)
            var addr = ""
            if(data.userSelectedType === 'R'){
            	addr = data.roadAddress
            }else{
            	addr = data.jibunAddress
            }
    		$("#addr1").val(data.zonecode)
    		$("#addr2").val(addr)
    		$("#addr3").focus()
    		//input에 쓴 id값과 같아야함
        }
    }).open();
}