package com.iu.recruit;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class RecruitDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "RecruitMapper.";
	
	public int insert(RecruitDTO recruitDTO) {
		return 0;
	}
	
	public int update(RecruitDTO recruitDTO) {
		return sqlSession.update(NAMESPACE+"RecruitUpdate", recruitDTO);
	}
	
	public int delete(int num) {
		return 0;
	}
	
	public List<RecruitDTO> selectList() {
		return null;
	}
	
	public RecruitDTO selectOne(int num) {
		return null;
	}
}
