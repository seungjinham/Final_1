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
import com.iu.util.ListSort;

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
		List<RecruitDTO> recruit_ar = new ArrayList<>();
		List<CompanyDTO> company_ar = new ArrayList<>();
		for(int i=0; i<scrap_ar.size(); i++) {
			RecruitDTO recruitDTO = recruitDAO.selectOne(scrap_ar.get(i).getRecruit_num());
			recruit_ar.add(recruitDTO);
		}
		for(int i=0; i<recruit_ar.size(); i++) {
			CompanyDTO companyDTO = companyDAO.selectList(recruit_ar.get(i).getId());
			company_ar.add(companyDTO);
		}
		ListSort listSort = new ListSort();
		recruit_ar = listSort.listSort(recruit_ar, company_ar);
		return recruit_ar;
	}
	
//	public RecruitDTO SelectOne(int num) {
//		RecruitDTO recruitDTO = recruitDAO.selectOne(num);
//		return recruitDTO;
//	}
}
