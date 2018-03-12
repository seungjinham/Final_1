
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
	
	public int optionWrite(OptionDTO[] optionDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"optionWrite", optionDTO);
	}
	
	public int optionUpdate(OptionDTO[] optionDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"optionUpdate", optionDTO);
	}
	
	public List<OptionDTO> optionList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"optionList", id);
	}
}
