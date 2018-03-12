package com.iu.recruit;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.iu.scrap.ScrapDTO;
import com.iu.util.AreaCodeDTO;
import com.iu.util.ConditionDTO;
import com.iu.util.ListData;

@Repository
public class RecruitDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "RecruitMapper.";
	
	public int update(int num) {
		return sqlSession.update(NAMESPACE+"RecruitUpdate", num);
	}
	
	public RecruitDTO companySelectOne(int num) {
		return sqlSession.selectOne(NAMESPACE+"companySelectOne", num);
	}
	
	public int delete(int num) {
		return 0;
	}
	
	//공고등록
	public int companyRecruit(RecruitDTO recruitDTO) {
		return sqlSession.insert(NAMESPACE+"companyRecruit", recruitDTO);
	}
		
	
	
	/////////////////////////////////////////////////////
	public List<RecruitDTO> selectList(ListData listData) {
		return sqlSession.selectList(NAMESPACE+"User_Recruit_Total_List", listData);
	}
	
	public List<RecruitDTO> searchSelectList(ConditionDTO conditionDTO) {
		List<RecruitDTO> Search_result = null;
		
		if(conditionDTO.getCount()>0 && conditionDTO.getArraycount()>0 && conditionDTO.getVarcount()>0) {
			Search_result = sqlSession.selectList(NAMESPACE+"SearchSelect_United", conditionDTO);
		} else if(conditionDTO.getCount()>0 && conditionDTO.getArraycount()==0) {
			//var
			Search_result = sqlSession.selectList(NAMESPACE+"SearchSelect_Var", conditionDTO);
		} else if(conditionDTO.getCount()>0 && conditionDTO.getVarcount()==0) {
			//array
			Search_result = sqlSession.selectList(NAMESPACE+"SearchSelect_Array", conditionDTO);
		} else {}
		
		return Search_result;
	}
	
	public RecruitDTO selectOne(int num) {
		return sqlSession.selectOne(NAMESPACE+"user_Recruit_select_One", num);
	}
	
	public Integer totalCount() {
		return sqlSession.selectOne(NAMESPACE+"Recruit_Total_Count");
	}

	public int companyRecruitUpdate(RecruitDTO recruitDTO) {
		return sqlSession.update(NAMESPACE+"companyRecruitUpdate", recruitDTO);
	}
	
	public List<AreaCodeDTO> selectArea(AreaCodeDTO areacodeDTO) {
		return sqlSession.selectList(NAMESPACE+"Area_Select");
	}
	
	public List<String> selectJob() {
		return sqlSession.selectList(NAMESPACE+"Job_Select");
	}
	
	public List<String> selectSpec() {
		return sqlSession.selectList(NAMESPACE+"Spec_Select");
	}
}
