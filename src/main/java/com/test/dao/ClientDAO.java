package com.test.dao;

import java.util.List;

import com.test.Dto.MemberDto;
import com.test.vo.LeisureVO;
import com.test.vo.LodgingRoomVO;
import com.test.vo.LodgingVO;
import com.test.vo.PayVO;

public interface ClientDAO {

	List<LodgingVO> getLodgingList(String lodging_type);

	List<LeisureVO> getLeisureList();
	
	List<PayVO> getPayList();

	List<LodgingRoomVO> getRoomList(String lodging_id);

	String getRoomType(String lodging_id);

	MemberDto getMember(String name);

	LeisureVO getLeisure(String leisure_id);

	int getPoint(String username);

}
