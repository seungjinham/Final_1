package com.iu.f1;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.member.MemberDTO;
import com.iu.member.MemberService;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	
	@RequestMapping(value="join")
	public void join(){}
	
	@RequestMapping(value="login")
	public void login(){}
	
	@RequestMapping(value="m_Join", method=RequestMethod.GET)
	public void MemberJoin(){}
	
	@RequestMapping(value="m_Join", method=RequestMethod.POST)
	public ModelAndView MemberJoin(MemberDTO memberDTO, HttpSession session, MultipartFile file) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	} 

}
