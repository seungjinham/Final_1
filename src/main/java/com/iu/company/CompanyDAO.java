package com.iu.company;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.iu.member.MemberDAO;
import com.iu.member.MemberDTO;

@Repository
public class CompanyDAO implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="CompanyMapper.";

	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		return 0;
	}

	@Override
	public int delete(MemberDTO memberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"companyDelete", memberDTO);
	}

	@Override
	public int update(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"companyUpdate", memberDTO);
	}

	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"companyLogin", memberDTO);
	}

	@Override
	public MemberDTO idCheck(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"companyIdCheck", id);
	}
	
	@Override
	public MemberDTO MyPage(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"companyMyPage", id);
	}

}
