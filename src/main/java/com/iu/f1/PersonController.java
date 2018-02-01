package com.iu.f1;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iu.member.MemberDTO;
import com.iu.person.PersonDTO;
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
	public ModelAndView personJoin(PersonDTO personDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = personService.join(personDTO);
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
	
	@RequestMapping(value="personLogin", method=RequestMethod.POST)
	public ModelAndView personLogin(MemberDTO memberDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = personService.login(memberDTO);
		if(memberDTO != null){
			session.setAttribute("member", memberDTO);
			mv.addObject("message", "Login Success");
		}else{
			mv.addObject("message", "Login Fail");
		}
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
		}
	
	}
	
	//로그아웃

