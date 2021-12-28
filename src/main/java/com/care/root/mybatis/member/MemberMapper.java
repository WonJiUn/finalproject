package com.care.root.mybatis.member;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.care.root.member.dto.BookingDTO;
import com.care.root.member.dto.KakaoMemberDTO;
import com.care.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO userCheck(String id);
	public ArrayList<MemberDTO> memberInfo(@Param("s") int start, @Param("e") int end);
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
	public int kakao_modify_save(KakaoMemberDTO dto);
	public int modify_save(MemberDTO dto);
	public ArrayList<KakaoMemberDTO> kakaomemberList(@Param("s") int start, @Param("e") int end);
	public int selectMemberCount();
	public int selectKakaomemberCount();
	//관리자페이지 페이징을 위한 코드
	public ArrayList<BookingDTO> bookingList();
	public ArrayList<MemberDTO> searchId(@Param("userId")String userId, @Param("s") int start, @Param("e") int end);
	public ArrayList<KakaoMemberDTO> searchEmail(@Param("userEmail")String userEmail, @Param("s") int start, @Param("e") int end);
	public Integer selectSearchIdCount(String userId);
	public Integer selectSearchEmailCount(String userEmail);
}
