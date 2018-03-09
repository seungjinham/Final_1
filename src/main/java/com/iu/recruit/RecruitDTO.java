package com.iu.recruit;

import com.iu.company.CompanyDTO;

public class RecruitDTO extends CompanyDTO{
	private int num;
	private String id;
	private String title; //제목
	private String deadline; //마감기간
	private String people; //채용 인원
	private String gender; //성병
	private String age; //나이
	private String school; //학력
	private String special; // 우대사항
	private String salary; // 급여
	private String w_date; // 근무기간
	private String w_day; // 근무요일
	private String w_time; // 근무시간
	private String job; // 업직종
	private String work; // 고용형태
	private String benefit; // 복리후생
	private String contents; //내용 
	private String fname; 
	private String oname;
	private String addr; //주소
	private String c_name;
	private String job_1;
	
	
	public String getJob_1() {
		return job_1;
	}

	public void setJob_1(String job_1) {
		this.job_1 = job_1;
	}

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getSpecial() {
		return special;
	}

	public void setSpecial(String special) {
		this.special = special;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getW_date() {
		return w_date;
	}

	public void setW_date(String w_date) {
		this.w_date = w_date;
	}

	public String getW_day() {
		return w_day;
	}

	public void setW_day(String w_day) {
		this.w_day = w_day;
	}

	public String getW_time() {
		return w_time;
	}

	public void setW_time(String w_time) {
		this.w_time = w_time;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getBenefit() {
		return benefit;
	}

	public void setBenefit(String benefit) {
		this.benefit = benefit;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		if(addr==null) {
			this.addr = "null";
		}
		this.addr = addr;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		if(c_name==null) {
			this.c_name = "null";
		}
		this.c_name = c_name;
	}
	
}
