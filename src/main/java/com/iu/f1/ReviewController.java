package com.iu.f1;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iu.review.ReviewDTO;
import com.iu.review.ReviewService;
import com.iu.util.ListData;

@Controller
@RequestMapping(value="/review/**")
public class ReviewController {

	private ReviewService reviewService;
	
	
	@RequestMapping(value="reviewWrite", method=RequestMethod.GET)
	public void insert() throws Exception{
	}
	
	
	@RequestMapping(value="reviewWrite", method=RequestMethod.POST)
	public String insert(ReviewDTO reviewDTO) throws Exception{
		int result=reviewService.insert(reviewDTO);
		String message="��� ����";
		if(result>0){
			message="��� ����!";
		}
		return "redirect:./reviewList";
	}
	
	
	@RequestMapping(value="reviewDelete", method=RequestMethod.GET)
	public String delete(int num) throws Exception{
		int result= reviewService.delete(num);
		return "redirect:./reviewList";
	}
	
	
	@RequestMapping(value="reviewUpdate", method=RequestMethod.GET)
	public void update(int num, Model model) throws Exception{
		ReviewDTO reviewDTO = reviewService.selectOne(num);
		model.addAttribute("view", reviewDTO);
	}
	
	
	@RequestMapping(value="reviewUpdate", method=RequestMethod.POST)
	public ModelAndView update(ReviewDTO reviewDTO) throws Exception{
		int result =reviewService.update(reviewDTO);
		String message="������Ʈ ����";
		if(result>0){
			message="������Ʈ ����!";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", message);
		mv.addObject("path", "../review/reviewList");
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping(value="reviewList", method=RequestMethod.GET)
	public ModelAndView selectList(ListData listData) throws Exception{
		ModelAndView mv= new ModelAndView();
		
		List<ReviewDTO> ar= reviewService.selectList(listData);
		
		mv.addObject("list", ar);
		mv.addObject("page", listData);
		mv.setViewName("review/reviewList");
		return mv;
	}	
	
	
	
}
