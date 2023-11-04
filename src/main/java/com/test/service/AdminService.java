package com.test.service;

import java.util.HashMap;
import java.util.List;

import com.test.Dto.MemberDto;
import com.test.vo.CouponVO;
import com.test.vo.GongjiVO;
import com.test.vo.LeisureVO;
import com.test.vo.LodgingRoomVO;
import com.test.vo.LodgingVO;
import com.test.vo.PageVO;
import com.test.vo.ReservationLodgingVO;

public interface AdminService {

	// 쿠폰 인터페이스
	int getCouponListCount(PageVO p);// 쿠폰 개수 출력

	List<CouponVO> getCouponList(PageVO p);// 쿠폰 목록 출력

	void insertCoupon(CouponVO cp);// 쿠폰 추가

	void setCouponStatus(String cp_id);// 쿠폰 상태

	void deleteCoupon(String cp_id);// 쿠폰 삭제

	CouponVO getCouponCont(String cp_id);// 쿠폰 내용

	List<MemberDto> getCouponIssuList(String cp_id);// 쿠폰 배포 가능한 회원 리스트

	void setCouponUpdate(CouponVO cp);// 쿠폰 수정

	void setCouponIssu(String cp_id, String mem_id);// 쿠폰 배포

	// 회원 인터페이스
	int getMemberListCount(PageVO p);// 회원 목록 수

	List<MemberDto> getMemberList(PageVO p);// 회원 목록

	void deleteMember(String mem_id);// 회원 삭제

	MemberDto getMemberCont(String mem_id);// 회원 정보 출력

	List<HashMap<String, Integer>> getMemberCouponList(String mem_id);// 회원이 가지고있는 쿠폰 리스트

	// 숙소 인터페이스
	int getLodgingListCount(PageVO p);// 숙소 개수

	List<LodgingVO> getLodgingList(PageVO p);// 숙소 목록

	int getRoomListCount(String lod_id);// 숙소에 따른 방 개수

	LodgingVO getLodgingCont(String lod_id);// 숙소 정보

	List<LodgingRoomVO> getRoomList(String lod_id, PageVO p);// 방 목록

	int getLeisureListCount(PageVO p);// 레저 개수

	List<LeisureVO> getLeisureList(PageVO p);// 레저 목록

	// 공지 인터페이스
	int getGongjiListCount(PageVO p);// 공지 개수

	List<GongjiVO> getGongjiList(PageVO p);// 공지 리스트

	void insertGongji(GongjiVO gpa);// 공지 추가

	GongjiVO getGongjiCont(String gongji_no);// 공지 내용 가져오기

	void setGongjiUpdate(GongjiVO g);// 공지 업데이트

	void deleteGongji(String gongji_no);// 공지 삭제

	int getMemberHistory(String mem_id, String id);// 회원 내역

	void deleteLodging(String lod_id);// 숙소 삭제

	void deleteRoom(String lod_id, String room_id);// 방 삭제

	List<ReservationLodgingVO> getLodgingReservList();// 예약정보 확인

	void deleteReserv(Long reserv_id);// 예약취소

}
