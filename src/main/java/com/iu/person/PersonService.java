package com.iu.person;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.member.MemberDTO;
import com.iu.member.MemberService;

@Service
public class PersonService implements MemberService {
	
	@Inject
	private PersonDAO personDAO;

	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		return personDAO.join(memberDTO);
	}
	public int memberJoin(MemberDTO memberDTO) throws Exception{
		return personDAO.memberJoin(memberDTO);
	}

	@Override
	public int delete(MemberDTO memberDTO) throws Exception {
		return personDAO.delete(memberDTO);
	}

	@Override
	public int update(MemberDTO memberDTO) throws Exception {
		return personDAO.update(memberDTO);
	}

	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return personDAO.login(memberDTO);
	}

	@Override
	public MemberDTO idCheck(String id) throws Exception {
		return personDAO.idCheck(id);
	}
	
	@Override
	public MemberDTO MyPage(String id) throws Exception {
		return personDAO.MyPage(id);
	}

}
