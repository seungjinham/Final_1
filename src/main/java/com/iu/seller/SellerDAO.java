
package com.iu.seller;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SellerDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="SellMapper.";
	
	public int sellerWrite(SellerDTO sellerDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"write", sellerDTO);
	}
	
	public int sellerUpdate(SellerDTO sellerDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"update", sellerDTO);
	}
	
	public int sellerDelete(SellerDTO sellerDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"delete",sellerDTO);
	}
	
	public SellerDTO sellerOne(SellerDTO sellerDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", sellerDTO);
	}
	
	public List<SellerDTO> sellerList(String category) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectList", category);
	}

}
