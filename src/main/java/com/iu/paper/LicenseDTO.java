package com.iu.paper;

public class LicenseDTO { //자격증
	
	private int num;
	private String id;
	private String l_kind; //항목
	private String l_name; //자격증명
	private String l_date; //취득일
	private String issue; //발행처
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getL_kind() {
		return l_kind;
	}
	public void setL_kind(String l_kind) {
		this.l_kind = l_kind;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getL_date() {
		return l_date;
	}
	public void setL_date(String l_date) {
		this.l_date = l_date;
	}
	public String getIssue() {
		return issue;
	}
	public void setIssue(String issue) {
		this.issue = issue;
	}
	
}
