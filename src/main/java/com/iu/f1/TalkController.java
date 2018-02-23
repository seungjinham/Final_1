package com.iu.f1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iu.qna.QnaDTO;
import com.iu.qna.QnaService;

@Controller
@RequestMapping(value="/talk/**")
public class TalkController {

	@Inject
	private QnaService talkService;
	
	@RequestMapping(value="talkForm", method=RequestMethod.GET)
	public void insert(Model model) throws Exception{
	}
	
	@RequestMapping(value="talkForm", method=RequestMethod.POST)
	public String insert(QnaDTO talkDTO)throws Exception{
		int result=talkService.insert(talkDTO);
		String message="���� ����";
		if(result>0){
			message="���� ����";
		}
		return "redirect:../home";

	}
	
	
}
