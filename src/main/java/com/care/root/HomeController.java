package com.care.root;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.root.common.MemberSessionName;
import com.care.root.member.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController implements MemberSessionName {
	@Autowired MemberService ms;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@GetMapping("index")
	public String index() {
		//System.out.println("컨트롤러의 index 실행");
		return "index";
	}
	@PostMapping(value="ajax_kakaoLogin", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String ajaxKakaoLogin(@RequestBody Map kakao_info, HttpSession session, HttpServletResponse response) {	
		//System.out.println("아이디 : " + kakao_info.get("id"));
		//System.out.println("이메일 : " + kakao_info.get("email"));
		
		String email = ms.KakaoLoginChk(kakao_info.get("id").toString(), kakao_info.get("email").toString());
		
		if(!email.equals("0")){
			session.setAttribute(LOGIN, email);
			session.setAttribute(KAKAOLOGIN, email);
			System.out.println("세션명 : " +  session.getAttribute(KAKAOLOGIN));
			System.out.println("카카오 로그인성공");
			return email;
		}
		else {
			int result = ms.KakaoRegister(kakao_info.get("id").toString(), kakao_info.get("email").toString());
			if(result == 1) {
				if(session.getAttribute( KAKAOLOGIN ) == null) {
					session.setAttribute(KAKAOLOGIN, kakao_info.get("email").toString());
				}
				System.out.println("가입성공 : " + kakao_info.get("email").toString());
				return kakao_info.get("email").toString();
			}else {
				System.out.println("문제발생");
				return "login";
			}
		}
		
	}
}
