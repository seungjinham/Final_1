package com.iu.paper;

import com.iu.person.PersonDTO;

public class PaperDTO extends PersonDTO{ //이력서
	
	private String id; //회원ID
	private String fname; //자기사진 파일명
	private String oname; //자기사진 원본파일명
	private String army; //병역 여부
	private String marry; //결혼 여부
	private String hobby; //취미
	private String working; //구직상태
	private String title; //이력서 제목
	private String paper_date; //이력서 등록 날짜

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
	public String getArmy() {
		return army;
	}
	public void setArmy(String army) {
		this.army = army;
	}
	public String getMarry() {
		return marry;
	}
	public void setMarry(String marry) {
		this.marry = marry;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getWorking() {
		return working;
	}
	public void setWorking(String working) {
		this.working = working;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPaper_date() {
		return paper_date;
	}
	public void setPaper_date(String paper_date) {
		this.paper_date = paper_date;
	}
	
}
