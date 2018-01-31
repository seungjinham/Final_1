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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
