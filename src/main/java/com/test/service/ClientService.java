package com.test.service;

import java.util.List;

import com.test.Dto.MemberDto;
import com.test.vo.LeisureVO;
import com.test.vo.LodgingRoomVO;
import com.test.vo.LodgingVO;
import com.test.vo.PayVO;

public interface ClientService {

	List<LodgingVO> getLodgingList(String lodging_type);

	List<LeisureVO> getLeisureList();
	
	List<PayVO> getPayList();

	List<LodgingRoomVO> getRoomList(String lodging_id);

	String getRoomType(String lodging_id);

	MemberDto getMember(String name);

	LeisureVO getLeisure(String leisure_id);

	int getPoint(String username);
	
	void addReservationtest(String reservName, String reservPhone, String checkIn, String checkOut, String peopleNum, String visitMethod);
	   
	   void addLReservationset(String llreservName, String llreservPhone, String llPEOPLE_NUM);

	   void addtReservationtest(String reservName, String reservPhone, String PEOPLE_NUM, String visitMethod);

}
