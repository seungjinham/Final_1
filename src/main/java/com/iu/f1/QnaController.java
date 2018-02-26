package com.iu.f1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String insert(QnaDTO qnaDTO, Model model)throws Exception{
		int result=qnaService.insert(qnaDTO);
		String message="접수에 실패하였습니다";
		if(result>0){
			message="문의/제안이 정상적으로 접수되었습니다";
		}
		
		model.addAttribute("message", message);
		
		return "redirect:../";

	}
	
	
}
