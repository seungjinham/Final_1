package com.iu.f1;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iu.company.CompanyDTO;
import com.iu.company.CompanyService;
import com.iu.recruit.RecruitDTO;
import com.iu.recruit.RecruitService;
import com.iu.scrap.ScrapDTO;
import com.iu.scrap.ScrapService;

@Controller
@RequestMapping(value="scrap/**")
public class ScrapController {
	@Inject
	private ScrapService scrapService;
	@Inject
	private CompanyService companyService;
	@Inject
	private RecruitService recruitService;
	
	@RequestMapping(value="scrapInsert", method=RequestMethod.GET)
	public String Insert(ScrapDTO scrapDTO, Model model) {
		Integer integer = scrapService.Insert(scrapDTO);
		model.addAttribute("result", integer);
		return "recruit/recruitList";
	}
	
	@RequestMapping(value="scrapDelete", method=RequestMethod.GET)
	public String Delete(ScrapDTO scrapDTO, Model model) {
		Integer integer = scrapService.Delete(scrapDTO);
		model.addAttribute("result", integer);
		return "recruit/recruitList";
	}
	
	@RequestMapping(value="scrapSelectList", method=RequestMethod.GET)
	public String SelectList(ScrapDTO scrapDTO, Model model) {
		List<RecruitDTO> result_ar = scrapService.SelectList(scrapDTO);
		model.addAttribute("scrap_result", result_ar);
		return "scrap/scrapList";
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
