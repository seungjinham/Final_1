package com.iu.f1;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/member/**")
public class MemberContorller {
	
	@RequestMapping(value="join")
	public void join(){}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void login(){}
	
	//LogOut
	@RequestMapping(value="memberLogOut")
	public ModelAndView memberLogOut(HttpSession session){
		ModelAndView mv  = new ModelAndView();
		mv.addObject("message", "LogOut Success");
		session.invalidate();
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping(value="findId", method=RequestMethod.GET)
	public void findId(){}
	
	@RequestMapping(value="findPw", method=RequestMethod.GET)
	public void findPw(){}
}
