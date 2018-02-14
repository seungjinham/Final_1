package com.iu.f1;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iu.company.CompanyDTO;
import com.iu.company.CompanyService;
import com.iu.person.PersonService;
import com.iu.recruit.RecruitDTO;
import com.iu.recruit.RecruitService;
import com.iu.scrap.ScrapDTO;
import com.iu.scrap.ScrapService;
import com.iu.util.ListData;
import com.iu.util.ListSort;

@Controller
@RequestMapping(value="scrap/**")
public class ScrapController {
	@Inject
	private ScrapService scrapService;
	@Inject
	private CompanyService companyService;
	@Inject
	private RecruitService recruitService;
	@Inject
	private PersonService personService;
	
	@RequestMapping(value="scrapInsert", method=RequestMethod.GET)
	public String Insert(ScrapDTO scrapDTO, String page, Model model) throws Exception{
		//RecruitSearchDTO recruitSearchDTO = new RecruitSearchDTO();
		String message = "로그인이 필요합니다.";
		Integer integer = 0;
		String path = "redirect:../";
		List<RecruitDTO> recruit_ar = null;
		List<CompanyDTO> company_ar = null;
		List<Object> obj_ar = null; 
		RecruitDTO recruitDTO = null;
		CompanyDTO companyDTO = null;
		
		if(page.equals("view")) {
			if(scrapDTO.getId() != "") {
				integer = scrapService.Insert(scrapDTO);
				if(integer>0) {
					message = "스크랩 성공";
					path = "recruit/recruitView";
					recruitDTO = recruitService.selectOne(scrapDTO.getRecruit_num());
					companyDTO = companyService.selectOne(recruitDTO.getId());
					model.addAttribute("recruit", recruitDTO);
					model.addAttribute("company", companyDTO);
				} else {
					message = "스크랩 실패 ";
					path = "recruit/recruitView";
					recruitDTO = recruitService.selectOne(scrapDTO.getRecruit_num());
					companyDTO = companyService.selectOne(recruitDTO.getId());
					model.addAttribute("recruit", recruitDTO);
					model.addAttribute("company", companyDTO);
				}
			}
		} else if(page.equals("list")) {
			if(scrapDTO.getId() != "") {
				ListData listData = new ListData();
				integer = scrapService.Insert(scrapDTO);
				if(integer>0) {
					message = "스크랩 성공";
					ListSort listSort = new ListSort();
					//recruit_ar = recruitService.selectList(listData);
					obj_ar = recruitService.selectList(listData);
					company_ar = companyService.selectList();
					recruit_ar = listSort.listSort((List<RecruitDTO>)obj_ar.get(0), company_ar);
					model.addAttribute("list", recruit_ar);
					model.addAttribute("pagelist", obj_ar.get(1));
					path="recruit/recruitList";
				} else {
					message = "스크랩 실패 ";
					ListSort listSort = new ListSort();
					//recruit_ar = recruitService.selectList();
					obj_ar = recruitService.selectList(listData);
					company_ar = companyService.selectList();
					recruit_ar = listSort.listSort((List<RecruitDTO>)obj_ar.get(0), company_ar);
					model.addAttribute("list", recruit_ar);
					model.addAttribute("pagelist", obj_ar.get(1));
					path="recruit/recruitList";
				}
			}
		} else {
			if(scrapDTO.getId() != "") {
				integer = scrapService.Insert(scrapDTO);
				if(integer>0) {
					message = "스크랩 성공";
					path="recruit/recruitList";
				} else {
					message = "스크랩 실패 ";
					path="recruit/recruitList";
				}
			}
		}
		model.addAttribute("message", message);
		return path;
	}
	
/*	@RequestMapping(value="scrapInsert", method=RequestMethod.GET)
	public String Insert(ScrapDTO scrapDTO, Model model) throws Exception{
		RecruitSearchDTO recruitSearchDTO = new RecruitSearchDTO();
		String message = "로그인이 필요합니다.";
		Integer integer = 0;
		if(scrapDTO.getId() != "") {
			integer = scrapService.Insert(scrapDTO);
			message = "스크랩 성공";
		} 
		ListSort listSort = new ListSort();
		List<RecruitDTO> recruit_ar = recruitService.selectList(recruitSearchDTO);
		List<CompanyDTO> company_ar = companyService.selectList(recruit_ar);
		recruit_ar = listSort.listSort(recruit_ar, company_ar);
		model.addAttribute("result", integer);
		model.addAttribute("message", message);
		model.addAttribute("list", recruit_ar);
		return "recruit/recruitList";
	}*/
	
	@RequestMapping(value="scrapDelete", method=RequestMethod.GET)
	public String Delete(ScrapDTO scrapDTO, Model model) {
		Integer integer = scrapService.Delete(scrapDTO);
		model.addAttribute("result", integer);
		return "recruit/recruitList";
	}
	
	@RequestMapping(value="scrapSelectList", method=RequestMethod.GET)
	public String SelectList(ScrapDTO scrapDTO, ListData listData, Model model) {
		List<Object> obj_ar = null; 
		String message = "로그인이 필요한 서비스 입니다.";
		String path = "redirect:../";
		
		if(scrapDTO.getId()!="") {
			obj_ar = scrapService.SelectList(scrapDTO, listData);
			model.addAttribute("scrap_result", obj_ar.get(0));
			model.addAttribute("pagelist", obj_ar.get(1));
			path="scrap/scrapList";
		}
		
		
		model.addAttribute("message", message);
		return path;
	}
	
//	@RequestMapping(value="scrapSelectOne", method=RequestMethod.GET)
//	public String SelectOne(int num, Model model) {
//		RecruitDTO recruitDTO = recruitService.selectOne(num);
//		CompanyDTO companyDTO = companyService.selectOne(recruitDTO.getId());
//		model.addAttribute("recruit", recruitDTO);
//		model.addAttribute("company", companyDTO);
//		return "recuit/recruitDetailView";
//	}
}
