package com.iu.f1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/paper/**")
public class PaperController {
	
	//이력서 등록
	@RequestMapping(value="paperWrite", method=RequestMethod.GET)
	public void paperWrite() throws Exception{}
	
	//이력서 List
	@RequestMapping(value="paperList", method=RequestMethod.GET)
	public void paperList() throws Exception{}
	
	//이력서 보기
	@RequestMapping(value="paperView", method=RequestMethod.GET)
	public void paperView() throws Exception{}
	
	//이력서 수정
	@RequestMapping(value="paperUpdate", method=RequestMethod.GET)
	public void paperUpdate() throws Exception{}

}
