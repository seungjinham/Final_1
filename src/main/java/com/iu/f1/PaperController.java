package com.iu.f1;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.paper.CareerDTO;
import com.iu.paper.HopeDTO;
import com.iu.paper.PaperDTO;
import com.iu.paper.PaperService;
import com.iu.paper.SchoolDTO;

@Controller
@RequestMapping("/paper/**")
public class PaperController {
	
	@Inject
	private PaperService paperService;
	
	//이력서 등록
	@RequestMapping(value="paperInsert", method=RequestMethod.GET)
	public void paperInsert() throws Exception{}
	@RequestMapping(value="paperInsert", method=RequestMethod.POST)
	public ModelAndView paperInsert(PaperDTO paperDTO,SchoolDTO schoolDTO,HopeDTO hopeDTO,CareerDTO careerDTO, MultipartFile file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = paperService.insert(paperDTO, schoolDTO, hopeDTO, careerDTO, file, session);
		if(result > 0 ){
			mv.addObject("message", "이력서가 등록 되었습니다.");
		}else{
			mv.addObject("message", "이력서 등록 되지 않았습니다.");
		}
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	
	//이력서 List
	@RequestMapping(value="paperList", method=RequestMethod.GET)
	public void paperList() throws Exception{}
	
	//이력서 보기
	@RequestMapping(value="paperView", method=RequestMethod.GET)
	public void paperView() throws Exception{}
	
	//이력서 수정
	@RequestMapping(value="paperUpdate", method=RequestMethod.GET)
	public void paperUpdate() throws Exception{}

}
