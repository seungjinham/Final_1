package com.iu.person;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.iu.member.MemberDAO;
import com.iu.member.MemberDTO;

@Repository
public class PersonDAO implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="PersonMapper.";

	//=======================   Person (개인회원)  =======================
	
	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		sqlSession.insert(NAMESPACE+"memberJoin", memberDTO);
		return sqlSession.insert(NAMESPACE+"personJoin", memberDTO);
	}

	@Override
	public int delete(MemberDTO memberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"personDelete", memberDTO);
	}

	@Override
	public int update(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"personUpdate", memberDTO);
	}

	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"personLogin", memberDTO);
	}

	@Override
	public MemberDTO idCheck(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"personIdCheck", id);
	}
	
	@Override
	public MemberDTO MyPage(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"personMyPage", id);
	}

	//=======================   Seller (판매자)  ========================
	
	public int sellerWrite(MemberDTO memberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"sellerWrite", memberDTO);
	}
	
	public int sellerUpdate(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"sellerUpdate", memberDTO);
	}
	
	public int sellerDelete(String id) throws Exception {
		return sqlSession.delete(NAMESPACE+"sellerDelete",id);
	}
	
	public MemberDTO sellerOne(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"sellerOne", id);
	}


}
