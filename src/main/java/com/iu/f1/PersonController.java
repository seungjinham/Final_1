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
	public ModelAndView personJoin(PersonDTO personDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = personService.join(personDTO);

		String message = "Join Fail";
		String path = "./personJoin";

		if(result>0){
			message = "Join Success";
			path = "../";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		return mv;
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
	@RequestMapping(value="personDelete")
	public void personDelete(){}

	
	//로그인
	@RequestMapping(value="personLogin", method=RequestMethod.GET)
	public void personLogin(){}

	@RequestMapping(value="personLogin", method=RequestMethod.POST)
	public ModelAndView personLogin(PersonDTO personDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = personService.login(personDTO);
		
		String message = "Login Fail";
		String path = "./personLogin";

		if(memberDTO != null){
			session.setAttribute("member", memberDTO);
			message = "Login Success";
			path = "../";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		return mv;
	}

	
	//MyPage
	@RequestMapping(value="personMyPage", method=RequestMethod.GET)
	public void personMyPage(HttpSession session) throws Exception{}
	
	//회원수정
	@RequestMapping(value="pseronMyPage", method=RequestMethod.POST)
	public ModelAndView personUpdate(PersonDTO personDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = personService.update(personDTO);
		
		String message = "Update Fail";
		String path = "./personMyPage";

		if(result>0){
			session.setAttribute("member", personDTO);
			message = "Updae Success";
			path = "./personMyPage";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		return mv;
	}

	

	
	
	//=======================   Seller (판매자)  ========================
	
	@RequestMapping(value="sellerWrite", method=RequestMethod.GET)
	public void sellerWrite1() throws Exception{
		
	}
	
	@RequestMapping(value="sellerWrite", method=RequestMethod.POST)
	public void sellerWrite() throws Exception{
		
	}
	
	@RequestMapping(value="sellerUpdate", method=RequestMethod.GET)
	public void sellerUpdate() throws Exception{
		
	}
	
	@RequestMapping(value="sellerDelete", method=RequestMethod.GET)
	public String sellerDelete() throws Exception{
		return "redirect:./personMyPage";
	}
}


