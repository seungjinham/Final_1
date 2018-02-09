package com.iu.f1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iu.talk.TalkDTO;
import com.iu.talk.TalkService;

@Controller
@RequestMapping(value="/talk/**")
public class TalkController {

	@Inject
	private TalkService talkService;
	
	@RequestMapping(value="talkForm", method=RequestMethod.GET)
	public void insert(Model model) throws Exception{
	}
	
	@RequestMapping(value="talkForm", method=RequestMethod.POST)
	public String insert(TalkDTO talkDTO)throws Exception{
		int result=talkService.insert(talkDTO);
		String message="전송 오류";
		if(result>0){
			message="전송 성공";
		}
		return "redirect:../home";

	}
	
	
}
