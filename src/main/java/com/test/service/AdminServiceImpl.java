package com.test.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.Dto.MemberDto;
import com.test.dao.AdminDAO;
import com.test.vo.CouponVO;
import com.test.vo.GongjiVO;
import com.test.vo.LeisureVO;
import com.test.vo.LodgingRoomVO;
import com.test.vo.LodgingVO;
import com.test.vo.PageVO;
import com.test.vo.ReservationLodgingVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDao;

	/****************************************************/
	// 쿠폰 개수
	@Override
	public int getCouponListCount(PageVO p) {
		return this.adminDao.getCouponListCount(p);
	}

	// 쿠폰 목록
	@Override
	public List<CouponVO> getCouponList(PageVO p) {
		return this.adminDao.getCouponList(p);
	}

	// 쿠폰 추가
	@Override
	public void insertCoupon(CouponVO cp) {
		this.adminDao.insertCoupon(cp);
	}

	// 쿠폰 상태
	@Override
	public void setCouponStatus(String cp_id) {
		this.adminDao.setCouponStatus(cp_id);
	}

	// 쿠폰 내용
	@Override
	public CouponVO getCouponCont(String cp_id) {
		return this.adminDao.getCouponCont(cp_id);
	}

	// 쿠폰 수정
	@Override
	public void setCouponUpdate(CouponVO cp) {
		this.adminDao.setCouponUpdate(cp);
	}

	// 쿠폰 배포 가능한 회원 리스트
	@Override
	public List<MemberDto> getCouponIssuList(String cp_id) {
		return this.adminDao.getCouponIssuList(cp_id);
	}

	// 쿠폰 삭제
	@Override
	public void deleteCoupon(String cp_id) {
		this.adminDao.deleteCoupon(cp_id);
	}

	// 쿠폰 배포
	@Override
	public void setCouponIssu(String cp_id, String mem_id) {
		this.adminDao.setCouponIssu(cp_id, mem_id);
	}

	/****************************************************/
	// 회원 목록 수
	@Override
	public int getMemberListCount(PageVO p) {
		return this.adminDao.getMemberListCount(p);
	}

	// 회원 목록
	@Override
	public List<MemberDto> getMemberList(PageVO p) {
		return this.adminDao.getMemberList(p);
	}

	// 회원 삭제
	@Override
	public void deleteMember(String mem_id) {
		this.adminDao.deleteMember(mem_id);
	}

	// 회원 정보 출력
	@Override
	public MemberDto getMemberCont(String mem_id) {
		return this.adminDao.getMemberCont(mem_id);
	}

	// 회원이 가지고있는 쿠폰 리스트
	@Override
	public List<HashMap<String, Integer>> getMemberCouponList(String mem_id) {
		return this.adminDao.getMemberCouponList(mem_id);
	}

	/****************************************************/
	// 숙소 개수
	@Override
	public int getLodgingListCount(PageVO p) {
		return this.adminDao.getLodgingListCount(p);
	}

	// 숙소 목록
	@Override
	public List<LodgingVO> getLodgingList(PageVO p) {
		return this.adminDao.getLodgingList(p);
	}

	// 숙소에 따른 방 개수
	@Override
	public int getRoomListCount(String lod_id) {
		return this.adminDao.getRoomListCount(lod_id);
	}

	// 숙소 정보
	@Override
	public LodgingVO getLodgingCont(String lod_id) {
		return this.adminDao.getLodgingCont(lod_id);
	}

	// 방 목록
	@Override
	public List<LodgingRoomVO> getRoomList(String lod_id, PageVO p) {
		return this.adminDao.getRoomList(lod_id, p);
	}

	// 레저 개수
	@Override
	public int getLeisureListCount(PageVO p) {
		return this.adminDao.getLeisureListCount(p);
	}

	// 레저 목록
	@Override
	public List<LeisureVO> getLeisureList(PageVO p) {
		return this.adminDao.getLeisureList(p);
	}

	/****************************************************/
	// 공지 개수
	@Override
	public int getGongjiListCount(PageVO p) {
		return this.adminDao.getGongjiListCount(p);
	}

	// 공지 리스트
	@Override
	public List<GongjiVO> getGongjiList(PageVO p) {
		return this.adminDao.getGongjiList(p);
	}

	// 공지 추가
	@Override
	public void insertGongji(GongjiVO gpa) {
		this.adminDao.insertGongji(gpa);
	}

	// 공지 내용 가져오기
	@Override
	public GongjiVO getGongjiCont(String gongji_no) {
		return this.adminDao.getGongjiCont(gongji_no);
	}

	// 공지 업데이트
	@Override
	public void setGongjiUpdate(GongjiVO g) {
		this.adminDao.setGongjiUpdate(g);
	}

	// 공지 삭제
	@Override
	public void deleteGongji(String gongji_no) {
		this.adminDao.deleteGongji(gongji_no);
	}

	// 회원 사용 내역
	@Override
	public int getMemberHistory(String mem_id, String id) {
		return this.adminDao.getMemberHistory(mem_id, id);
	}

	// 숙소 삭제
	@Override
	public void deleteLodging(String lod_id) {
		this.adminDao.deleteLodging(lod_id);
	}

	// 방 삭제
	@Override
	public void deleteRoom(String lod_id, String room_id) {
		this.adminDao.deleteRoom(lod_id, room_id);
	}

	// 예약정보확인
	@Override
	public List<ReservationLodgingVO> getLodgingReservList() {
		return this.adminDao.getLodgingReservList();
	}

	@Override
	public void deleteReserv(Long reserv_id) {
		this.adminDao.deleteReserv(reserv_id);
	}

}
