package com.iu.f1;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.annotation.SynthesizedAnnotation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iu.company.CompanyDTO;
import com.iu.company.CompanyService;
import com.iu.member.MemberDTO;
import com.iu.person.PersonDTO;
import com.iu.recruit.RecruitDTO;
import com.iu.recruit.RecruitService;

@Controller
@RequestMapping(value="/company/**")
public class CompanyController {

	@Inject
	private CompanyService companyService;


	//회원가입
	@RequestMapping(value="companyJoin", method=RequestMethod.GET)
	public void companyJoin(){}

	@RequestMapping(value="companyJoin", method=RequestMethod.POST)
	public String companyJoin(CompanyDTO companyDTO) throws Exception {
		int result = companyService.join(companyDTO);
		if(result>0){
		}
		return "redirect:../";
	}
	
	//회원가입 시 IDCheck
	@RequestMapping(value="companyIdCheck", method=RequestMethod.GET)
	public ModelAndView personIdCheck(String id) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = companyService.idCheck(id);
		if(memberDTO == null){
			mv.addObject("result", "사용 가능한 ID 입니다.");
		}else{
			mv.addObject("result", "중복된 ID 입니다.");
		}
		mv.setViewName("common/joinResult");
		return mv;
	}


	//회원수정
	@RequestMapping(value="companyUpdate", method=RequestMethod.GET)
	public void companyUpdate(){}

	@RequestMapping(value="companyUpdate", method=RequestMethod.POST)
	public ModelAndView companyUpdate(CompanyDTO companyDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = companyService.update(companyDTO);
		
		String message = "Update Fail";
		String path = "./companyMyPage";

		if(result>0){
			session.setAttribute("member", companyDTO);
			message = "Updae Success";
			path = "./companyMyPage";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		return mv;
	}
	
	//회원탈퇴
	@RequestMapping(value="companyDelete")
	public void companyDelete(){}

	//recruit 수정폼
	@RequestMapping(value="companySelectOne")
	public ModelAndView companySelectOne(int num){
		RecruitDTO recruitDTO = companyService.companySelectOne(num);
		ModelAndView mv = new ModelAndView();
		mv.addObject("recruitDTO", recruitDTO);
		mv.setViewName("company/companySelectOne");
		return mv;
	}
	
	//recruit 수정 
	@RequestMapping(value="companyRecruitUpdate")
	public String companyRecruitUpdate(RecruitDTO recruitDTO) {
		int result = 0;
		System.out.println("in");
		result = companyService.companyRecruitUpdate(recruitDTO);
		
		return "redirect:company/companyRecruitList";
	}
	
	//로그인
	@RequestMapping(value="companyLogin", method=RequestMethod.GET)
	public void companyLogin(){}

	@RequestMapping(value="companyLogin", method=RequestMethod.POST)
	public ModelAndView companyLogin(CompanyDTO companyDTO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = companyService.login(companyDTO);
		
		String path = "../member/login";

		if(memberDTO != null){
			session.setAttribute("member", memberDTO);
			path = "../";
			mv.addObject("path", path);
			mv.setViewName("common/loginResult");
		}else{
			mv.addObject("result", "c_login");
			mv.setViewName("member/login");
		}
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
	public ModelAndView companyRecruitList(HttpSession session) throws Exception {
		CompanyDTO companyDTO= (CompanyDTO) session.getAttribute("member");
		System.out.println(1);
		String c_name = companyDTO.getC_name();
		System.out.println(c_name);
		List<RecruitDTO> ar = companyService.companyRecruitList(c_name);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.setViewName("./company/companyRecruitList");
		return mv;
	}
	
	//등록취소
	@RequestMapping(value="companyRecruitDelete", method=RequestMethod.GET)
	public ModelAndView companyRecruitDelete(int num, String fname, HttpSession session) throws Exception {
		System.out.println(num);
		System.out.println(fname);
		int result = companyService.companyRecruitDelete(num, fname, session);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("company/companyRecruitDelete");
		return mv;
	}
}
