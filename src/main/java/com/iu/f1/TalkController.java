package com.iu.f1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iu.talk.TalkService;

@Controller
@RequestMapping(value="/talk/**")
public class TalkController {

	@Inject
	private TalkService talkService;
	
	
	
	
}
