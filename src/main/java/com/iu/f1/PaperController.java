package com.iu.f1;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.paper.LicenseDTO;
import com.iu.paper.PaperDTO;
import com.iu.paper.PaperService;
import com.iu.paper.PortDTO;

@Controller
@RequestMapping("/paper/**")
public class PaperController {
	
	@Inject
	private PaperService paperService;
	
	//이력서 등록
	@RequestMapping(value="paperInsert", method=RequestMethod.GET)
	public void paperInsert() throws Exception{}
	@RequestMapping(value="paperInsert", method=RequestMethod.POST)
	public ModelAndView paperInsert(PaperDTO paperDTO,LicenseDTO licenseDTO,PortDTO portDTO, MultipartFile file,MultipartFile port_file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int count = paperService.count(paperDTO.getId());
		if(count < 3){
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
	
	//이력서 수정
	@RequestMapping(value="paperUpdate", method=RequestMethod.GET)
	public void paperUpdate() throws Exception{}

}
