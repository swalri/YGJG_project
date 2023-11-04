package com.test.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.Dto.MemberDto;
import com.test.service.AdminService;
import com.test.vo.CouponVO;
import com.test.vo.PageVO;

@Controller // @Controller 애노테이션을 설정함으로써 스프링에서 컨트롤러로 인식한다.
public class AdminCouponController {

	@Autowired
	private AdminService adminService;

	// 쿠폰 리스트 페이지
	@RequestMapping("/admin/coupon_list")
	public ModelAndView coupon_list(//
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
		int listcount = this.adminService.getCouponListCount(p);
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

		// 쿠폰 목록
		List<CouponVO> couponlist = this.adminService.getCouponList(p);

		// 페이지
		ModelAndView listM = new ModelAndView("/admin/coupon/coupon_list");

		// couponlist 키이름에 값 저장
		listM.addObject("couponlist", couponlist);
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
		// 뷰페이지 폴더경로와 파일명 지정
//		}
//		return null;
	}// coupon_list()

	// 추가 페이지
	@GetMapping("/admin/coupon_write")
	public ModelAndView coupon_write(HttpServletRequest request) throws Exception {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		ModelAndView cm = new ModelAndView("/admin/coupon/coupon_write");
		cm.addObject("page", page);

		return cm;
	}// coupon_write()

	// 추가 실행
	@PostMapping("/admin/coupon_write_ok")
	public String coupon_write_ok(@ModelAttribute CouponVO cpa, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		this.adminService.insertCoupon(cpa);
		return "redirect:/admin/coupon_list";
	}// coupon_write_ok()

	// 상태 변경
	@RequestMapping("/admin/coupon_menu")
	public ModelAndView coupon_menu(@RequestParam int page, //
			@RequestParam String cp_id, //
			@RequestParam String state, //
			HttpServletResponse response//
	) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		ModelAndView menuMVC = new ModelAndView("redirect:/admin/coupon_list?page=" + page);//view페이지 설정
		CouponVO cp_cont = this.adminService.getCouponCont(cp_id);// 쿠폰 정보 출력

		switch (state) {
		case "status":// 상태
			this.adminService.setCouponStatus(cp_id);// 상태 수정
			break;
		case "edit":// 수정
			menuMVC.setViewName("/admin/coupon/coupon_edit");
			menuMVC.addObject("cp_edit", cp_cont);
			break;
		case "issu":// 배포
			if (cp_cont.getCp_status() == 0) {
				out.println("<script>");
				out.println("alert('이 쿠폰은 현재 배포가 불가능한 상태입니다');");
				out.println("</script>");
			} else {
				// 회원 목록
				List<MemberDto> mlist = this.adminService.getCouponIssuList(cp_id);
				menuMVC.setViewName("/admin/coupon/coupon_issu");
				menuMVC.addObject("cp", cp_cont);
				menuMVC.addObject("mlist", mlist);
			}
			break;
		case "delete":// 삭제
			this.adminService.deleteCoupon(cp_id);// 삭제
			break;
		default:
			break;
		}

		return menuMVC;
	}// coupon_status()

	// 수정 실행
	@RequestMapping("/admin/coupon_edit_ok")
	public String coupon_edit_ok(@ModelAttribute CouponVO cp, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		this.adminService.setCouponUpdate(cp);// 쿠폰 정보 업데이트
		return "redirect:/admin/coupon_list";
	}// coupon_edit_ok()

	// 배포 실행
	@PostMapping("/admin/coupon_issu")
	public void coupon_issu_ok(//
			@RequestParam(value = "mlist[]") List<String> mlist, //
			@RequestParam(value = "cp_id") String cp_id, //
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		for (String mem_id : mlist) {
			this.adminService.setCouponIssu(cp_id, mem_id);// 쿠폰 정보 업데이트
		}

		out.println("/admin/coupon_list");

	}// coupon_issu_ok()

}// class
