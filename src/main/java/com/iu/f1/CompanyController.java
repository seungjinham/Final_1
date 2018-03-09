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
	public void companyUpdate(HttpSession session){}

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
	
	
	//=========================== MyPage 기업정보보기  ===========================
	@RequestMapping(value="companyMyPage")
	public void companyMypage(HttpSession session) throws Exception {}

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
	
	//=========================== Login 로그인  ===========================
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
	
	
	//=========================== Write 공고 등록하기  ===========================
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

	
	//=========================== List 게재중인 공고  ===========================
	@RequestMapping(value="companyRecruitList", method=RequestMethod.GET)
	public ModelAndView companyRecruitList(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		CompanyDTO companyDTO= (CompanyDTO) session.getAttribute("member");
		System.out.println(companyDTO.getId());
		
		List<RecruitDTO> ar = companyService.companyRecruitList(companyDTO.getId());
		
		mv.addObject("list", ar);
		mv.setViewName("company/companyRecruitList");
		
		return mv;
	}
	
	//=========================== View 게재중인 공고보기  ===========================
	@RequestMapping(value="companyRecruitView", method=RequestMethod.GET)
	public ModelAndView companyRecruitView(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(num);
		CompanyDTO companyDTO = companyService.companyRecruitView(num);
		mv.addObject("view", companyDTO);
		mv.setViewName("company/companyRecruitView");
		return mv;
	}
	
	//=========================== Delete 공고 삭제  ===========================
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
