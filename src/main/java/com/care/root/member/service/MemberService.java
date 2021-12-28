package com.care.root.member.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;

public interface MemberService {
	public int userCheck(String id, String pw);
	public void memberInfo(Model model, int num);
	public void kakaoMemberInfo(Model model, int num);
	public void info(Model model, String id);
	public void kakaoInfo(Model model, String email);
	public int register(MemberDTO dto);
	public void keepLogin(String sessionId, Date limitDate, String id);//sql쪽 Date로 가져와야함
	public MemberDTO getUserSessionId(String sessionId);
	public String KakaoLoginChk(String id, String email);
	public int KakaoRegister(String id, String email);
	public int mypage(Model model, String kakaoSessionName, String sessionName);
	public int modify_save(HttpServletRequest request, HttpServletResponse response);
	
	public String txtIdChk(String id);
	public void bookingList(Model model);
	public void searchId(Model model, String userId, int num);
	public void searchEmail(Model model,String userEmail ,int num);
}

