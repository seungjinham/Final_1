package com.iu.recruit;

//Recruit_Detail_SearchDTO 
//구인공고 상세검색용
public class RecruitSearchDTO {
	private String c_name;
	private String title;
	private String gender;
	private String[] school;
	private String salary;
	private String sal_input;
	private String[] job;
	private String[] work;
	private String[] w_date;
	private String[] w_day;
	private String[] w_time;
	private String[] addr;
	
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String[] getSchool() {
		return school;
	}
	public void setSchool(String[] school) {
		this.school = school;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getSal_input() {
		return sal_input;
	}
	public void setSal_input(String sal_input) {
		this.sal_input = sal_input;
	}
	public String[] getJob() {
		return job;
	}
	public void setJob(String[] job) {
		this.job = job;
	}
	public String[] getWork() {
		return work;
	}
	public void setWork(String[] work) {
		this.work = work;
	}
	public String[] getW_date() {
		return w_date;
	}
	public void setW_date(String[] w_date) {
		this.w_date = w_date;
	}
	public String[] getW_day() {
		return w_day;
	}
	public void setW_day(String[] w_day) {
		this.w_day = w_day;
	}
	public String[] getW_time() {
		return w_time;
	}
	public void setW_time(String[] w_time) {
		this.w_time = w_time;
	}
	public String[] getAddr() {
		return addr;
	}
	public void setAddr(String[] addr) {
		this.addr = addr;
	}
}
