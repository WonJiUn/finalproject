package com.care.root.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.care.root.common.MemberSessionName;

public class MemberInterceptor extends HandlerInterceptorAdapter implements MemberSessionName {
//우클릭 - 소스 - 오버라이드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		String requestUrl = request.getRequestURL().toString();
		
		if(requestUrl.contains("/login")){
			return true;
		}
		
		else if(session.getAttribute(LOGIN) == null) {
			//response.sendRedirect("login");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인 후 이용해 주시기 바랍니다');"
					+ " location.href='" + request.getContextPath() + "/member/login'; </script>");
			return false;
			//true면 사용자가 요청한 경로 그대로 들어가고, false면 해당하는 경로로 연결하지 않겠다는 뜻
		}
		//System.out.println("index(컨트롤러) 실행 전 실행");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//System.out.println("index(컨트롤러) 실행 후 실행");
	}

}
