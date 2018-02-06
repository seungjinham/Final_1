package com.iu.f1;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iu.faq.FaqDTO;
import com.iu.faq.FaqService;
import com.iu.util.ListData;

@Controller
@RequestMapping(value="/faq/**")
public class FaqController {

	@Inject
	private FaqService faqService;
	
	@RequestMapping(value="faqList", method=RequestMethod.GET)
	public ModelAndView selectList(ListData listData) throws Exception{
		ModelAndView mv= new ModelAndView();
		
		List<FaqDTO> ar= faqService.selectList(listData);
		
		mv.addObject("list", ar);
		mv.addObject("page", listData);
		mv.setViewName("faq/faqList");
		return mv;
	
	}	
	
	@RequestMapping(value="faqWrite", method=RequestMethod.GET)
	public void insert(Model model) throws Exception{
		
	}
	
	@RequestMapping(value="faqWrite", method=RequestMethod.POST)
	public String insert(FaqDTO faqDTO) throws Exception{
		int result=faqService.insert(faqDTO);
		String message="등록 오류";
		if(result>0){
			message="등록 성공";
		}
		return "redirect:./faqList";
	}
	
	
	@RequestMapping(value="faqDelete", method=RequestMethod.GET)
	public String delete(int num) throws Exception{
		int result= faqService.delete(num);
		
		return "redirect:./faqList"; 
	}
	
	@RequestMapping(value="faqUpdate", method=RequestMethod.GET)
	public void update(int num, Model model)throws Exception{
		FaqDTO faqDTO= faqService.selectOne(num);
		model.addAttribute("view", faqDTO);
	}
	
	@RequestMapping(value="faqUpdate", method=RequestMethod.POST)
	public ModelAndView update(FaqDTO faqDTO) throws Exception{
		System.out.println(faqDTO.getNum());
		System.out.println(faqDTO.getTitle());
		System.out.println(faqDTO.getContents());
		int result=faqService.update(faqDTO);
		String message="업데이트 실패";
		if(result>0){
			message="업데이트 성공";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", message);
		mv.addObject("path", "../faq/faqList");
		mv.setViewName("common/result");

		return mv;
	}
	
	@RequestMapping(value="faqView", method=RequestMethod.GET)
	public ModelAndView selectOne(int num)throws Exception{
		FaqDTO faqDTO = faqService.selectOne(num);
		ModelAndView mv = new ModelAndView();
		mv.addObject("view", faqDTO);
		mv.setViewName("faq/faqView");
		return mv;
	}
	
	
	
	
	

}