package com.iu.company;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.iu.member.MemberDAO;
import com.iu.member.MemberDTO;
import com.iu.recruit.RecruitDTO;
import com.iu.scrap.ScrapDTO;

@Repository
public class CompanyDAO implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="CompanyMapper.";

	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		sqlSession.insert(NAMESPACE+"memberInsert", memberDTO);
		return sqlSession.insert(NAMESPACE+"companyInsert", memberDTO);
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
	
	public CompanyDTO selectOne(String id) {
		return sqlSession.selectOne(NAMESPACE+"selectOne", id);
	}
	
	public CompanyDTO selectList(String id) {
		CompanyDTO companyDTO = new CompanyDTO();
		return sqlSession.selectOne(NAMESPACE+"companyList", id);
	}

	public List<RecruitDTO> companyRecruitList() {
		return sqlSession.selectList(NAMESPACE+"companyRecruitList");
	}
}
