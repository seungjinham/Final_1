package com.iu.company;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.iu.member.MemberDAO;
import com.iu.member.MemberDTO;
import com.iu.recruit.RecruitDTO;

@Repository
public class CompanyDAO implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="CompanyMapper.";

	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		sqlSession.insert(NAMESPACE+"memberJoin", memberDTO);
		return sqlSession.insert(NAMESPACE+"companyJoin", memberDTO);
	}

	@Override
	public int delete(MemberDTO memberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"companyDelete", memberDTO);
	}

	@Override
	public int update(MemberDTO memberDTO) throws Exception {
		sqlSession.update(NAMESPACE+"memberUpdate", memberDTO);
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

	public List<RecruitDTO> companyRecruitList(String id) {
		return sqlSession.selectList(NAMESPACE+"companyRecruitList", id);
	}
	
	public CompanyDTO companyRecruitView(int num){
		return sqlSession.selectOne(NAMESPACE+"companyRecruitView", num);
	}

	public int companyRecruitDelete(int num) {
		return sqlSession.delete(NAMESPACE+"companyRecruitDelete", num);
	}
	
	
	
	
	
	//////////////////////////////////////////////////////
	public CompanyDTO selectOne(String id) {
		return sqlSession.selectOne(NAMESPACE+"companySelectOne", id);
	}
	
	public List<CompanyDTO> selectList() {
		return sqlSession.selectList(NAMESPACE+"companySelectList");
	}
/*	public CompanyDTO selectOne(String id) {
		return sqlSession.selectOne(NAMESPACE+"selectOne", id);
	}
	
	public CompanyDTO selectList(String id) {
		return sqlSession.selectOne(NAMESPACE+"companyList", id);
	}*/
}
