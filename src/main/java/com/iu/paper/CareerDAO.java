package com.iu.paper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CareerDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="PaperMapper.";

	//이력서 등록
	public int insert(CareerDTO careerDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"careerInsert", careerDTO);
	}

	//이력서 수정
	public int update(CareerDTO careerDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"careerUpdate", careerDTO);
	}

	//이력서 삭제
	public int delete(String id) throws Exception{
		return sqlSession.delete(NAMESPACE+"careerDelete", id);
	}

	//이력서 보기
	public int view(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"careerView", id);
	}


}
