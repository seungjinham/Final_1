package com.iu.f1;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String insert(FaqDTO faqDTO, Model model, ListData listData) throws Exception{
		int result=faqService.insert(faqDTO);
		String message="입력실패";
		String path="\"redirect:./faqList\"";
		if(result>0){
			message="입력성공";
			path = "faq/faqList";
			List<FaqDTO> ar= faqService.selectList(listData);
			model.addAttribute("list", ar);
			model.addAttribute("page", listData);
		}
		return path;
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
	public String update(FaqDTO faqDTO, ListData listData, Model model) throws Exception{
		List<FaqDTO> ar=null;
		int result=faqService.update(faqDTO);
		String message="수정실패";
		String path="\"redirect:./faqList\"";
		if(result>0){
			message="수정성공";
			ar= faqService.selectList(listData);
			path = "faq/faqList";
		}
		model.addAttribute("list", ar);
		model.addAttribute("message", message);
/*		ModelAndView mv = new ModelAndView();
		mv.addObject("message", message);
		mv.addObject("path", "../faq/faqList");
		mv.addObject("list", ar);
		mv.setViewName("common/result");*/

		return path;
	}
}