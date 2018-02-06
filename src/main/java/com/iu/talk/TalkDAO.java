package com.iu.talk;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TalkDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="TalkMapper.";
	
	public int insert(TalkDTO talkDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", talkDTO);
	}
	
	
	
	
	
}
