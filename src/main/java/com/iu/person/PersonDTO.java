package com.iu.person;

import com.iu.member.MemberDTO;

public class PersonDTO extends MemberDTO{
	
	private String birth;
	private String gender;
	
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
