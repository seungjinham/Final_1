package com.iu.f1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/member/**")
public class MemberContorller {
	
	@RequestMapping(value="join")
	public void join(){}
	
	@RequestMapping(value="login")
	public void login(){}

}
