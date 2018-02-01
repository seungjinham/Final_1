package com.iu.f1;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
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

}