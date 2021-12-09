package com.care.root.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.KakaoMemberDTO;
import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired MemberMapper mapper;
	//실제로 만들때는 bean이 만들어지는지 꼭 테스트로 체크하고 넘어가는게 좋다
	
	BCryptPasswordEncoder encoder;
	//비밀번호 암호화
	
	public MemberServiceImpl() {
		encoder = new BCryptPasswordEncoder();
	}
	
	@Override
	public int userCheck(String id, String pw) {
		MemberDTO dto = mapper.userCheck(id);
		if(dto != null) {
			//if(pw.equals(dto.getPw())) {
			if(encoder.matches(pw, dto.getPw())) {
				//앞에는 사용자가 입력한값, 뒤에는 데이터베이스에서 가져온 값을 입력해야함. 이렇게 바꾼 이후에는 평문으로 저장된 암호는 로그인되지 않음
				return 0;
				//로그인성공
			}
		}
		return 1;
		//dto가 null = 해당하는 아이디가 없는경우, 혹은 비밀번호가 틀린경우
	}

	@Override
	public void memberInfo(Model model) {
		model.addAttribute("memberList", mapper.memberInfo());
		//memberList라는 이름으로 arrayList값을 꺼내서 쓸 수 있다.
		//memberInfo.jsp에서 forEach를 이용해 리스트를 표로 만들어 사용함
	}

	@Override
	public void info(Model model, String id) {
		model.addAttribute("info", mapper.userCheck(id));
	}

	@Override
	public int register(MemberDTO dto) {
		
		System.out.println("비번 변경 전 : " + dto.getPw());
		String securePw = encoder.encode(dto.getPw());
		System.out.println("비번 변경 후 : " + securePw);
		
		dto.setPw(securePw);
		//비밀번호를 암호화해서 저장함
		
		int result = 0;
		try {
			result = mapper.register(dto);
			//동일한 아이디(유일값)으로 가입할경우, 에러가 뜨는걸 방지하기 위해서 넣는 예외처리
			//가입성공시 result에 1이 들어옴
		} catch (Exception e) {
			e.printStackTrace();
			//가입실패시 개발자가 보는 콘솔창에 로그는 띄우지만 사용자가 보는 페이지는 계속 동작하게 함
		}
		
		return result;
	}

	@Override
	public void keepLogin(String sessionId, Date limitDate, String id) {
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("sessionId", sessionId);
		map.put("limitDate", limitDate);
		map.put("id", id);
		mapper.keepLogin(map);	//개별적으로 세개값을 넘겨줘도 되고,  map으로 넘겨줘도 됨
	}

	@Override
	public MemberDTO getUserSessionId(String sessionId) {
		
		return mapper.getUserSessionId(sessionId);
	}

	@Override
	public String KakaoLoginChk(String id, String email) {
		//System.out.println("서비스 : " + id);
		//System.out.println("서비스 : " + email);
		
		KakaoMemberDTO dto = mapper.KakaoLoginChk(id);
		
		if(dto != null) {
			return dto.getEmail();
		}else {
			return "0";
		}
		
	}

	@Override
	public int KakaoRegister(String id, String email) {
		int result = 0;
		try {
			result = mapper.KakaoRegister(id, email);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int mypage(Model model, String kakaoSessionName, String sessionName) {
		//System.out.println("서비스 세션명 : " + kakaoSessionName);
		if(kakaoSessionName == null) {
			model.addAttribute("info", mapper.userCheck(sessionName));
			return 0;
		}
		else {
			model.addAttribute("info", mapper.kakaoMemberInfo(kakaoSessionName));
			return 1;
		}
	}

	@Override
	public int modify_save(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String loginWay = request.getParameter("loginWay");
		if(loginWay.equals("1")) {
			KakaoMemberDTO dto = new KakaoMemberDTO();
			dto.setId(request.getParameter("id"));
			dto.setEmail(request.getParameter("email")); 
			dto.setAddr(request.getParameter("addr1"));
			//System.out.println(dto.getId() + "/" + dto.getEmail() + "/" + dto.getAddr());
			
			result = mapper.kakao_modify_save(dto);
			
		}else {
			MemberDTO dto = new MemberDTO();
			dto.setId(request.getParameter("id"));
			dto.setAddr(request.getParameter("addr1"));
			
			String pw = request.getParameter("pw");
			if(pw.equals("")) {
				
				PrintWriter out = null;
				response.setContentType("text/html; charset=utf-8");
				try {
					out = response.getWriter();
				} catch (Exception e) {
					e.printStackTrace();
				}
				out.print("<script> alert('수정실패 : 변경할 비밀번호를 입력해주세요');"
						+ "location.href='modify'; </script>");
			}
			else {
			String securePw = encoder.encode(pw);
			dto.setPw(securePw);
			
			result = mapper.modify_save(dto);
			}
		}
		return result;
	}

}
