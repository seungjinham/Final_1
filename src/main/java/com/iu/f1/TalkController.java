package com.iu.f1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
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
	public void insert(TalkDTO talkDTO) throws Exception{
		
	}
	
	
}
