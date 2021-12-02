package com.care.root.member.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.care.root.common.MemberSessionName;
import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter implements MemberSessionName {
	@Autowired MemberService ms;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//오버라이딩 된것이기 때문에 값을 추가할 수 없어서 아래의 방식으로 쿠키를 가져와야함(어노테이션으로 쿠키값 가져오는거 사용불가)
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		System.out.println("loginCookie : " + loginCookie);
		
		if(loginCookie != null) {
			MemberDTO dto = ms.getUserSessionId(loginCookie.getValue());
			//사용자가 가지고있는 쿠키의 값과 DB의 값을 비교하여 있으면 dto에 사용자 정보를 저장함
			if(dto != null) {
				request.getSession().setAttribute(LOGIN, dto.getId());
				//dto가 null이 아니면 세션 생성
			}
		}
		//index로 이동
		return true;
	}

}
