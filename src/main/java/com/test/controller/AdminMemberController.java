package com.test.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.Dto.MemberDto;
import com.test.service.AdminService;
import com.test.vo.PageVO;

@Controller // @Controller 애노테이션을 설정함으로써 스프링에서 컨트롤러로 인식한다.
public class AdminMemberController {

	@Autowired
	private AdminService adminService;

	// 회원목록 페이지
	@RequestMapping("/admin/member_list")
	public ModelAndView member_list(//
			@ModelAttribute PageVO p, // 페이징
			HttpServletRequest request// 요청
	) throws Exception {
		int page = 1;// 쪽번호
		int limit = 5;// 한페이지에 보여지는 목록개수
		String find_name = "";// 검색어

		if (request.getParameter("page") != null) {// 받는 값에 page가 있을경우
			page = Integer.parseInt(request.getParameter("page"));
		}
		if (request.getParameter("find_name") != null) {// 받는 값에 page가 있을경우
			find_name = request.getParameter("find_name");// 검색어
		}
		p.setFind_name("%" + find_name + "%");// 이름 지정
		// %는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와 매핑 대응
		// 전체 레코드 개수 또는 검색전후 레코드 개수
		int listcount = this.adminService.getMemberListCount(p);
		p.setStartrow((page - 1) * 5 + 1);// 시작행번호
		p.setEndrow(p.getStartrow() + limit - 1);// 끝행번호

		// 목록
		// 총페이지수
		int maxpage = (int) ((double) listcount / limit + 0.95);
		// 현재 페이지에 보여질 시작페이지 수(1,6,11)
		int startpage = (((int) ((double) page / limit + 0.9)) - 1) * limit + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
		int endpage = maxpage;
		if (endpage > startpage + limit - 1) {
			endpage = startpage + limit - 1;
		}

		// 회원 목록
		List<MemberDto> mlist = this.adminService.getMemberList(p);

		// 페이지
		ModelAndView listM = new ModelAndView("/admin/member/member_list");

		// mlist 키이름에 값 저장
		listM.addObject("mlist", mlist);
		// 페이지 값 저장
		listM.addObject("page", page);
		// 처음 시작 페이지
		listM.addObject("startpage", startpage);
		// 마지막 페이지
		listM.addObject("endpage", endpage);
		// 최대 페이지 마지막페이지랑 다른 용도로 사용되지만 값은 같은것이다ㄴ
		listM.addObject("maxpage", maxpage);
		// 이름 검색
		listM.addObject("find_name", find_name);

		return listM;
	}// member_list()

	// 내용 보기
	@RequestMapping("/admin/member_cont_{mem_id}")
	public ModelAndView member_cont(@PathVariable String mem_id, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		ModelAndView mc = new ModelAndView("/admin/member/member_cont");
		MemberDto mem = this.adminService.getMemberCont(mem_id);// 회원정보
		List<HashMap<String, Integer>> mem_cp = this.adminService.getMemberCouponList(mem_id);
//		int history_r = this.adminService.getMemberHistory(mem_id, "reservation_id");
//		int history_c = this.adminService.getMemberHistory(mem_id, "cp_id");

		mc.addObject("mem", mem);
		mc.addObject("mem_cp", mem_cp);
//		mc.addObject("hist_r", history_r);
//		mc.addObject("hist_c", history_c);

		return mc;
	}// member_cont()

	// 회원 삭제
	@RequestMapping("/admin/member_del")
	public String member_del(String mem_id, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		this.adminService.deleteMember(mem_id);
		return "redirect:/admin/member_list";// ?page=" + page;
	}// member_del()

}// class
