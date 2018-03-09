package com.iu.company;

import com.iu.member.MemberDTO;

public class CompanyDTO extends MemberDTO{
	
	private String c_name; //회사명
	private String c_num; //사업자번호
	
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_num() {
		return c_num;
	}
	public void setC_num(String c_num) {
		this.c_num = c_num;
	}
	
}
