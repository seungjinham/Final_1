package com.iu.paper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class HopeDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="PaperMapper.";
	
	//이력서 등록
	public int insert(HopeDTO hopeDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"hopeInsert", hopeDTO);
	}

	//이력서 수정
	public int update(HopeDTO hopeDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"hopeUpdate", hopeDTO);
	}

	//이력서 삭제
	public int delete(String id) throws Exception{
		return sqlSession.delete(NAMESPACE+"hopeDelete", id);
	}

	//이력서 보기
	public int view(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"hopeView", id);
	}


}
