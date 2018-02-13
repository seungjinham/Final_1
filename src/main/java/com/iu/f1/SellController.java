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
import com.iu.seller.SellerDTO;
import com.iu.seller.SellerService;
@Controller
@RequestMapping(value="/sell/**")
public class SellController {
	
	@Inject
	private SellerService sellerService;
	
	// 판매자 정보 등록
	@RequestMapping(value="sellerWrite", method=RequestMethod.GET)
	public void sellerWrite() throws Exception{
		
	}
	
	@RequestMapping(value="sellerWrite", method=RequestMethod.POST)
	public ModelAndView sellerWrite(SellerDTO sellerDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = sellerService.sellerWrite(sellerDTO);
		
		String message = "판매자가 등록에 실패하였습니다";
		String path = "../person/personMypage";
		
		if(result>0){
			message="판매자 등록에 성공하였습니다";
			path="../person/personMyPage";
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
		SellerDTO sellerDTO = (SellerDTO) sellerService.sellerOne(id);		
		model.addAttribute("seller", sellerDTO);
		return model;
	}
	
	@RequestMapping(value="sellerUpdate", method=RequestMethod.POST)
	public ModelAndView sellerUpdate(SellerDTO sellerDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result=sellerService.sellerUpdate(sellerDTO);
		
		String message = "정보 수정에 실패하였습니다";
		String path = "../person/personMyPage";
		
		if(result>0){
			message="정보가 수정되었습니다.";
			path="../person/personMyPage";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		return mv;
	}
	
	//판매자 정보 삭제
	@RequestMapping(value="sellerDelete", method=RequestMethod.GET)
	public String sellerDelete(String id, RedirectAttributes rd) throws Exception{
		int result = sellerService.sellerDelete(id);
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
	public void view(HttpSession session, Model model) throws Exception{
		String id = ((MemberDTO) session.getAttribute("member")).getId();
		System.out.println("아이디 : " + id);
		SellerDTO sellerDTO = (SellerDTO) sellerService.sellerOne(id);
		System.out.println("카테고리"+sellerDTO.getCategory());
		model.addAttribute("seller", sellerDTO);
	}
	
	//판매자 목록 보기
	@RequestMapping(value="sellerList")
	public void selectList(String category, Model model) throws Exception{
		model.addAttribute("category", category);
	}
	
}
