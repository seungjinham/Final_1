package com.iu.paper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PaperDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="PaperMapper.";
	
	//이력서 등록
	public int insert(PaperDTO paperDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"paperInsert", paperDTO);
	}
	
	//이력서 수정
	public int update(PaperDTO paperDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"paperUpdate", paperDTO);
	}
	
	//이력서 삭제
	public int delete(String id) throws Exception{
		return sqlSession.delete(NAMESPACE+"paperDelete", id);
	}
	
	//이력서 갯수 제한
	public int count(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"paperCount", id);
	}
}
