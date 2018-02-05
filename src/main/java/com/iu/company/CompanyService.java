package com.iu.company;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.member.MemberDTO;
import com.iu.member.MemberService;

@Service
public class CompanyService implements MemberService {
	
	@Inject
	private CompanyDAO companyDAO;

	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		return companyDAO.join(memberDTO);
	}

	@Override
	public int delete(MemberDTO memberDTO) throws Exception {
		return 0;
	}

	@Override
	public int update(MemberDTO memberDTO) throws Exception {
		return 0;
	}

	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return companyDAO.login(memberDTO);
	}

	@Override
	public MemberDTO idCheck(String id) throws Exception {
		return null;
	}
	
	public CompanyDTO selectOne(String id) {
		CompanyDTO companyDTO = companyDAO.selectOne(id);
		return companyDTO;
	}
}
