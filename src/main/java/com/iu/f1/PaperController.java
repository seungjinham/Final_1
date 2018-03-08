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

import com.iu.member.MemberDTO;
import com.iu.paper.LicenseDAO;
import com.iu.paper.LicenseDTO;
import com.iu.paper.PaperDTO;
import com.iu.paper.PaperService;
import com.iu.paper.PortDAO;
import com.iu.paper.PortDTO;

@Controller
@RequestMapping("/paper/**")
public class PaperController {
	
	@Inject
	private PaperService paperService;
	@Inject
	private LicenseDAO licenseDAO;
	@Inject
	private PortDAO portDAO;
	
	//이력서 등록
	@RequestMapping(value="paperInsert", method=RequestMethod.GET)
	public void paperInsert() throws Exception{}
	@RequestMapping(value="paperInsert", method=RequestMethod.POST)
	public ModelAndView paperInsert(PaperDTO paperDTO,LicenseDTO licenseDTO,PortDTO portDTO, MultipartFile file,MultipartFile port_file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int count = paperService.count(paperDTO.getId());
		if(count < 3){
			System.out.println("dfkndskfjkejfk");
			int result = paperService.insert(paperDTO, licenseDTO, portDTO, file, port_file, session);
			if(result > 0 ){
				mv.addObject("message", "이력서가 등록 되었습니다.");
				mv.addObject("paper", paperDTO);
			}else{
				mv.addObject("message", "이력서 등록 되지 않았습니다.");
			}
		}else{
			mv.addObject("message", "이력서는 ID당 3개까지만 등록 가능합니다.");
		}
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	
	//이력서 리스트
	@RequestMapping(value="paperList")
	public ModelAndView paperList(PaperDTO paperDTO,LicenseDTO licenseDTO, PortDTO portDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		List<PaperDTO> list = paperService.list(memberDTO.getId());
		int count = paperService.count(memberDTO.getId());
		mv.addObject("p_count", count);
		mv.addObject("list", list);
		mv.setViewName("paper/paperList");
		return mv;
	}
	
	//이력서 보기
	@RequestMapping(value="paperView")
	public ModelAndView paperView(int paper_num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		PaperDTO paperDTO = paperService.view(paper_num);
		LicenseDTO licenseDTO = licenseDAO.view(paper_num);
		PortDTO portDTO = portDAO.view(paper_num);
		mv.addObject("view", paperDTO);
		mv.addObject("license", licenseDTO);
		mv.addObject("port", portDTO);
		mv.setViewName("paper/paperView");
		return mv;
	}
	
	//이력서 수정
	@RequestMapping(value="paperUpdate", method=RequestMethod.GET)
	public String paperUpdate(Model model, int paper_num) throws Exception{
		PaperDTO paperDTO = paperService.view(paper_num);
		LicenseDTO licenseDTO = licenseDAO.view(paper_num);
		PortDTO portDTO = portDAO.view(paper_num);
		model.addAttribute("paper", paperDTO);
		model.addAttribute("license", licenseDTO);
		model.addAttribute("port", portDTO);
		return "paper/paperUpdate";
	}
	@RequestMapping(value="paperUpdate", method=RequestMethod.POST)
	public ModelAndView paperUpdate(PaperDTO paperDTO,LicenseDTO licenseDTO,PortDTO portDTO, MultipartFile file,MultipartFile port_file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = paperService.update(paperDTO, licenseDTO, portDTO, file, port_file, session);
		if(result>0){
			
		}else{
			mv.addObject("message", "수정실패");
		}
		mv.addObject("path", "paperList");
		mv.setViewName("common/result");
		return mv;
	}
	
	//이력서 삭제
	@RequestMapping(value="paperDelete")
	public ModelAndView paperDelete(int paper_num) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = paperService.delete(paper_num);
		if(result > 0){
			mv.addObject("message", "이력서가 삭제 되었습니다.");
		}else{
			mv.addObject("message", "이력서가 삭제 실패");
		}
		mv.addObject("path", "paperList");
		mv.setViewName("common/result");
		return mv;
	}
}
