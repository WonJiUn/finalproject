package com.care.root.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.care.root.common.MemberSessionName;

public class AdminInterceptor extends HandlerInterceptorAdapter implements MemberSessionName {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		//System.out.println("인터셉터 : " + session.getAttribute(LOGIN));
		
		if(session.getAttribute(LOGIN).equals("admin")) {
			return true;
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('잘못된 접근입니다');"
					+ " location.href='" + request.getContextPath() + "/'; </script>");
			return false;
		}
		
	}

}
