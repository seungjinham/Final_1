package com.iu.paper;

public class SchoolDTO {
	
	private String id;
	private String s_kind; //학력 구분
	private String s_name; //학교명
	private String major; //전공
	private String entrance; //입학 년도
	private String graduation; //졸업년도
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getS_kind() {
		return s_kind;
	}
	public void setS_kind(String s_kind) {
		this.s_kind = s_kind;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getEntrance() {
		return entrance;
	}
	public void setEntrance(String entrance) {
		this.entrance = entrance;
	}
	public String getGraduation() {
		return graduation;
	}
	public void setGraduation(String graduation) {
		this.graduation = graduation;
	}
	
}
