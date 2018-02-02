package com.iu.seller;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.iu.member.MemberDTO;
@Repository
public class SellerDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="PersonMapper.";
	
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
