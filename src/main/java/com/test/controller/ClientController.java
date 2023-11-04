package com.test.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.Domain.Member;
import com.test.Dto.MemberDto;
import com.test.service.ClientService;
import com.test.service.MemberService;
import com.test.vo.LeisureVO;
import com.test.vo.LodgingRoomVO;
import com.test.vo.LodgingVO;
import com.test.vo.PayVO;

@Controller // @Controller 애노테이션을 설정함으로써 스프링에서 컨트롤러로 인식한다.
public class ClientController {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private ClientService clientService;

	@Autowired
	private MemberService memberService;

	LeisureVO lodingvo;
//   // main페이지
//   @GetMapping("/main") // get으로 접근하는 매핑주소 처리
//   public ModelAndView clientMainPage() {
//      return new ModelAndView("/client/main/main");
//   }// clientMainPage()

	// 페이징과 검색기능이 되는 자료실 목록
	@RequestMapping("/lodging_list")
	public ModelAndView lodging_list(Authentication authentication, PayVO pay, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (authentication == null) {
			out.println("<script>");
			out.println("alert('로그인시 이용 가능합니다!');");
			out.println("location='main';");
			out.println("</script>");
			return null;
		} else {
			String lodging_type = (String) request.getParameter("type");
			String CHECK_IN = (String) request.getParameter("CHECK_IN");
			String CHECK_OUT = (String) request.getParameter("CHECK_OUT");
			String diff = (String) request.getParameter("diff");
			System.out.println(diff);
			String men = (String) request.getParameter("men");

			session.setAttribute("CHECK_IN", CHECK_IN);// 체크인
			session.setAttribute("CHECK_OUT", CHECK_OUT);// 체크아웃
			session.setAttribute("men", men);// 인원
			session.setAttribute("diff", diff);// 인원

			List<LodgingVO> lodginglist = this.clientService.getLodgingList(lodging_type); // 검색 전후 목록

			ModelAndView ld_detail = new ModelAndView("./client/main/lodging");
			ld_detail.addObject("lodginglist", lodginglist);

			return ld_detail;
		}
		// 경로 설정=> /WEB-INF/views/client/main/lodging.jsp
	}// lodging_list()
		// 페이징과 검색기능이 되는 자료실 목록

	@RequestMapping("/lodgingRoom_list")
	public ModelAndView lodgingRoom_list(HttpServletRequest request, HttpSession session) throws Exception {

		String lodging_id = (String) request.getParameter("lodging_id");
//		int men = Integer.parseInt((String) session.getAttribute("men"));
		String men = (String) session.getAttribute("men");

		session.setAttribute("lodging_id", lodging_id);

		List<LodgingRoomVO> roomlist = this.clientService.getRoomList(lodging_id); // 검색 전후 목록
		String type = this.clientService.getRoomType(lodging_id);
		ModelAndView rlist = new ModelAndView("./client/main/lodgingRoomDetail");

		rlist.addObject("roomlist", roomlist);
		rlist.addObject("type", type);
		rlist.addObject("lodging_id", lodging_id);
		rlist.addObject("men", men);

		return rlist;
		// 경로 설정=> /WEB-INF/views/client/main/lodging.jsp
	}// lodging_list()

	@RequestMapping("/pay")
	public ModelAndView pay(Authentication authentication, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		String room_id = (String) request.getParameter("room_id");
		String roomname = (String) request.getParameter("roomname");
		int rp = Integer.parseInt(request.getParameter("rp"));// 일반 금액
		String username = authentication.getName();// 회원아이디
		String name = memberService.getNameByUsername(username);// 회원이름

		String diff = (String) session.getAttribute("diff");
		int dif = Integer.parseInt(diff);
		int pay = rp * dif;
		// "pay"라는 이름으로 결제 금액을 세션에 저장합니다.
		session.setAttribute("room_id", room_id);// 방 아이디
		session.setAttribute("roomname", roomname);// 방이름
		session.setAttribute("pay", pay);// 결제금액
		MemberDto m = clientService.getMember(name);

		String phon = m.getPhone();

		ModelAndView plist = new ModelAndView("./client/main/pay");

		plist.addObject("PEOPLE_NUM", session.getAttribute("men"));
		plist.addObject("phon", phon);
		plist.addObject("m", m);
		plist.addObject("pay", pay);
		return plist;// .addObject("paylist",
		// 경로 설정=> /WEB-INF/views/client/main/lodging.jsp }//
	}
	// lodging_list()

