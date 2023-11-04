package com.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.service.AdminService;
import com.test.vo.GongjiVO;
import com.test.vo.PageVO;

@Controller // @Controller 애노테이션을 설정함으로써 스프링에서 컨트롤러로 인식한다.
public class AdminGongjiController {

	@Autowired
	private AdminService adminService;

	// 공지 리스트 페이지
	@RequestMapping("/admin/gongji_list")
	public ModelAndView gongji_list(//
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
		int listcount = this.adminService.getGongjiListCount(p);
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

		// 공지 목록
		List<GongjiVO> gongjilist = this.adminService.getGongjiList(p);

		// 페이지
		ModelAndView listG = new ModelAndView("/admin/gongji/gongji_list");

		// gongjilist 키이름에 값 저장
		listG.addObject("gongjilist", gongjilist);
		// 페이지 값 저장
		listG.addObject("page", page);
		// 처음 시작 페이지
		listG.addObject("startpage", startpage);
		// 마지막 페이지
		listG.addObject("endpage", endpage);
		// 최대 페이지 마지막페이지랑 다른 용도로 사용되지만 값은 같은것이다ㄴ
		listG.addObject("maxpage", maxpage);
		// 이름 검색
		listG.addObject("find_name", find_name);

		return listG;
		// 뷰페이지 폴더경로와 파일명 지정
	}// gongji_list()

	// 추가 페이지
	@GetMapping("/admin/gongji_write")
	public ModelAndView gongji_write(HttpServletRequest request) throws Exception {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		ModelAndView gm = new ModelAndView("/admin/gongji/gongji_write");
		gm.addObject("page", page);

		return gm;
	}// gongji_write()

	// 추가 실행
	@PostMapping("/admin/gongji_write_ok")
	public String gongji_write_ok(@ModelAttribute GongjiVO gpa, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		this.adminService.insertGongji(gpa);
		return "redirect:/admin/gongji_list";
	}// gongji_write_ok()

	// 수정 페이지
	@RequestMapping("/admin/gongji_edit")
	public ModelAndView gongji_edit(String gongji_no, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		GongjiVO g_edit = this.adminService.getGongjiCont(gongji_no);// 수정할 쿠폰 정보 출력
		ModelAndView editM = new ModelAndView("/admin/gongji/gongji_edit");
		editM.addObject("g", g_edit);
		return editM;
	}// gongji_edit()

	// 수정 실행
	@RequestMapping("/admin/gongji_edit_ok")
	public String gongji_edit_ok(@ModelAttribute GongjiVO g, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		System.out.println(g.getGongji_no());
		System.out.println(g.getGongji_name());
		System.out.println(g.getGongji_title());
		this.adminService.setGongjiUpdate(g);// 쿠폰 정보 업데이트
		return "redirect:/admin/gongji_list";
	}// gongji_edit_ok()

	// 삭제 실행
	@RequestMapping("/admin/gongji_del")
	public String gongji_del(String gongji_no, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		this.adminService.deleteGongji(gongji_no);
		return "redirect:/admin/gongji_list";// ?page=" + page;
	}// gongji_del()

}// class
