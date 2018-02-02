package com.iu.scrap_apply;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.iu.recruit.RecruitDTO;

@Service
public class Scrap_ApplyDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="Scrap_ApplyMapper.";
	
	//Apply
	public int applyInsert(Scrap_ApplyDTO scrap_applyDTO) {
		return 0;
	}
	
	public int applyDelete(int num) {
		return 0;
	}
	
	public List<RecruitDTO> applySelectList(Scrap_ApplyDTO scrap_applyDTO) {
		return null;
	}
	
	public String applySelectOne(int num) {
		return null;
	}
	
	//==========================================================================================================================
	
	//Scrap
	public int scrapInsert(Scrap_ApplyDTO scrap_applyDTO) {
		return sqlSession.insert(NAMESPACE+"scrapInsert", scrap_applyDTO);
	}
	
	public int scrapDelete(int num) {
		return 0;
	}
	
	public List<RecruitDTO> scrapSelectList(Scrap_ApplyDTO scrap_applyDTO) {
		return null;
	}
	
	public String scrapSelectOne(int num) {
		return null;
	}

}
