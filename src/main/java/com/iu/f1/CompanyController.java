package com.iu.f1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iu.company.CompanyDTO;
import com.iu.company.CompanyService;
import com.iu.member.MemberDTO;

@Controller
@RequestMapping(value="/company/**")
public class CompanyController {
	
	@Inject
	private CompanyService companyService;
	
	
	//회원가입
	@RequestMapping(value="companyJoin", method=RequestMethod.GET)
	public void companyJoin(){}
	
	@RequestMapping(value="companyJoin", method=RequestMethod.POST)
	public ModelAndView companyJoin(CompanyDTO companyDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		result = companyService.join(companyDTO);
		if(result>0) {
			mv.addObject("message", "JoinSuccess");
			mv.addObject("path", "../");
		} else {
			mv.addObject("message", "JoinFail");
			mv.addObject("path", "../");
		}
		mv.setViewName("common/result");
		return mv;
	}
	
	
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
