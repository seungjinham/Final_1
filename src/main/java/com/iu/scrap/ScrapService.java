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
import com.iu.util.ListData;
import com.iu.util.ListSort;
import com.iu.util.PageMaker;

@Service
public class ScrapService {
	@Inject
	private ScrapDAO scrapDAO;
	@Inject
	private RecruitDAO recruitDAO;
	@Inject
	private CompanyDAO companyDAO;
	
	public int Insert(ScrapDTO scrapDTO) {
		int result=0;
		ListData listData = new ListData();
		List<Object> ar = SelectList(scrapDTO, listData);
		List<ScrapDTO> scrap_ar = (List<ScrapDTO>)ar.get(2);
		if(scrap_ar.size()==0) {
			result = scrapDAO.Insert(scrapDTO);
		} else {
			for(int i=0; i<scrap_ar.size(); i++) {
				if(scrapDTO.getRecruit_num() != scrap_ar.get(i).getRecruit_num()) {
					result = scrapDAO.Insert(scrapDTO);
				}
			}
		}
		return result;
	}
	
	public int Delete(ScrapDTO scrapDTO) {
		return scrapDAO.Delete(scrapDTO);
	}
	
	public List<Object> SelectList(ScrapDTO scrapDTO, ListData listData) {
		Integer st_count = scrapDAO.TotalCount();
		List<ScrapDTO> scrap_ar = scrapDAO.SelectList(scrapDTO);
		List<RecruitDTO> recruit_ar = new ArrayList<>();
		List<CompanyDTO> company_ar = new ArrayList<>();
		List<Object> obj_ar = new ArrayList<>();
		for(int i=0; i<scrap_ar.size(); i++) {
			RecruitDTO recruitDTO = recruitDAO.selectOne(scrap_ar.get(i).getRecruit_num());
			recruit_ar.add(recruitDTO);
		}
		for(int i=0; i<recruit_ar.size(); i++) {
			CompanyDTO companyDTO = companyDAO.selectOne(recruit_ar.get(i).getId());
			company_ar.add(companyDTO);
		}
		ListSort listSort = new ListSort();
		recruit_ar = listSort.listSort(recruit_ar, company_ar);
		PageMaker pageMaker = new PageMaker();
		pageMaker.pageMaker(st_count, listData);
		obj_ar.add(recruit_ar);
		obj_ar.add(listData);
		obj_ar.add(scrap_ar);
		return obj_ar;
	}
	
//	public RecruitDTO SelectOne(int num) {
//		RecruitDTO recruitDTO = recruitDAO.selectOne(num);
//		return recruitDTO;
//	}
}
