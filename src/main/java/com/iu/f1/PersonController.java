package com.iu.f1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iu.person.PersonService;

@Controller
@RequestMapping(value="/person/**")
public class PersonController {
	
	@Inject
	private PersonService personService;
	
	
	//회원가입
	@RequestMapping(value="personJoin", method=RequestMethod.GET)
	public void personJoin(){}
	
	
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
