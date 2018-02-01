package com.iu.member;

public interface MemberService {
	
	//회원가입
	public int join(MemberDTO memberDTO) throws Exception;
	
	//회원탈퇴
	public int delete(MemberDTO memberDTO) throws Exception;
	
	//회원수정
	public int update(MemberDTO memberDTO) throws Exception;
	
	//로그인
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
	
	//중복된 ID Check
	public MemberDTO idCheck(String id) throws Exception;
	
	//MyPage
	public MemberDTO MyPage(String id) throws Exception;

}
