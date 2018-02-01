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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
