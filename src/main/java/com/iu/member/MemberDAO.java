package com.iu.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "MemberMapper.";
	
	public int delete(MemberDTO memberDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", memberDTO);
	}
	
	public int update(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", memberDTO);
	}
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"login", memberDTO);
	}
	
	public MemberDTO idCheck(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"idCheck", id);
	}
	public int Join(MemberDTO memberDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"join", memberDTO);
	}
	

}
