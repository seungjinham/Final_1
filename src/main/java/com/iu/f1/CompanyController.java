package com.iu.f1;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.company.CompanyDTO;
import com.iu.company.CompanyService;
import com.iu.member.MemberDTO;
import com.iu.person.MyAuthentication;
import com.iu.recruit.RecruitDTO;

@Controller
@RequestMapping(value="/company/**")
public class CompanyController {

	@Inject
	private CompanyService companyService;


	//회원가입
	@RequestMapping(value="companyJoin", method=RequestMethod.GET)
	public void companyJoin(){}

	@RequestMapping(value="companyJoin", method=RequestMethod.POST)
	public String companyJoin(CompanyDTO companyDTO) throws Exception {
		int result = companyService.join(companyDTO);
		if(result>0){
		}
		return "redirect:../";
	}

	//회원가입 시 IDCheck
	@RequestMapping(value="companyIdCheck", method=RequestMethod.GET)
	public ModelAndView personIdCheck(String id) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = companyService.idCheck(id);
		if(memberDTO == null){
			mv.addObject("result", "사용 가능한 ID 입니다.");
		}else{
			mv.addObject("result", "중복된 ID 입니다.");
		}
		mv.setViewName("common/joinResult");
		return mv;
	}

	//이메일 인증
	@RequestMapping(value = "c_sendMail", method = RequestMethod.GET)
	public ModelAndView c_sendMail(MemberDTO memberDTO, HttpServletRequest request, HttpServletResponse response)
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
		mv.setViewName("company/c_sendMail");
		return mv;
	}


	//회원수정
	@RequestMapping(value="companyUpdate", method=RequestMethod.GET)
	public void companyUpdate(HttpSession session){}

	@RequestMapping(value="companyUpdate", method=RequestMethod.POST)
	public ModelAndView companyUpdate(CompanyDTO companyDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = companyService.update(companyDTO);

		String message = "Update Fail";
		String path = "./companyMyPage";

		if(result>0){
			session.setAttribute("member", companyDTO);
			message = "정보가 수정 되었습니다.";
			path = "./companyMyPage";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		return mv;
	}

	//회원탈퇴
	@RequestMapping(value="companyMemberDel", method=RequestMethod.GET)
	public void companyMemberDel(){}

	@RequestMapping(value="companyMemberDel", method=RequestMethod.POST)
	public ModelAndView companyMemberDel(HttpSession session) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		int result = companyService.delete(memberDTO, session);
		ModelAndView mv  = new ModelAndView();
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

	//ID 찾기
	@RequestMapping(value = "c_sendMailId", method = RequestMethod.GET)
	public ModelAndView c_sendMailId(MemberDTO memberDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		String checkmsg = "";
		try {
			memberDTO = companyService.findId(memberDTO);
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
		mv.setViewName("company/c_sendMailId");
		return mv;
	}

	//PW 찾기
	@RequestMapping(value = "c_sendMailPw", method = RequestMethod.GET)
	public ModelAndView c_sendMailPw(MemberDTO memberDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		String checkmsg = "";
		try {
			memberDTO = companyService.findPw(memberDTO);
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
		mv.setViewName("company/c_sendMailPw");
		return mv;
	}

	//비밀번호 변경
	@RequestMapping(value="companyChangePw", method=RequestMethod.GET)
	public void companyChangePw(HttpSession session) throws Exception{}
	@RequestMapping(value="companyChangePw", method=RequestMethod.POST)
	public ModelAndView companyChangePw(MemberDTO memberDTO ,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = companyService.changePw(memberDTO);
		String message = "PW Fail";
		String path = ".companyMyPage";

		if(result>0){
			message = "비밀번호가 변경 되었습니다.";
			path = "./companyMyPage";
		}
		mv.addObject("message", message);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		return mv;
	}


	//=========================== MyPage 기업정보보기  ===========================
	@RequestMapping(value="companyMyPage")
	public void companyMypage(HttpSession session) throws Exception {}

	//recruit 수정폼
	@RequestMapping(value="companySelectOne")
	public ModelAndView companySelectOne(int num){
		RecruitDTO recruitDTO = companyService.companySelectOne(num);
		ModelAndView mv = new ModelAndView();
		mv.addObject("recruitDTO", recruitDTO);
		mv.setViewName("company/companySelectOne");
		return mv;
	}

	//recruit 수정 
	@RequestMapping(value="companyRecruitUpdate")
	public String companyRecruitUpdate(RecruitDTO recruitDTO) {
		int result = 0;
		System.out.println("in");
		result = companyService.companyRecruitUpdate(recruitDTO);

		return "redirect:company/companyRecruitList";
	}

	//=========================== Login 로그인  ===========================
	@RequestMapping(value="companyLogin", method=RequestMethod.GET)
	public void companyLogin(){}

	@RequestMapping(value="companyLogin", method=RequestMethod.POST)
	public ModelAndView companyLogin(CompanyDTO companyDTO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = companyService.login(companyDTO);

		String path = "../member/login";

		if(memberDTO != null){
			session.setAttribute("member", memberDTO);
			path = "../";
			mv.addObject("path", path);
			mv.setViewName("common/loginResult");
		}else{
			mv.addObject("result", "c_login");
			mv.setViewName("member/login");
		}
		return mv;
	}


	//=========================== Write 공고 등록하기  ===========================
	@RequestMapping(value="companyRecruit", method=RequestMethod.GET)
	public void companyRecruit(HttpSession session, Model model) {
		CompanyDTO companyDTO = (CompanyDTO) session.getAttribute("member");
		model.addAttribute("company", companyDTO);
	}

	@RequestMapping(value="companyRecruit", method=RequestMethod.POST)
	public ModelAndView companyRecruit(RecruitDTO recruitDTO, MultipartFile file, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int num = companyService.companyRecruit(recruitDTO, file, session);
		if(recruitDTO.equals("null")) {
			mv.addObject("message", "fail");
			mv.addObject("path", "../");
		} else {
			mv.addObject("message", "success");
			mv.addObject("path", "./companyMyPage");
		}
		mv.setViewName("./common/result");

		return mv;
	}


	//=========================== List 게재중인 공고  ===========================
	@RequestMapping(value="companyRecruitList", method=RequestMethod.GET)
	public ModelAndView companyRecruitList(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		CompanyDTO companyDTO= (CompanyDTO) session.getAttribute("member");
		System.out.println(companyDTO.getId());

		List<RecruitDTO> ar = companyService.companyRecruitList(companyDTO.getId());

		mv.addObject("list", ar);
		mv.setViewName("company/companyRecruitList");

		return mv;
	}

	//=========================== View 게재중인 공고보기  ===========================
	@RequestMapping(value="companyRecruitView", method=RequestMethod.GET)
	public ModelAndView companyRecruitView(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(num);
		CompanyDTO companyDTO = companyService.companyRecruitView(num);
		mv.addObject("view", companyDTO);
		mv.setViewName("company/companyRecruitView");
		return mv;
	}

	//=========================== Delete 공고 삭제  ===========================
	@RequestMapping(value="companyRecruitDelete", method=RequestMethod.GET)
	public ModelAndView companyRecruitDelete(int num, String fname, HttpSession session) throws Exception {
		System.out.println(num);
		System.out.println(fname);
		int result = companyService.companyRecruitDelete(num, fname, session);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("company/companyRecruitDelete");
		return mv;
	}
}
