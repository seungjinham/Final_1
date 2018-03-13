package com.iu.f1;

import java.util.Date;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iu.member.MemberDTO;
import com.iu.person.MyAuthentication;
import com.iu.person.PersonDTO;
import com.iu.person.PersonService;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Controller
@RequestMapping(value="/person/**")
public class PersonController {

	@Inject
	private PersonService personService;

	//=======================   Person (개인회원)  =======================

	//회원가입
	@RequestMapping(value="personJoin", method=RequestMethod.GET)
	public void personJoin(){}

	@RequestMapping(value="personJoin", method=RequestMethod.POST)
	public String personJoin(PersonDTO personDTO)throws Exception{
		int result = personService.join(personDTO);
		if(result>0){
		}
		return "redirect:../";
	}

	//회원가입 시 IDCheck
	@RequestMapping(value="personIdCheck", method=RequestMethod.GET)
	public ModelAndView personIdCheck(String id) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = personService.idCheck(id);
		if(memberDTO == null){
			mv.addObject("result", "사용 가능한 ID 입니다.");
		}else{
			mv.addObject("result", "중복된 ID 입니다.");
		}
		mv.setViewName("common/joinResult");
		return mv;
	}

	//회원탈퇴
	@RequestMapping(value="personDelete", method=RequestMethod.GET)
	public void personDelete(){}

	@RequestMapping(value="personDelete", method=RequestMethod.POST)
	public ModelAndView personDelete(HttpSession session) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv  = new ModelAndView();
		int result = personService.delete(memberDTO, session);
		if(result > 0){
			mv.addObject("message", "삭제 되었습니다.");
			session.invalidate();
		}else{
			mv.addObject("message", "Delete Fail");
		}
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;

	}



	//로그인
	@RequestMapping(value="personLogin", method=RequestMethod.GET)
	public void personLogin(){}

	@RequestMapping(value="personLogin", method=RequestMethod.POST)
	public ModelAndView personLogin(PersonDTO personDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = personService.login(personDTO);

		String path = "../member/login";

		if(memberDTO != null){
			session.setAttribute("member", memberDTO);
			path = "../";
			mv.addObject("path", path);
			mv.setViewName("common/loginResult");
		}else{
			mv.addObject("result", "p_login");
			mv.setViewName("member/login");
		}
		return mv;
	}


	//MyPage
	@RequestMapping(value="personMyPage", method=RequestMethod.GET)
	public ModelAndView personMyPage(HttpSession session) throws Exception{
		ModelAndView mv  = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		if(memberDTO == null){
			mv.addObject("message", "로그인이 필요한 서비스 입니다.");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
		}else{
			if(memberDTO.getJob().equals("C")){
				mv.addObject("message", "개인 회원만 사용 가능한 서비스 입니다.");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
			}else{
				mv.setViewName("person/personMyPage");
			}
		}
		return mv;
	}


	//회원수정
	@RequestMapping(value="personUpdate", method=RequestMethod.GET)
	public void personUpdate(HttpSession session) throws Exception{}

	@RequestMapping(value="personUpdate", method=RequestMethod.POST)
	public ModelAndView personUpdate(PersonDTO personDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = personService.update(personDTO);

		String message = "Update Fail";
		String path = "./personMyPage";

		if(result>0){
			session.setAttribute("member", personDTO);
			message = "정보가 수정 되었습니다.";
			path = "./personMyPage";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		return mv;
	}

	//이메일 인증
	@RequestMapping(value = "p_sendMail", method = RequestMethod.GET)
	public ModelAndView p_sendMail(MemberDTO memberDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		String checkmsg = "";
		String result = "";
		try {
			mv.addObject("email", memberDTO.getEmail());

		} catch (Exception e) {
			// TODO: handle exception
		}

		String mailserver = "mw-002.cafe24.com";
		Properties props = new Properties();
		props.put("mail.smtp.host", mailserver);
		props.put("mail.smtp.auth", "true");

		// 메일 인증 계정 및 비번
		Authenticator myauth = new MyAuthentication();// 다형성

		// 메일서버에서 계정 인증 검사
		Session sess = Session.getInstance(props, myauth);

		// 인증번호
		int number = (int) (Math.random() * 10000);
		mv.addObject("number", number);

		// 사용자 입력 요청한 정보 가져오기

		String to = memberDTO.getEmail();
		String from = "wognstm17@naver.com";
		String subject = "PICK ME 인증번호입니다";
		String msgText = "안녕하세요. PICK ME 입니다 인증번호는" + number + "입니다."; // 내용
		msgText = msgText.replace("\n", "<br/>");

		// 메일 보내기
		try {
			Message msg = new MimeMessage(sess);
			msg.setFrom(new InternetAddress(from)); // 보낸사람

			// 받는사람(한명)
			InternetAddress[] address = { new InternetAddress(to) };

			// 여러명 수신인
			/*
			 * InternetAddress[] address={new InternetAddress(to), new
			 * InternetAddress(to2), new InternetAddress(to3) };
			 */

			msg.setRecipients(Message.RecipientType.TO, address); // 받는사람

			msg.setSubject(subject); // 메일 제목

			msg.setContent(msgText, "text/html;charset=UTF-8"); // 메일 내용

			msg.setSentDate(new Date()); // 보낸날짜

			Transport.send(msg); // 전송

			checkmsg = to;
			result = "ok";
			mv.addObject("checkmsg", checkmsg);
			mv.addObject("result", result);

		} catch (Exception e) {
			checkmsg = "인증번호";
			result = "no";
			mv.addObject("checkmsg", checkmsg);
			mv.addObject("result", result);
		}
		mv.setViewName("person/p_sendMail");
		return mv;
	}


	//ID 찾기
	@RequestMapping(value = "p_sendMailId", method = RequestMethod.GET)
	public ModelAndView p_sendMailId(MemberDTO memberDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		String checkmsg = "";
		try {
			memberDTO = personService.findId(memberDTO);
			mv.addObject("name", memberDTO.getName());

		} catch (Exception e) {
			// TODO: handle exception
		}
		String mailserver = "mw-002.cafe24.com";
		Properties props = new Properties();
		props.put("mail.smtp.host", mailserver);
		props.put("mail.smtp.auth", "true");

		// 메일 인증 계정 및 비번
		Authenticator myauth = new MyAuthentication();// 다형성

		// 메일서버에서 계정 인증 검사
		Session sess = Session.getInstance(props, myauth);

		// 사용자 입력 요청한 정보 가져오기

		String to = memberDTO.getEmail();
		String from = "wognstm17@naver.com";
		String subject = "PICK ME 회원님의 아이디 입니다";
		String msgText = "안녕하세요. PICK ME 입니다 아이디는" +memberDTO.getId()+ " 입니다."; // 내용
		msgText = msgText.replace("\n", "<br/>");

		// 메일 보내기
		try {
			Message msg = new MimeMessage(sess);
			msg.setFrom(new InternetAddress(from)); // 보낸사람

			// 받는사람(한명)
			InternetAddress[] address = { new InternetAddress(to) };

			// 여러명 수신인
			/*
			 * InternetAddress[] address={new InternetAddress(to), new
			 * InternetAddress(to2), new InternetAddress(to3) };
			 */

			msg.setRecipients(Message.RecipientType.TO, address); // 받는사람

			msg.setSubject(subject); // 메일 제목

			msg.setContent(msgText, "text/html;charset=UTF-8"); // 메일 내용

			msg.setSentDate(new Date()); // 보낸날짜

			Transport.send(msg); // 전송

			checkmsg = memberDTO.getId();
			mv.addObject("checkmsg", checkmsg);

		} catch (Exception e) {
			checkmsg = "메일전송 실패";
			mv.addObject("checkmsg", checkmsg);
		}
		mv.setViewName("person/p_sendMailId");
		return mv;
	}

	//PW 찾기
	@RequestMapping(value = "p_sendMailPw", method = RequestMethod.GET)
	public ModelAndView p_sendMailPw(MemberDTO memberDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		String checkmsg = "";
		try {
			memberDTO = personService.findPw(memberDTO);
			mv.addObject("id", memberDTO.getId());

		} catch (Exception e) {
			// TODO: handle exception
		}
		String mailserver = "mw-002.cafe24.com";
		Properties props = new Properties();
		props.put("mail.smtp.host", mailserver);
		props.put("mail.smtp.auth", "true");

		// 메일 인증 계정 및 비번
		Authenticator myauth = new MyAuthentication();// 다형성

		// 메일서버에서 계정 인증 검사
		Session sess = Session.getInstance(props, myauth);

		// 사용자 입력 요청한 정보 가져오기

		String to = memberDTO.getEmail();
		String from = "wognstm17@naver.com";
		String subject = "PICK ME 회원님의 비밀번호 입니다";
		String msgText = "안녕하세요. PICK ME 입니다 비밀번호는" +memberDTO.getPw()+ " 입니다."; // 내용
		msgText = msgText.replace("\n", "<br/>");

		// 메일 보내기
		try {
			Message msg = new MimeMessage(sess);
			msg.setFrom(new InternetAddress(from)); // 보낸사람

			// 받는사람(한명)
			InternetAddress[] address = { new InternetAddress(to) };

			// 여러명 수신인
			/*
			 * InternetAddress[] address={new InternetAddress(to), new
			 * InternetAddress(to2), new InternetAddress(to3) };
			 */

			msg.setRecipients(Message.RecipientType.TO, address); // 받는사람

			msg.setSubject(subject); // 메일 제목

			msg.setContent(msgText, "text/html;charset=UTF-8"); // 메일 내용

			msg.setSentDate(new Date()); // 보낸날짜

			Transport.send(msg); // 전송

			checkmsg = memberDTO.getId();
			mv.addObject("checkmsg", checkmsg);

		} catch (Exception e) {
			checkmsg = "메일전송 실패";
			mv.addObject("checkmsg", checkmsg);
		}
		mv.setViewName("person/p_sendMailPw");
		return mv;
	}

	//비밀번호 변경
	@RequestMapping(value="personChangePw", method=RequestMethod.GET)
	public void personChangePw(HttpSession session) throws Exception{}
	@RequestMapping(value="personChangePw", method=RequestMethod.POST)
	public ModelAndView personChangePw(MemberDTO memberDTO ,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = personService.changePw(memberDTO);
		String message = "PW Fail";
		String path = "./personMyPage";

		if(result>0){
			message = "비밀번호가 변경 되었습니다.";
			path = "./personMyPage";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		return mv;
	}
}


