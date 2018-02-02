package com.iu.f1;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iu.member.MemberDTO;
import com.iu.person.PersonDTO;
import com.iu.person.PersonService;
import com.iu.seller.SellerDTO;

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


	//회원수정
	@RequestMapping(value="personUpdate", method=RequestMethod.GET)
	public void personUpdate(){}

	//회원탈퇴
	@RequestMapping(value="personDelete")
	public void personDelete(){
		
	}

	
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
	@RequestMapping(value="personMyPage")
	public void personMyPage(HttpSession session) throws Exception{}

	
	
	//=======================   Seller (판매자)  ========================
	
	// 판매자 정보 등록
	@RequestMapping(value="sellerWrite", method=RequestMethod.GET)
	public void sellerWrite() throws Exception{
		
	}
	
	@RequestMapping(value="sellerWrite", method=RequestMethod.POST)
	public ModelAndView sellerWrite(SellerDTO sellerDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = personService.sellerWrite(sellerDTO);
		
		String message = "판매자가 등록에 실패하였습니다";
		String path = "./personMypage";
		
		if(result>0){
			message="판매자 등록에 성공하였습니다";
			path="./sellerMypage";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		return mv;
	}
	
	//판매자 정보 수정
	@RequestMapping(value="sellerUpdate", method=RequestMethod.GET)
	public Model sellerUpdate(HttpSession session, Model model) throws Exception{
		String id = ((MemberDTO) session.getAttribute("member")).getId();
		SellerDTO sellerDTO = (SellerDTO) personService.sellerOne(id);		
		model.addAttribute("seller", sellerDTO);
		return model;
	}
	
	@RequestMapping(value="sellerUpdate", method=RequestMethod.GET)
	public void sellerUpdate(SellerDTO sellerDTO) throws Exception{
		personService.sellerUpdate(sellerDTO);
	}
	
	//판매자 정보 삭제
	@RequestMapping(value="sellerDelete", method=RequestMethod.GET)
	public String sellerDelete(String id, RedirectAttributes rd) throws Exception{
		int result = personService.sellerDelete(id);
		String message="삭제에 실패하였습니다";
		
		if(result>0){
			message="판매자 정보가 삭제되었습니다";
		}
		
		rd.addFlashAttribute("message", message);
		return "redirect:./personMyPage";
	}
	
	//판매자 정보 보기
	//========== View ==========
	@RequestMapping(value="sellerView")
	public void view() throws Exception{
		
	}
	
}


