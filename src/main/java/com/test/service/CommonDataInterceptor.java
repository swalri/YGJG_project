package com.test.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class CommonDataInterceptor implements HandlerInterceptor {

   @Autowired
   private MemberService memberService;

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      // preHandle 메서드는 컨트롤러 실행 전에 호출됩니다.
      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
      if (authentication != null && authentication.isAuthenticated()) {
         String username = authentication.getName();
         String name = memberService.getNameByUsername(username);
         request.setAttribute("name", name);
      }
      return true; // true를 반환하여 컨트롤러 실행을 계속합니다.
   }

   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {
      // postHandle 메서드는 컨트롤러 실행 후에 호출됩니다.
      // modelAndView에 데이터를 추가할 수 있습니다.
      if (modelAndView != null) {
         String name = (String) request.getAttribute("name");
         modelAndView.addObject("name", name);
      }
   }
}