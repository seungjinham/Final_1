package com.iu.f1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iu.company.CompanyService;

@Controller
@RequestMapping(value="/company/**")
public class CompanyController {
	
	@Inject
	private CompanyService companyService;
	
	
	//회원가입
	@RequestMapping(value="companyJoin", method=RequestMethod.GET)
	public void companyJoin(){}
	
	
	//회원수정
	@RequestMapping(value="companyUpdate", method=RequestMethod.GET)
	public void companyUpdate(){}
	
	//회원탈퇴
	@RequestMapping(value="companyDelete")
	public void companyDelete(){}

	//로그인
	@RequestMapping(value="companyLogin", method=RequestMethod.GET)
	public void companyLogin(){}
	
	//로그아웃
}
