package com.care.root.mybatis.member;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.care.root.member.dto.KakaoMemberDTO;
import com.care.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO userCheck(String id);
	public ArrayList<MemberDTO> memberInfo();
	public int register(MemberDTO dto);
	//dto의 id, pw, addr값을 가져가서 쓸수있다.
	public void keepLogin(Map<String, Object> map);
	public MemberDTO getUserSessionId(String sessionId);
	public KakaoMemberDTO KakaoLoginChk(String id);
	public int KakaoRegister(@Param("id") String id, @Param("email")String email);
	//@Param 어노테이션 + xml 파일의 parameterType="map"은
	//Parameter 'id' not found. Available parameters are [arg1, arg0, param1, param2]
	//라는 오류가 발생하여 해결하기 위해 넣었음
	public KakaoMemberDTO kakaoMemberInfo(String email);
}
