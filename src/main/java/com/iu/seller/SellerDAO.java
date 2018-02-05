package com.iu.seller;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.iu.member.MemberDTO;
@Repository
public class SellerDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="SellMapper.";
	
	public int sellerWrite(MemberDTO memberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"write", memberDTO);
	}
	
	public int sellerUpdate(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"update", memberDTO);
	}
	
	public int sellerDelete(String id) throws Exception {
		return sqlSession.delete(NAMESPACE+"delete",id);
	}
	
	public MemberDTO sellerOne(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", id);
	}
	
	public MemberDTO sellerList(String category) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectList", category);
	}

}
