package com.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.service.AdminService;
import com.test.vo.LeisureVO;
import com.test.vo.LodgingRoomVO;
import com.test.vo.LodgingVO;
import com.test.vo.PageVO;

@Controller
public class AdminLodgingController {

	@Autowired
	private AdminService adminService;

	// 숙소 페이지
	@RequestMapping("/admin/lodging_list")
	public ModelAndView lodging_list(//
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
		int listcount = this.adminService.getLodgingListCount(p);
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
		List<LodgingVO> lodlist = this.adminService.getLodgingList(p);

		// 페이지
		ModelAndView listL = new ModelAndView("/admin/lodging/lodging_list");

		// lodlist 키이름에 값 저장
		listL.addObject("lodlist", lodlist);
		// 페이지 값 저장
		listL.addObject("page", page);
		// 처음 시작 페이지
		listL.addObject("startpage", startpage);
		// 마지막 페이지
		listL.addObject("endpage", endpage);
		// 최대 페이지 마지막페이지랑 다른 용도로 사용되지만 값은 같은것이다ㄴ
		listL.addObject("maxpage", maxpage);
		// 이름 검색
		listL.addObject("find_name", find_name);

		return listL;
	}// lodging_list()

	// 숙소 상세정보
	// 내용 보기
	@RequestMapping("/admin/{lod_id}")
	public ModelAndView lodging_cont(//
			@PathVariable String lod_id, //
			@ModelAttribute PageVO p, //
			HttpServletResponse response, //
			HttpServletRequest request//
	) throws Exception {
		response.setContentType("text/html;charset=UTF-8");

		int page = 1;// 쪽번호
		int limit = 5;// 한페이지에 보여지는 목록개수

		if (request.getParameter("page") != null) {// 받는 값에 page가 있을경우
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 생각해야될것
		String find_name = "";
		find_name = request.getParameter("find_name");// 검색어
		p.setFind_name("%" + find_name + "%");// 이름 지정
		// %는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와 매핑 대응

		// 전체 레코드 개수 또는 검색전후 레코드 개수
		int listcount = this.adminService.getRoomListCount(lod_id);
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

		ModelAndView lodmv = new ModelAndView("/admin/lodging/lodging_cont");
		LodgingVO lod = this.adminService.getLodgingCont(lod_id);// 숙소 정보

		List<LodgingRoomVO> room = this.adminService.getRoomList(lod_id, p);

		// 숙소정보
		lodmv.addObject("lod", lod);
		// 숙소 방 정보
		lodmv.addObject("room", room);
		// 페이지 값 저장
		lodmv.addObject("page", page);
		// 처음 시작 페이지
		lodmv.addObject("startpage", startpage);
		// 마지막 페이지
		lodmv.addObject("endpage", endpage);
		// 최대 페이지 마지막페이지랑 다른 용도로 사용되지만 값은 같은것이다ㄴ
		lodmv.addObject("maxpage", maxpage);
		// 이름 검색
		lodmv.addObject("find_name", find_name);

		return lodmv;
	}// lodging_cont()

	@RequestMapping("/admin/lodging_del")
	public String lodging_del(//
			String lod_id, //
			HttpServletResponse response //
	) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		this.adminService.deleteLodging(lod_id);
		return "redirect:/admin/lodging_list";
	}// lodging_del()

	@RequestMapping("/admin/{lod_id}/room_del")
	public String room_del(//
			@PathVariable String lod_id, //
			String room_id, //
			HttpServletResponse response //
	) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		this.adminService.deleteRoom(lod_id, room_id);
		return "redirect:/admin/" + lod_id;
	}// room_del()

	// 레저 페이지
	@RequestMapping("/admin/leisure_list")
	public ModelAndView leisure_list(//
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
		int listcount = this.adminService.getLeisureListCount(p);
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
		List<LeisureVO> leisurelist = this.adminService.getLeisureList(p);

		System.out.println(leisurelist);

		// 페이지
		ModelAndView listL = new ModelAndView("/admin/lodging/leisure_list");

		// lodlist 키이름에 값 저장
		listL.addObject("leisure", leisurelist);
		// 페이지 값 저장
		listL.addObject("page", page);
		// 처음 시작 페이지
		listL.addObject("startpage", startpage);
		// 마지막 페이지
		listL.addObject("endpage", endpage);
		// 최대 페이지 마지막페이지랑 다른 용도로 사용되지만 값은 같은것이다ㄴ
		listL.addObject("maxpage", maxpage);
		// 이름 검색
		listL.addObject("find_name", find_name);

		return listL;
	}// leisure_list()

}// class
