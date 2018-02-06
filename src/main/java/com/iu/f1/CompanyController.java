package com.iu.f1;

import java.util.List;

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


	//회원가입
	@RequestMapping(value="companyJoin", method=RequestMethod.GET)
	public void companyJoin(){}

	@RequestMapping(value="companyJoin", method=RequestMethod.POST)
	public ModelAndView companyJoin(CompanyDTO companyDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		result = companyService.join(companyDTO);

		String message = "Join Fail";
		String path = "./companyLogin";

		if(result > 0){
			message = "Join Success";
			path = "../";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
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
	public ModelAndView companyLogin(CompanyDTO companyDTO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = companyService.login(companyDTO);
		
		String message = "Login Fail";
		String path = "./companyLogin";

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
	
	//reqruit
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
			mv.addObject("path", "./companyMyPage");
		}
		mv.setViewName("./common/result");
		
		return mv;
	}

	//MyPage
	@RequestMapping(value="companyMyPage")
	public void companyMypage(HttpSession session) throws Exception {}
	
	//게재 리스트
	@RequestMapping(value="companyRecruitList", method=RequestMethod.GET)
	public ModelAndView companyRecruitList() throws Exception {
		System.out.println("companyRecruitList in");
		List<RecruitDTO> ar = companyService.companyRecruitList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.setViewName("./company/companyRecruitList");
		return mv;
	}
}
