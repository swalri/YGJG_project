package com.test.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.Dto.MemberDto;
import com.test.vo.LeisureVO;
import com.test.vo.LodgingRoomVO;
import com.test.vo.LodgingVO;
import com.test.vo.PayVO;

@Repository
public class ClientDAOImpl implements ClientDAO {

	@Autowired
	private SqlSession sqlSession; // mybatis로 통한 쿼리문 수행할려고 자동의존성 주입

	@Override
	public List<LodgingVO> getLodgingList(String lodging_type) {
//		System.out.println("daoImpl"+lodging_type);
//		System.out.println(this.sqlSession.selectList("client_lodging_list", lodging_type));
		return this.sqlSession.selectList("client_lodging_list", lodging_type);
	}

	@Override
	public List<LeisureVO> getLeisureList() {
		return this.sqlSession.selectList("client_leisure_list");
	}

	@Override
	public List<PayVO> getPayList() {
		return this.sqlSession.selectList("client_pay_list");
	}

	@Override
	public List<LodgingRoomVO> getRoomList(String lodging_id) {
		return this.sqlSession.selectList("client_room_list", lodging_id);
	}

	@Override
	public String getRoomType(String lodging_id) {
		return this.sqlSession.selectOne("client_room_type", lodging_id);
	}

	@Override
	public MemberDto getMember(String name) {
		return sqlSession.selectOne("get_member", name);
	}

	@Override
	public LeisureVO getLeisure(String leisure_id) {
		return sqlSession.selectOne("get_leisure", leisure_id);
	}

	@Override
	public int getPoint(String username) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("point", username);
	}

}