	// 추가한 부분(레저 결제)
	@RequestMapping("/l_pay")
	public ModelAndView l_pay(Authentication authentication, HttpServletRequest request, Model model,
			HttpSession session) throws Exception {

		String username = authentication.getName();
		String name = memberService.getNameByUsername(username);
		String leisure_id = request.getParameter("leisure_id");

		MemberDto m = clientService.getMember(name);
		LeisureVO leivo = clientService.getLeisure(leisure_id);

		session.setAttribute("leivo", leivo);
		session.setAttribute("leisure_id", leisure_id);

		String phon = m.getPhone();

		String pay_type = (String) request.getParameter("type");
		String men = (String) request.getParameter("men");

		// List<PayVO> pay = this.clientService.getPayList();

		ModelAndView l_plist = new ModelAndView("./client/main/l_pay");

		l_plist.addObject("PEOPLE_NUM", men);
		l_plist.addObject("phon", phon);
		l_plist.addObject("m", m);
		l_plist.addObject("leivo", leivo);
		return l_plist;
	}

	@RequestMapping("/t_pay")
	public ModelAndView t_pay(Authentication authentication, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		String username = authentication.getName();
		String name = memberService.getNameByUsername(username);

		MemberDto m = clientService.getMember(name);
		String room_id = (String) request.getParameter("room_id");
		String roomname = (String) request.getParameter("roomname");
		int rtp = Integer.parseInt((String) request.getParameter("rtp"));

		int pay = rtp * Integer.parseInt((String) session.getAttribute("diff"));
		// "pay"라는 이름으로 결제 금액을 세션에 저장합니다.
		session.setAttribute("room_id", room_id);// 방 아이디
		session.setAttribute("roomname", roomname);
		session.setAttribute("t_pay", pay);
		String phon = m.getPhone();

		ModelAndView t_plist = new ModelAndView("./client/main/t_pay");

		t_plist.addObject("PEOPLE_NUM", session.getAttribute("men"));
		t_plist.addObject("phon", phon);
		t_plist.addObject("m", m);
		t_plist.addObject("t_pay", pay);

		return t_plist;// .addObject("paylist",
		// 경로 설정=> /WEB-INF/views/client/main/lodging.jsp }//
	}

	@RequestMapping("/buy")
	public ModelAndView buy(HttpServletRequest request, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("/client/main/buy");

		// 예약자 이름과 전화번호를 HttpServletRequest를 통해 받아옴
		String reservName = request.getParameter("reserv_name");
		String reservPhone = request.getParameter("reserv_phone");

		// 체크인 날짜, 체크아웃 날짜, 인원 수를 HttpServletRequest를 통해 받아옴
		String CHECK_IN = request.getParameter("CHECK_IN");
		String CHECK_OUT = request.getParameter("CHECK_OUT");
		String PEOPLE_NUM = request.getParameter("PEOPLE_NUM");
		String visitMethod = request.getParameter("visit_method");
		String totalPrice = request.getParameter("totalPrice");
		String toiceaaa = (String) session.getAttribute("roomname");
		int toice = (int) session.getAttribute("pay");
		System.out.println(toiceaaa);
		System.out.println(toice);
		// 예약자 이름과 전화번호, 체크인 날짜, 체크아웃 날짜, 인원 수를 세션에 저장
		session.setAttribute("reservName", reservName);
		session.setAttribute("reservPhone", reservPhone);
		session.setAttribute("CHECK_IN", CHECK_IN);
		session.setAttribute("CHECK_OUT", CHECK_OUT);
		session.setAttribute("PEOPLE_NUM", PEOPLE_NUM);
		session.setAttribute("visitMethod", visitMethod);
		session.setAttribute("totalPrice", totalPrice);
		modelAndView.addObject("reservName", reservName);
		modelAndView.addObject("reservPhone", reservPhone);

		return modelAndView;
	}

