package com.iu.power;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PowerDAO {

	@Inject	
	private SqlSession sqlSession;
	private final String NAMESPACE="PowerMaper.";
	
	public int insert(PowerDTO powerDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", powerDTO);

	}
	
	
}
