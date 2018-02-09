package com.iu.talk;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.iu.util.ListData;

@Repository
public class TalkDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="TalkMapper.";
	
	
	public int insert(TalkDTO talkDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", talkDTO);
	}
	
	public List<TalkDTO> selectList(ListData listData) throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList", listData);
	}
	
	public TalkDTO selectOne(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", num);
	}
	
	
	
	
}
