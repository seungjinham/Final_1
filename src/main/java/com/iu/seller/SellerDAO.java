
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
		return sqlSession.selectList(NAMESPACE+"selectList", category);
	}
	
	public int favorInsert(FavorDTO favorDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"favorInsert", favorDTO);
	}
	
	public int favorDelete(FavorDTO favorDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"favorDelete", favorDTO);
	}
	
	public List<FavorDTO> favorList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"favorList", id);
	}
	
	//팔기
	public int sell(SellDTO sellDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"sell", sellDTO);
	}
	
	public List<SellDTO> sellList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"sellList", id);
	}
	
	public SellDTO sellOne(SellDTO sellDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"sellone", sellDTO);
	}
	
	//사기
	public int buy(BuyDTO sellDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"buy", sellDTO);
	}
	
	public List<BuyDTO> buyList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"buyList", id);
	}
	
	public BuyDTO buyOne(BuyDTO sellDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"buyone", sellDTO);
	}

}