	@RequestMapping("/success")
	public String success(HttpSession session) {
		String reservName = (String) session.getAttribute("reservName");
		String reservPhone = (String) session.getAttribute("reservPhone");

		String CHECK_IN = (String) session.getAttribute("CHECK_IN");
		String CHECK_OUT = (String) session.getAttribute("CHECK_OUT");
		String PEOPLE_NUM = (String) session.getAttribute("PEOPLE_NUM");
		String visitMethod = (String) session.getAttribute("visitMethod");
		if (reservName != null) {
			System.out.println("예약자 이름: " + reservName);
		} else {
			System.out.println("예약자 이름이 제공되지 않았습니다.");
		}

		if (reservPhone != null) {
			System.out.println("예약자 전화번호: " + reservPhone);
		} else {
			System.out.println("예약자 전화번호가 제공되지 않았습니다.");
		}

		if (CHECK_IN != null) {
			System.out.println("체크인 날짜: " + CHECK_IN);
		} else {
			System.out.println("체크인 날짜가 제공되지 않았습니다.");
		}

		if (CHECK_OUT != null) {
			System.out.println("체크아웃 날짜: " + CHECK_OUT);
		} else {
			System.out.println("체크아웃 날짜가 제공되지 않았습니다.");
		}

		if (PEOPLE_NUM != null) {
			System.out.println("인원 수: " + PEOPLE_NUM + "명");
		} else {
			System.out.println("인원 수가 제공되지 않았습니다.");
		}

		if (visitMethod != null) {
			System.out.println("방문 수단: " + visitMethod);
		} else {
			System.out.println("방문 수단이 제공되지 않았습니다.");
		}
//		clientService.addReservationtest(reservName, reservPhone, CHECK_IN, CHECK_OUT, PEOPLE_NUM, visitMethod);
		return "/client/main/success";
	}

	@RequestMapping("/fail")
	public String fail() {
		return "/client/main/fail";
	}

	@RequestMapping("/l_buy")
	public ModelAndView l_buy(HttpServletRequest request, HttpSession session) {

		ModelAndView modelAndView = new ModelAndView("/client/main/l_buy");

		String lreservName = request.getParameter("reserv-name");
		String lreservPhone = request.getParameter("reserv-phone");
		String lPEOPLE_NUM = request.getParameter("peopleNum"); // hidden input field
		String totalPrice = request.getParameter("totalPrice");

		session.setAttribute("lreservName", lreservName);
		session.setAttribute("lreservPhone", lreservPhone);
		session.setAttribute("lPEOPLE_NUM", lPEOPLE_NUM);
		session.setAttribute("totalPrice", totalPrice);

		System.out.println("lreservName: " + lreservName);
		System.out.println("lreservPhone: " + lreservPhone);
		System.out.println("lPEOPLE_NUM: " + lPEOPLE_NUM);
		System.out.println("totalPrice: " + totalPrice);

		modelAndView.addObject("totalPrice", totalPrice);

		LeisureVO leivo = (LeisureVO) session.getAttribute("leivo");
		if (leivo != null) {
			double leisurePrice = Double.parseDouble(leivo.getLeisure_price());
		} else {

		}
		return modelAndView;
	}

	@RequestMapping("/l_success")
	public String l_success(HttpSession session) {

		String lreservName = (String) session.getAttribute("lreservName"); // Note: corrected from 'reservName' to
		// 'lreservName'
		String lreservPhone = (String) session.getAttribute("lreservPhone");
		String lPEOPLE_NUM = (String) session.getAttribute("lPEOPLE_NUM");
		String totalPrice = (String) session.getAttribute("totalPrice");

//		clientService.addLReservationset(lreservName, lreservPhone, lPEOPLE_NUM);
		return "/client/main/l_success";
	}

	@RequestMapping("/l_fail")
	public String l_fail() {
		return "/client/main/l_fail";
	}

