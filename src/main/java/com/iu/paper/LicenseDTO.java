package com.iu.paper;

public class LicenseDTO { //자격증
	
	private String id;
	private String l_kinds; //항목
	private String l_names; //자격증명
	private String l_date; //취득일
	private String l_issue; //발행처

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getL_kinds() {
		return l_kinds;
	}
	public void setL_kinds(String l_kinds) {
		this.l_kinds = l_kinds;
	}
	public String getL_names() {
		return l_names;
	}
	public void setL_names(String l_names) {
		this.l_names = l_names;
	}
	public String getL_date() {
		return l_date;
	}
	public void setL_date(String l_date) {
		this.l_date = l_date;
	}
	public String getL_issue() {
		return l_issue;
	}
	public void setL_issue(String l_issue) {
		this.l_issue = l_issue;
	}
	
}
