package com.iu.recruit;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.iu.scrap.ScrapDTO;

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
	
	//공고등록
	public int companyRecruit(RecruitDTO recruitDTO) {
		System.out.println(recruitDTO.getId());
		return sqlSession.insert(NAMESPACE+"companyRecruit", recruitDTO);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/////////////////////////////////////////////////////
	public List<RecruitDTO> selectList() {
		return sqlSession.selectList(NAMESPACE+"User_Recruit_Total_List");
	}
	
/*	public List<RecruitDTO> selectList(RecruitSearchDTO recruitSearchDTO) {
		List<RecruitDTO> selectList_result=null;
		if(recruitSearchDTO==null) {
			//전체리스트 - 파워링크 가져오기 작성해야함
			selectList_result = sqlSession.selectList(NAMESPACE+"userRecruitselectList");
		} else {
			//검색조건 리스트 - DB접근까지만 완성 -> 조건을 이용한 쿼리문 작업해야함+파워링크 가져오기 작성해야함
			selectList_result = sqlSession.selectList(NAMESPACE+"userRecruitsearchList", recruitSearchDTO);
		}
		return selectList_result;
	}
	*/
	public RecruitDTO selectOne(int num) {
		return sqlSession.selectOne(NAMESPACE+"user_Recruit_select_One", num);
	}
	
	public Integer totalCount() {
		return sqlSession.selectOne(NAMESPACE+"Recruit_Total_Count");
	}
}
