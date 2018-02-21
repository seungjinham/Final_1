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

	//=======================   Person (개인회원)  =======================

	//회원가입
	@RequestMapping(value="personJoin", method=RequestMethod.GET)
	public void personJoin(){}

	@RequestMapping(value="personJoin", method=RequestMethod.POST)
	public String personJoin(PersonDTO personDTO)throws Exception{
		int result = personService.join(personDTO);
		if(result>0){
		}
		return "redirect:../";
	}
	
	//회원가입 시 IDCheck
	@RequestMapping(value="personIdCheck", method=RequestMethod.GET)
	public ModelAndView personIdCheck(String id) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = personService.idCheck(id);
		if(memberDTO == null){
			mv.addObject("result", "사용 가능한 ID 입니다.");
		}else{
			mv.addObject("result", "중복된 ID 입니다.");
		}
		mv.setViewName("common/joinResult");
		return mv;
	}

	//회원탈퇴
	@RequestMapping(value="personDelete", method=RequestMethod.GET)
	public void personDelete(){}
	
	@RequestMapping(value="personDelete", method=RequestMethod.POST)
	public ModelAndView personDelete(HttpSession session) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		int result = personService.delete(memberDTO, session);
		ModelAndView mv  = new ModelAndView();
		if(result > 0){
			mv.addObject("message", "삭제 되었습니다.");
			session.invalidate();
		}else{
			mv.addObject("message", "Delete Fail");
		}
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	

	
	//로그인
	@RequestMapping(value="personLogin", method=RequestMethod.GET)
	public void personLogin(){}

	@RequestMapping(value="personLogin", method=RequestMethod.POST)
	public ModelAndView personLogin(PersonDTO personDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = personService.login(personDTO);
		
		String path = "../member/login";

		if(memberDTO != null){
			session.setAttribute("member", memberDTO);
			path = "../";
			mv.addObject("path", path);
			mv.setViewName("common/loginResult");
		}else{
			mv.addObject("result", "p_login");
			mv.setViewName("member/login");
		}
		return mv;
	}

	
	//MyPage
	@RequestMapping(value="personMyPage", method=RequestMethod.GET)
	public void personMyPage(HttpSession session) throws Exception{}
	
	//회원수정
	@RequestMapping(value="personUpdate", method=RequestMethod.GET)
	public void personUpdate(HttpSession session) throws Exception{}
	
	@RequestMapping(value="personUpdate", method=RequestMethod.POST)
	public ModelAndView personUpdate(PersonDTO personDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = personService.update(personDTO);
		
		String message = "Updae Fail";
		String path = "./personMyPage";

		if(result>0){
			session.setAttribute("member", personDTO);
			message = "정보가 수정 되었습니다.";
			path = "./personMyPage";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		return mv;
	}
}


