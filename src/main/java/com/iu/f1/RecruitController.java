package com.iu.f1;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iu.company.CompanyDTO;
import com.iu.company.CompanyService;
import com.iu.recruit.RecruitDTO;
import com.iu.recruit.RecruitSearchDTO;
import com.iu.recruit.RecruitService;
import com.iu.util.AreaCodeDTO;
import com.iu.util.ListData;

@Controller
@RequestMapping(value="recruit/**")
public class RecruitController {
	@Inject
	private RecruitService recruitService;
	@Inject
	private CompanyService companyService;
	
	@RequestMapping(value="recruitList", method=RequestMethod.GET)
	public String recruitList(Model model, ListData listData) {
		//List<RecruitDTO> recruit_ar = recruitService.selectList();
		List<Object> collect_ar = recruitService.selectList(listData);
		model.addAttribute("totallist", collect_ar.get(0));
		model.addAttribute("pagelist", collect_ar.get(1));
/*		List<Object> districtCode = null;
		AreaCodeDTO districtcode = new AreaCodeDTO();
		try {
			districtCode = districtcode.discrictCode();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		//model.addAttribute("districtcode", districtCode);
		return "recruit/recruitList";
	}
	
	@RequestMapping(value="recruitSearch", method=RequestMethod.GET)
	public String recruitList(RecruitSearchDTO recruitSearchDTO, Model model) {
		
/*		List<Object> districtCode = null;
		Districtcode districtcode = new Districtcode();
		try {
			districtCode = districtcode.discrictCode();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("si", (Map<String, String>)districtCode.get(0));
		model.addAttribute("gu", (Map<String, String>)districtCode.get(1));
		model.addAttribute("dong", (Map<String, String>)districtCode.get(2));
		model.addAttribute("sinum", (List<String>)districtCode.get(3));
		model.addAttribute("gunum", (List<String>)districtCode.get(4));
		model.addAttribute("dongnum", (List<String>)districtCode.get(5));*/
		String path = "recruit/recruitSearch";
		return path;
	}
	
	@RequestMapping(value="recruitView", method=RequestMethod.GET)
	public String recruitView(int num, Model model) {
		RecruitDTO recruitDTO = recruitService.selectOne(num);
		CompanyDTO companyDTO = companyService.selectOne(recruitDTO.getId());
		model.addAttribute("recruit", recruitDTO);
		model.addAttribute("company", companyDTO);
		return "recruit/recruitView";
	}
	
/*	@RequestMapping(value="recruitList", method=RequestMethod.GET)
	public String recruitList(RecruitSearchDTO recruitSearchDTO, Model model) {
		ListSort listSort = new ListSort();
		List<RecruitDTO> recruit_ar = recruitService.selectList(recruitSearchDTO);
		List<CompanyDTO> company_ar = companyService.selectList(recruit_ar);
		recruit_ar = listSort.listSort(recruit_ar, company_ar);
		model.addAttribute("list", recruit_ar);
		return "recruit/recruitList";
	}
	
	@RequestMapping(value="recruitView", method=RequestMethod.GET)
	public String recruitView(int num, Model model) {
		RecruitDTO recruitDTO = recruitService.selectOne(num);
		CompanyDTO companyDTO = companyService.selectOne(recruitDTO.getId());
		model.addAttribute("recruit", recruitDTO);
		model.addAttribute("company", companyDTO);
		return "recruit/recruitView";
	}
	
	@RequestMapping(value="recruitSearch", method=RequestMethod.GET)
	public String recruitSearch() {
		return "recruit/recruitSearch";
	}*/
	
	@RequestMapping(value="recruitSearchList", method=RequestMethod.GET)
	public String Search() {
		return "recruit/recruitSearchList";
	}
}
