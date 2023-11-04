package com.test.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.Dto.MemberDto;
import com.test.service.MemberService;

@Controller
public class MemberController {

	private final MemberService memberService;

	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	// 메인 페이지로 이동하는 요청을 처리하는 메서드
	@GetMapping("/main")
	public String index(Authentication authentication, Model model, HttpSession session) {
		if (authentication != null && authentication.isAuthenticated()) {
			String username = authentication.getName();
			// MemberService를 사용하여 name 정보 가져오기
			String name = memberService.getNameByUsername(username);
			session.setAttribute("username", username);// 체크인
			model.addAttribute("name", name);
		}
		return "client/main/main";
	}

	// 회원가입 양식 페이지로 이동하는 요청을 처리하는 메서드
	@GetMapping("/signup")
	public String signupForm(Model model) {
		model.addAttribute("member", new MemberDto());
		return "client/main/signup";
	}

	// 회원가입을 처리하는 POST 요청을 처리하는 메서드
	@PostMapping("/signup")
	public String signup(@Valid MemberDto memberDto, BindingResult bindingResult) {
		// 유효성 검사 결과에 따라 처리
		if (bindingResult.hasErrors()) {
			// 유효성 검사 에러가 있으면 다시 회원가입 양식 페이지로 이동
			return "client/main/signup";
		}
		// 회원가입 서비스 호출
		memberService.signUp(memberDto);
		// 회원가입 후 메인 페이지로 리다이렉트
		return "redirect:/main";
	}

	// 로그인 양식 페이지로 이동하는 요청을 처리하는 메서드
	@GetMapping("/login")
	public String loginForm() {
		return "client/main/login";
	}

}
