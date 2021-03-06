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
import com.iu.util.ConditionDTO;
import com.iu.util.ListData;
import com.iu.util.ListSort;

@Controller
@RequestMapping(value="recruit/**")
public class RecruitController {
	@Inject
	private RecruitService recruitService;
	@Inject
	private CompanyService companyService;
	
	@RequestMapping(value="recruitList", method=RequestMethod.GET)
	public String recruitList(RecruitSearchDTO recruitSearchDTO, Model model, ListData listData, AreaCodeDTO areacodeDTO) {
		List<Object> info = null;
		List<Object> collect_ar = null;
		String path = "recruit/recruitList";
		ListSort listSort = new ListSort();
		ConditionDTO conditionDTO= listSort.check(recruitSearchDTO);
		if(conditionDTO.isCheck()) {
			collect_ar = recruitService.searchSelectList(conditionDTO, listData);
			model.addAttribute("totallist", collect_ar.get(0));
			model.addAttribute("pagelist", collect_ar.get(1));
			model.addAttribute("condition", recruitSearchDTO);
		} else {
			if(areacodeDTO.getSi_value()!=null && areacodeDTO.getGu_value()==null) {
				info = recruitService.searchInfo(areacodeDTO);
				model.addAttribute("gucode", (List<String>)info.get(0));
				model.addAttribute("guname", (Map<String, String>)info.get(1));
				path = "common/gu_result";
			} else if(areacodeDTO.getSi_value()!=null && areacodeDTO.getGu_value()!=null) {
				info = recruitService.searchInfo(areacodeDTO);
				model.addAttribute("dongcode", (List<String>)info.get(0));
				model.addAttribute("dongname", (Map<String, String>)info.get(1));
				path = "common/dong_result";
			} else {
				info = recruitService.searchInfo(areacodeDTO);
				model.addAttribute("sicode", (List<String>)info.get(0));
				model.addAttribute("siname", (Map<String, String>)info.get(1));
				model.addAttribute("jobkind", (List<String>)info.get(2));
			}
			collect_ar = recruitService.selectList(listData);
			model.addAttribute("totallist", collect_ar.get(0));
			model.addAttribute("pagelist", collect_ar.get(1));
		}
		return path;
	}
	
	@RequestMapping(value="recruitSearch", method=RequestMethod.GET)
	public String recruitList(RecruitSearchDTO recruitSearchDTO, Model model, AreaCodeDTO areacodeDTO, ListData listData) {	
		String path = "recruit/recruitSearch";
		List<Object> info = null;
		List<Object> collect_ar = null;
		ListSort listSort = new ListSort();
		ConditionDTO conditionDTO= listSort.check(recruitSearchDTO);
		if(conditionDTO.isCheck()) {
			collect_ar = recruitService.searchSelectList(conditionDTO, listData);
			model.addAttribute("totallist", collect_ar.get(0));
			model.addAttribute("pagelist", collect_ar.get(1));
			model.addAttribute("condition", recruitSearchDTO);
			path = "recruit/recruitSearchList";
		} else {
			if(areacodeDTO.getSi_value()!=null && areacodeDTO.getGu_value()==null) {
				info = recruitService.searchInfo(areacodeDTO);
				model.addAttribute("gucode", (List<String>)info.get(0));
				model.addAttribute("guname", (Map<String, String>)info.get(1));
				path = "common/gu_result";
			} else if(areacodeDTO.getSi_value()!=null && areacodeDTO.getGu_value()!=null) {
				info = recruitService.searchInfo(areacodeDTO);
				model.addAttribute("dongcode", (List<String>)info.get(0));
				model.addAttribute("dongname", (Map<String, String>)info.get(1));
				path = "common/dong_result";
			} else {
				info = recruitService.searchInfo(areacodeDTO);
				model.addAttribute("sicode", (List<String>)info.get(0));
				model.addAttribute("siname", (Map<String, String>)info.get(1));
				model.addAttribute("jobkind", (List<String>)info.get(2));
				model.addAttribute("speckind", (List<String>)info.get(3));
			}
		}
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
	
	@RequestMapping(value="recruitSearchList", method=RequestMethod.GET)
	public String Search() {
		return "recruit/recruitSearchList";
	}
}
