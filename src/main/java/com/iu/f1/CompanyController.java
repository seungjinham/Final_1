package com.iu.f1;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.company.CompanyDTO;
import com.iu.company.CompanyService;
import com.iu.member.MemberDTO;
import com.iu.recruit.RecruitDTO;

@Controller
@RequestMapping(value="/company/**")
public class CompanyController {
	
	@Inject
	private CompanyService companyService;
	
	@RequestMapping(value="companyMyPage")
	public ModelAndView companyMypage(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		String id=session.getId();
		CompanyDTO companyDTO = companyService.MyPage(id);
		mv.addObject("companyDTO", companyDTO);
		mv.setViewName("company/companyMyPage");
		return mv;
	}
	
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
	
	@RequestMapping(value="companyLogin", method=RequestMethod.POST)
	public ModelAndView companyLogin(MemberDTO memberDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = companyService.login(memberDTO);
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
	
	//reqruit
	//to do
	@RequestMapping(value="companyRecruit", method=RequestMethod.GET)
	public void companyRecruit() {}
	
	@RequestMapping(value="companyRecruit", method=RequestMethod.POST)
	public ModelAndView companyRecruit(RecruitDTO recruitDTO, MultipartFile file, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int num = companyService.companyRecruit(recruitDTO, file, session);
		if(recruitDTO.equals("null")) {
			mv.addObject("message", "fail");
			mv.addObject("path", "../");
		} else {
			mv.addObject("message", "success");
			mv.addObject("path", "../");
		}
		mv.setViewName("./common/result");
		
		return mv;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}