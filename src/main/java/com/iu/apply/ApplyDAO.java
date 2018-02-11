package com.iu.apply;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ApplyDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "ApplyMapper.";

	public int insert(ApplyDTO applyDTO) {
		return sqlSession.insert(NAMESPACE+"insert", applyDTO);
	}
	
	public int delete(ApplyDTO applyDTO) {
		return sqlSession.delete(NAMESPACE+"delete", applyDTO);
	}

	public List<ApplyDTO> selectList(ApplyDTO applyDTO) {
		return sqlSession.selectList(NAMESPACE+"selectList", applyDTO);
	}
}
