package com.test.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.Dto.MemberDto;
import com.test.dao.ClientDAO;
import com.test.vo.LeisureVO;
import com.test.vo.LodgingRoomVO;
import com.test.vo.LodgingVO;
import com.test.vo.PayVO;

@Service
public class ClientServiceImpl implements ClientService {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private ClientDAO clientDao;

	@Override
	public List<LodgingVO> getLodgingList(String lodging_type) {
		return this.clientDao.getLodgingList(lodging_type);
	}

	@Override
	public List<LeisureVO> getLeisureList() {
		return this.clientDao.getLeisureList();
	}

	@Override
	public List<PayVO> getPayList() {
		return this.clientDao.getPayList();
	}

	@Override
	public List<LodgingRoomVO> getRoomList(String lodging_id) {
		return this.clientDao.getRoomList(lodging_id);
	}

	@Override
	public String getRoomType(String lodging_id) {
		return this.clientDao.getRoomType(lodging_id);
	}

	@Override
	public MemberDto getMember(String name) {
		return clientDao.getMember(name);
	}

	@Override
	public LeisureVO getLeisure(String leisure_id) {
		return clientDao.getLeisure(leisure_id);
	}

	@Override
	public int getPoint(String username) {
		// TODO Auto-generated method stub
		return clientDao.getPoint(username);
	}

	@Override
	public void addReservationtest(String reservName, String reservPhone, String checkIn, String checkOut,
			String peopleNum, String visitMethod) {
		Map<String, Object> params = new HashMap<>();
		params.put("reservName", reservName);
		params.put("reservPhone", reservPhone);
		params.put("checkIn", checkIn);
		params.put("checkOut", checkOut);
		params.put("peopleNum", Integer.parseInt(peopleNum));
		params.put("visitMethod", visitMethod);

		sqlSession.insert("lodging.addReservationtest", params);

	}

	@Override
	public void addLReservationset(String llreservName, String llreservPhone, String llPEOPLE_NUM) {
		Map<String, Object> params = new HashMap<>();
		params.put("llreservName", llreservName);
		params.put("llreservPhone", llreservPhone);
		params.put("llPEOPLE_NUM", llPEOPLE_NUM);

		sqlSession.insert("lodging.addLReservationset", params);
	}

	@Override
	public void addtReservationtest(String reservName, String reservPhone, String PEOPLE_NUM, String visitMethod) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<>();
		params.put("reservName", reservName);
		params.put("reservPhone", reservPhone);
		params.put("peopleNum", Integer.parseInt(PEOPLE_NUM));
		params.put("visitMethod", visitMethod);

		sqlSession.insert("lodging.addtReservationtest", params);
	}

}
