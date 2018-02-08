package com.iu.f1;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iu.apply.ApplyDTO;
import com.iu.apply.ApplyService;
import com.iu.company.CompanyDTO;
import com.iu.company.CompanyService;
import com.iu.recruit.RecruitDTO;
import com.iu.recruit.RecruitService;
import com.iu.supporter.SupporterService;

@Controller
@RequestMapping(value="apply/**")
public class ApplyController {
	@Inject
	private ApplyService applyService;
	@Inject
	private SupporterService supporterService;
	@Inject
	private RecruitService recruitService;
	@Inject
	private CompanyService companyService;
	
	
	@RequestMapping(value="applyInsert", method=RequestMethod.GET)
	public String insert(ApplyDTO applyDTO, Model model) {
		Integer integer1 = applyService.insert(applyDTO);
		Integer integer2 = supporterService.insert(applyDTO);
		Integer integer = 0;
		if(integer1>0 && integer2>0) integer = integer1+integer2;
		RecruitDTO recruitDTO = recruitService.selectOne(applyDTO.getRecruit_num());
		CompanyDTO companyDTO = companyService.selectOne(recruitDTO.getId());
		model.addAttribute("apply_result", integer);
		model.addAttribute("recruit", recruitDTO);
		model.addAttribute("company", companyDTO);
		return "recruit/recruitView";
	}
	
	@RequestMapping(value="applySelectList", method=RequestMethod.GET)
	public String selectList(ApplyDTO applyDTO, Model model) {
		List<RecruitDTO> recruit_ar = null;
		String message = "로그인이 필요한 서비스입니다.";
		String path = "redirect:../";
		if(applyDTO.getId() != "") {
			recruit_ar = applyService.selectList(applyDTO);
			model.addAttribute("applylist", recruit_ar);
			path = "apply/applyList";
		} else {
			model.addAttribute("applymessage", message);
		}
		return path;
	}
}
