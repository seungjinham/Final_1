package com.iu.f1;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iu.apply.ApplyDTO;
import com.iu.apply.ApplyService;
import com.iu.company.CompanyDTO;
import com.iu.company.CompanyService;
import com.iu.recruit.RecruitDTO;
import com.iu.recruit.RecruitService;
import com.iu.supporter.SupporterDTO;
import com.iu.supporter.SupporterService;
import com.iu.util.ListData;

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
		Integer integer = 0;
		String message = "더 이상 지원 하실 수 없습니다.";
		RecruitDTO recruitDTO = recruitService.selectOne(applyDTO.getRecruit_num());
		CompanyDTO companyDTO = companyService.selectOne(recruitDTO.getId());
		SupporterDTO supporterDTO = new SupporterDTO();
		supporterDTO.setRecruit_num(applyDTO.getRecruit_num());
		supporterDTO.setId(applyDTO.getId());
		supporterDTO.setCid(companyDTO.getId());
		
		int num = supporterService.applyCount(supporterDTO);
		
		branch:
		if(num < 3) {
			int result = 0;
			if(true) {
				result = applyService.duplicationCheck(applyDTO);
				if(result>0) {
					message = "이미 지원한 공고입니다.";
					break branch;
				}
			}
			Integer integer1 = applyService.insert(applyDTO);
			Integer integer2 = supporterService.insert(supporterDTO);
			
			if(integer1>0 && integer2>0) {
				integer = integer1+integer2;
				message = "성공적으로 지원 되었습니다.";
			}
		} 
//		recruitDTO = recruitService.selectOne(applyDTO.getRecruit_num());
//		companyDTO = companyService.selectOne(recruitDTO.getId());
		
		model.addAttribute("apply_result", integer);
		model.addAttribute("message", message);
		model.addAttribute("recruit", recruitDTO);
		model.addAttribute("company", companyDTO);
		return "recruit/recruitView";
	}
	
	@RequestMapping(value="applyDelete", method=RequestMethod.GET)
	public String delete(ApplyDTO applyDTO, Model model) {
		String message = "다시 시도해주십시오";
		RecruitDTO recruitDTO = recruitService.selectOne(applyDTO.getRecruit_num());
		SupporterDTO supporterDTO = new SupporterDTO();
		supporterDTO.setId(applyDTO.getId());
		supporterDTO.setRecruit_num(applyDTO.getRecruit_num());
		supporterDTO.setCid(recruitDTO.getId());
		
		Integer integer1 = applyService.delete(applyDTO);
		Integer integer2 = supporterService.update(supporterDTO);
		
		if(integer1>0 && integer2>0) message = "성공적으로 지원을 취소하였습니다.";
		
		model.addAttribute("applyDelete", message);
		
		return null;
	}
	
	@RequestMapping(value="applySelectList", method=RequestMethod.GET)
	public String selectList(ApplyDTO applyDTO, ListData listData, Model model, RedirectAttributes ra) {
		List<Object> obj_ar = null;
		String message = "로그인이 필요한 서비스입니다.";
		String path = "redirect:../";
		if(applyDTO.getId() != "") {
			obj_ar = applyService.selectList(applyDTO, listData);
			model.addAttribute("applylist", obj_ar.get(0));
			model.addAttribute("pagelist", obj_ar.get(1));
			path = "apply/applyList";
		} else {
			ra.addFlashAttribute("message", message);
			//model.addAttribute("applymessage", message);
		}
		return path;
	}
}