	@RequestMapping("/t_buy")
	public ModelAndView t_buy(HttpServletRequest request, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("/client/main/t_buy");

		String reservName = request.getParameter("reserv_name");
		String reservPhone = request.getParameter("reserv_phone");
		String PEOPLE_NUM = request.getParameter("PEOPLE_NUM");
		String visitMethod = request.getParameter("visit_method");
		String totalPrice = request.getParameter("totalPrice");
		session.setAttribute("reservName", reservName);
		session.setAttribute("reservPhone", reservPhone);
		session.setAttribute("PEOPLE_NUM", PEOPLE_NUM);
		session.setAttribute("visitMethod", visitMethod);
		session.setAttribute("totalPrice", totalPrice);

		session.setAttribute("CHECK_OUT", session.getAttribute("CHECK_IN"));// 체크아웃값 제거

		modelAndView.addObject("reservName", reservName);
		modelAndView.addObject("reservPhone", reservPhone);
		return modelAndView;
	}

	@RequestMapping("/t_success")
	public String t_success(HttpSession session) {

		String reservName = (String) session.getAttribute("reservName");
		String reservPhone = (String) session.getAttribute("reservPhone");
		String PEOPLE_NUM = (String) session.getAttribute("PEOPLE_NUM");
		String visitMethod = (String) session.getAttribute("visitMethod");

//		clientService.addtReservationtest(reservName, reservPhone, PEOPLE_NUM, visitMethod);
		return "/client/main/t_success";
	}

	@RequestMapping("/t_fail")
	public String t_fail() {
		return "/client/main/t_fail";
	}

	@RequestMapping("/memInfo_list")
	public ModelAndView memInfo_list(Authentication authentication, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (authentication == null) {
			out.println("<script>");
			out.println("alert('로그인시 이용 가능합니다!');");
			out.println("location='main';");
			out.println("</script>");
			return null;
		} else {
			String username = authentication.getName();// 유저아이디

			Member user = memberService.getUser(username);

			ModelAndView ld_detail = new ModelAndView("./client/main/memInfo");
			ld_detail.addObject("user", user);

			return ld_detail;
		}
	}

	@RequestMapping("/leisure_list")
	public ModelAndView leisure_list(Authentication authentication, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		session.invalidate();// 모든세션 제거
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (authentication == null) {
			out.println("<script>");
			out.println("alert('로그인시 이용 가능합니다!');");
			out.println("location='main';");
			out.println("</script>");
			return null;
		} else {

			List<LeisureVO> leisurelist = this.clientService.getLeisureList(); // 검색 전후 목록

			return new ModelAndView("./client/main/leisure").addObject("leisurelist", leisurelist);
		}
	}// leisure_list()

	@RequestMapping("/gongji_list")
	public ModelAndView gongji_list(HttpServletRequest request) throws Exception {

		// List<LeisureVO> leisurelist = this.clientService.getLeisureList(); // 검색 전후
		// 목록

		return new ModelAndView("./client/main/gongji");// .addObject("leisurelist", leisurelist);
	}// leisure_list()

	@RequestMapping("/intro_list")
	public ModelAndView intro_list(HttpServletRequest request) throws Exception {

		// List<LeisureVO> leisurelist = this.clientService.getLeisureList(); // 검색 전후
		// 목록

		return new ModelAndView("./client/main/intro");// .addObject("leisurelist", leisurelist);
	}// leisure_list()

	@RequestMapping("/chatbot_list")
	public ModelAndView chatbot_list(HttpServletRequest request) throws Exception {

		// List<LeisureVO> leisurelist = this.clientService.getLeisureList(); // 검색 전후
		// 목록

		return new ModelAndView("./client/main/chatbot");// .addObject("leisurelist", leisurelist);
	}// leisure_list()

	@RequestMapping("/event_list")
	public ModelAndView event_list(HttpServletRequest request) throws Exception {

		// List<LeisureVO> leisurelist = this.clientService.getLeisureList(); // 검색 전후
		// 목록

		return new ModelAndView("./client/main/event");// .addObject("leisurelist", leisurelist);
	}// leisure_list()

}