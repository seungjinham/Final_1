package com.iu.f1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iu.member.MemberDTO;
import com.iu.person.PersonService;

@Controller
@RequestMapping(value="/person/**")
public class PersonController {
	
	@Inject
	private PersonService personService;
	
	
	//회원가입
	@RequestMapping(value="personJoin", method=RequestMethod.GET)
	public void personJoin(){}
	
	@RequestMapping(value="personJoin", method=RequestMethod.POST)
	public ModelAndView personJoin(MemberDTO memberDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = personService.memberJoin(memberDTO);
		result = personService.join(memberDTO);
		if(result>0){
			mv.addObject("message", "Join Success");
		}else{
			mv.addObject("message", "Join Fail");
		}
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	
	
	//회원수정
	@RequestMapping(value="personUpdate", method=RequestMethod.GET)
	public void personUpdate(){}
	
	//회원탈퇴
	@RequestMapping(value="personDelete")
	public void personDelete(){}

	//로그인
	@RequestMapping(value="personLogin", method=RequestMethod.GET)
	public void personLogin(){}
	
	//로그아웃
}
