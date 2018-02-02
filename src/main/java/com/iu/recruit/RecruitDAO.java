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
	
	public List<RecruitDTO> selectList(RecruitSearchDTO recruitSearchDTO) {
		List<RecruitDTO> selectList_result=null;
		if(recruitSearchDTO==null) {
			//전체리스트 - 파워링크 가져오기 작성해야함
			selectList_result = sqlSession.selectList(NAMESPACE+"selectList");
		} else {
			//검색조건 리스트 - DB접근까지만 완성 -> 조건을 이용한 쿼리문 작업해야함+파워링크 가져오기 작성해야함
			selectList_result = sqlSession.selectList(NAMESPACE+"searchList", recruitSearchDTO);
		}
		return selectList_result;
	}
	
	public RecruitDTO selectOne(int num) {
		return sqlSession.selectOne(NAMESPACE+"selectOne", num);
	}
}