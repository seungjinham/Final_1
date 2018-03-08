package com.iu.paper;

public class PortDTO { //포트폴리오
	
	private String id;
	private String fname; //파일명
	private String oname; //원본파일명
	private String p_date; //작업기간
	private String people; //작업인원
	private String contents; //작품소개
	private int paper_num; //이력서번호

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getPaper_num() {
		return paper_num;
	}
	public void setPaper_num(int paper_num) {
		this.paper_num = paper_num;
	}
}
