package com.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.service.AdminService;
import com.test.vo.ReservationLodgingVO;

@Controller // @Controller 애노테이션을 설정함으로써 스프링에서 컨트롤러로 인식한다.
public class AdminController {

	@Autowired
	private AdminService adminService;

	// 자료실 글쓰기 폼
	@GetMapping("/admin/main") // get으로 접근하는 매핑주소 처리, bbs_write매핑주소 등록
	public ModelAndView AdminMainPage() {
		ModelAndView ad_main = new ModelAndView("/admin/main");

		int lodging_num = this.adminService.getLodgingListCount(null);
		int member_num = this.adminService.getMemberListCount(null);
		int coupon_num = this.adminService.getCouponListCount(null);
		int gongji_num = this.adminService.getGongjiListCount(null);
		List<ReservationLodgingVO> reservlist = this.adminService.getLodgingReservList();

		ad_main.addObject("lodging_num", lodging_num);
		ad_main.addObject("member_num", member_num);
		ad_main.addObject("coupon_num", coupon_num);
		ad_main.addObject("gongji_num", gongji_num);
		ad_main.addObject("reservlist", reservlist);

		return ad_main;
	}// AdminMainPage()

	// 상태 변경
	@RequestMapping("/admin/reserv_del")
	public String reserv_del(@RequestParam Long reserv_id) throws Exception {
		this.adminService.deleteReserv(reserv_id);// 삭제
		return "redirect:/admin/main";
	}

}// class
