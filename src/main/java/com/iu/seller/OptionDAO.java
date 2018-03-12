
package com.iu.seller;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class OptionDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="SellMapper.";
	
	public int optionWrite(SellerDTO sellerDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"optionWrite", sellerDTO);
	}
	
	public int optionUpdate(SellerDTO sellerDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"optionUpdate", sellerDTO);
	}
	
	public List<OptionDTO> optionList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"optionList", id);
	}
}
