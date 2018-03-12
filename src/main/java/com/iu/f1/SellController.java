package com.iu.f1;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iu.member.MemberDTO;
import com.iu.seller.FavorDTO;
import com.iu.seller.OptionDTO;
import com.iu.seller.SellerDTO;
import com.iu.seller.SellerService;
@Controller
@RequestMapping(value="/sell/**")
public class SellController {
	
	@Inject
	private SellerService sellerService;
	
	//=========================== Write 판매자 등록  ===========================
	@RequestMapping(value="sellerWrite", method=RequestMethod.GET)
	public void sellerWrite() throws Exception{
		
	}
	
	@RequestMapping(value="sellerWrite", method=RequestMethod.POST)
	public ModelAndView sellerWrite(SellerDTO sellerDTO,HttpSession session, MultipartFile file[]) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = sellerService.sellerWrite(sellerDTO,session, file);
		
		String message = "판매자가 등록에 실패하였습니다";
		String path = "../person/personMyPage";
		
		if(result>0){
			message="판매자 등록에 성공하였습니다";
			path="../person/personMyPage";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		return mv;
	}
	
	//=========================== Update 판매자 정보 수정 ===========================
	@RequestMapping(value="sellerUpdate", method=RequestMethod.GET)
	public ModelAndView sellerUpdate(HttpSession session, MultipartFile[] file) throws Exception{
		ModelAndView mv = new ModelAndView();		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		SellerDTO sellerDTO = new SellerDTO();
		sellerDTO.setId(memberDTO.getId());
		
		sellerDTO=sellerService.sellerOne(sellerDTO);
		mv.addObject("seller", sellerDTO);
		mv.setViewName("sell/sellerUpdate");
		
		return mv;
	}
	
	@RequestMapping(value="sellerUpdate", method=RequestMethod.POST)
	public ModelAndView sellerUpdate(SellerDTO sellerDTO, HttpSession session,OptionDTO optionDTO[],MultipartFile file[]) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result=sellerService.sellerUpdate(sellerDTO,session, optionDTO,file);
		
		String message = "정보 수정에 실패하였습니다";
		String path = "../sell/sellerUpdate";
		
		if(result>0){
			message="정보가 수정되었습니다.";
			path="../person/personMyPage";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		return mv;
	}
	
	//=========================== Delete 판매자 정보 삭제 ===========================
	@RequestMapping(value="sellerDelete", method=RequestMethod.GET)
	public String sellerDelete(SellerDTO sellerDTO, HttpSession session, MultipartFile file[], RedirectAttributes rd) throws Exception{
		int result = sellerService.sellerDelete(sellerDTO,session);
		String message="삭제에 실패하였습니다";
		
		if(result>0){
			message="판매자 정보가 삭제되었습니다";
		}
		
		rd.addFlashAttribute("message", message);
		return "redirect:./personMyPage";
	}
	
	//=========================== List 판매자 목록 ===========================
	@RequestMapping(value="sellerList", method=RequestMethod.GET)
	public ModelAndView selectList(String category) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<SellerDTO> ar = sellerService.sellerList(category);
		
		mv.addObject("list", ar);
		mv.addObject("category", category);
		mv.setViewName("sell/sellerList");
		return mv;
	}
	
	//=========================== View 판매자 페이지 ===========================
	@RequestMapping(value="sellerView", method=RequestMethod.GET)
	public ModelAndView view(String id, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		SellerDTO sellerDTO = new SellerDTO();
		sellerDTO.setId(id);
		sellerDTO = (SellerDTO) sellerService.sellerOne(sellerDTO);
		
		String pid= ((MemberDTO) (session.getAttribute("member"))).getId();
		if(pid != null) {
			FavorDTO favorDTO = new FavorDTO();
			favorDTO.setId(pid);
			favorDTO.setSeller(id);
			mv.addObject("favor", favorDTO);
			
		}
		mv.addObject("seller", sellerDTO);
		mv.setViewName("sell/sellerView");
		return mv;
	}
	
	//=========================== FavorInsert 즐겨찾기 추가 ===========================
	@RequestMapping(value="favorInsert", method=RequestMethod.POST)
	public void favorInsert(FavorDTO favorDTO, RedirectAttributes rd) throws Exception{
		int result = sellerService.favorInsert(favorDTO);
		String message="추가에 실패했습니다";
		
		if(result>0){
			message="즐겨찾기에 추가되었습니다";
		}
		
		rd.addFlashAttribute("message", message);
	}
	
	//=========================== FavorInsert 즐겨찾기 삭제 ===========================	
	@RequestMapping(value="favorDelete", method=RequestMethod.POST)
	public void favorDelete(FavorDTO favorDTO, RedirectAttributes rd) throws Exception{
		int result = sellerService.favorInsert(favorDTO);
		String message="삭제에 실패했습니다";
		
		if(result>0){
			message="즐겨찾기가 삭제되었습니다";
		}
		
		rd.addFlashAttribute("message", message);

	}
	
	//=========================== FavorList 즐겨찾기 리스트 ===========================
	@RequestMapping(value="favorList")
	public ModelAndView favorList(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		String id = ((MemberDTO) session.getAttribute("member")).getId();
		List<FavorDTO> ar = sellerService.favorList(id);
		
		mv.addObject("list", ar);
		mv.setViewName("sell/favorList");
		return mv;
	}
}
