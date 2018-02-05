package com.iu.supporter;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.iu.apply.ApplyDTO;

@Repository
public class SupporterDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "SupporterMapper.";
	
	public int insert(ApplyDTO applyDTO) {
		return sqlSession.insert(NAMESPACE+"insert", applyDTO);
	}
}
