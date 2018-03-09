package com.iu.f1;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.company.CompanyDTO;
import com.iu.member.MemberDTO;
import com.iu.paper.LicenseDAO;
import com.iu.paper.LicenseDTO;
import com.iu.paper.PaperDTO;
import com.iu.paper.PaperService;
import com.iu.paper.PortDAO;
import com.iu.paper.PortDTO;
import com.iu.supporter.SupporterDTO;
import com.iu.supporter.SupporterService;

@Controller
@RequestMapping("/supporter/**")
public class SupporterController {
	
	@Inject
	private SupporterService supporterService;
	@Inject
	private LicenseDAO licenseDAO;
	@Inject
	private PortDAO portDAO;
	
	//지원자 이력서리스트
	@RequestMapping(value="supporterList")
	public ModelAndView supporterList(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		CompanyDTO companyDTO = (CompanyDTO) session.getAttribute("member");
		List<SupporterDTO> ar = supporterService.supporterList(companyDTO.getId());
		
		List<PaperDTO> list=null;
		
		for(SupporterDTO s : ar){
			list = supporterService.paperlist(s.getId());			
		}
				
		mv.addObject("list", list);
		mv.setViewName("supporter/supporterList");
		return mv;
	}
	
	//지원자 이력서보기
	@RequestMapping(value="supporterView")
	public ModelAndView supporterView(int paper_num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		PaperDTO paperDTO = supporterService.view(paper_num);
		LicenseDTO licenseDTO = licenseDAO.view(paper_num);
		PortDTO portDTO = portDAO.view(paper_num);
		mv.addObject("view", paperDTO);
		mv.addObject("license", licenseDTO);
		mv.addObject("port", portDTO);
		mv.setViewName("supporter/supporterView");
		return mv;
	}
}
