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

	//공고등록
	public int companyRecruit(RecruitDTO recruitDTO) {
		return sqlSession.insert(NAMESPACE+"companyRecruit", recruitDTO);
	}
}
