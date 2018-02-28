package com.iu.person;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.iu.member.MemberDTO;
import com.iu.member.MemberService;

@Service
public class PersonService implements MemberService {
	
	@Inject
	private PersonDAO personDAO;
	
	//회원가입
	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		return personDAO.join(memberDTO);
	}
	

	//회원탈퇴
	@Override
	public int delete(MemberDTO memberDTO, HttpSession session) throws Exception {
		return personDAO.delete(memberDTO);
	}
	
	//회원수정
	@Override
	public int update(MemberDTO memberDTO) throws Exception {
		return personDAO.update(memberDTO);
	}

	//로그인
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return personDAO.login(memberDTO);
	}

	//가입시 ID Check
	@Override
	public MemberDTO idCheck(String id) throws Exception {
		return personDAO.idCheck(id);
	}
	
	//아이디 찾기
	public MemberDTO findId(MemberDTO memberDTO) throws Exception{
		return personDAO.findId(memberDTO);
	}
	
	//비밀번호 찾기
	public MemberDTO findPw(MemberDTO memberDTO) throws Exception{
		return personDAO.findPw(memberDTO);
	}

}
