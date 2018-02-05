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
		System.out.println("scrapservicetest");
		List<ScrapDTO> scrap_ar = scrapDAO.SelectList(scrapDTO);
		System.out.println(scrap_ar);
		System.out.println(scrap_ar.get(0).getId());
		List<RecruitDTO> recruit_ar = recruitDAO.selectList(scrap_ar);//scrap - recruit_num 검색
		System.out.println(recruit_ar);
		System.out.println(recruit_ar.get(0).getTitle());
		List<CompanyDTO> company_ar = companyDAO.selectList(recruit_ar);//recruit - id로 검색
		System.out.println(company_ar);
		System.out.println(company_ar.get(0).getAddr());
		
//		for(int i=0; i<company_ar.size(); i++) {
//			String temp_str = company_ar.get(i).getAddr();
//			String[] temp_ar = temp_str.split(" ");
//			temp_str = temp_ar[0]+" "+temp_ar[1];
//			recruit_ar.get(i).setAddr(temp_str);
//		}
		return null;//recruit_ar;
	}
	
//	public RecruitDTO SelectOne(int num) {
//		RecruitDTO recruitDTO = recruitDAO.selectOne(num);
//		return recruitDTO;
//	}
}
