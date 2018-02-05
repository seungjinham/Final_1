package com.iu.apply;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.iu.recruit.RecruitDTO;

@Repository
public class ApplyDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "ApplyMapper.";

	public int insert(ApplyDTO applyDTO) {
		return sqlSession.insert(NAMESPACE+"insert", applyDTO);
	}


}
