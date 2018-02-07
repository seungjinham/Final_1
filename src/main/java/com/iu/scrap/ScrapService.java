package com.iu.scrap;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.company.CompanyDAO;
import com.iu.company.CompanyDTO;
import com.iu.recruit.RecruitDAO;
import com.iu.recruit.RecruitDTO;

@Service
public class ScrapService {
	@Inject
	private ScrapDAO scrapDAO;
	@Inject
	private RecruitDAO recruitDAO;
	@Inject
	private CompanyDAO companyDAO;
	
	public int Insert(ScrapDTO scrapDTO) {
		return scrapDAO.Insert(scrapDTO);
	}
	
	public int Delete(ScrapDTO scrapDTO) {
		return scrapDAO.Delete(scrapDTO);
	}
	
	public List<RecruitDTO> SelectList(ScrapDTO scrapDTO) {
		List<ScrapDTO> scrap_ar = scrapDAO.SelectList(scrapDTO);
		List<RecruitDTO> recruit_ar = recruitDAO.selectList(scrap_ar);
		return null;//recruit_ar;
	}
	
//	public RecruitDTO SelectOne(int num) {
//		RecruitDTO recruitDTO = recruitDAO.selectOne(num);
//		return recruitDTO;
//	}
}
