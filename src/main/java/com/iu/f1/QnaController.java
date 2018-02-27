package com.iu.f1;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iu.qna.QnaDTO;
import com.iu.qna.QnaService;

@Controller
@RequestMapping(value="/qna/**")
public class QnaController {

	@Inject
	private QnaService qnaService;
	
	@RequestMapping(value="qnaWrite", method=RequestMethod.GET)
	public void insert(Model model) throws Exception{
	}
	
	@RequestMapping(value="qnaWrite", method=RequestMethod.POST)
	public String insert(QnaDTO qnaDTO, HttpSession session, MultipartFile file, RedirectAttributes rd)throws Exception{
		int result=qnaService.insert(qnaDTO, session, file);
		
		String message="접수에 실패하였습니다";
		
		if(result>0){
			message="문의/제안이 정상적으로 접수되었습니다";
		}
		
		rd.addFlashAttribute("message", message);		
		return "redirect:../";

	}
	
	@RequestMapping(value="qnaDelete")
	public String delete(QnaDTO qnaDTO, HttpSession session, RedirectAttributes rd) throws Exception{
		int result=qnaService.delete(qnaDTO, session);
		
		String message = "Delete Fail";
		
		if(result>0){
			message = "Success";
			session.invalidate();
		}
		
		rd.addFlashAttribute("message", message);
		return "redirect:../";
	}
		
	
}
