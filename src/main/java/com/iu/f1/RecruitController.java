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
import com.iu.recruit.RecruitSearchDTO;
import com.iu.recruit.RecruitService;
import com.iu.util.ListSort;

@Controller
@RequestMapping(value="recruit/**")
public class RecruitController {
	@Inject
	private RecruitService recruitService;
	@Inject
	private CompanyService companyService;
	
	@RequestMapping(value="recruitList", method=RequestMethod.GET)
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
}
