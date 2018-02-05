package com.iu.f1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iu.apply.ApplyDTO;
import com.iu.apply.ApplyService;
import com.iu.supporter.SupporterService;

@Controller
@RequestMapping(value="apply/**", method=RequestMethod.GET)
public class ApplyController {
	@Inject
	private ApplyService applyService;
	@Inject
	private SupporterService supporterService;
	
	@RequestMapping(value="applyInsert", method=RequestMethod.GET)
	public String insert(ApplyDTO applyDTO, Model model) {
		Integer integer1 = applyService.insert(applyDTO);
		Integer integer2 = supporterService.insert(applyDTO);
		Integer integer = 0;
		if(integer1>0 && integer2>0) integer = integer1+integer2;
		model.addAttribute("apply_result", integer);
		return "recruit/recruitDetailView";
	}
}
