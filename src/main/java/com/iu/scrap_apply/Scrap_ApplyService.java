package com.iu.scrap_apply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.recruit.RecruitDTO;

@Service
public class Scrap_ApplyService {
	@Inject
	private Scrap_ApplyDAO scrap_applyDAO;
	
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
		return scrap_applyDAO.scrapInsert(scrap_applyDTO);
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
