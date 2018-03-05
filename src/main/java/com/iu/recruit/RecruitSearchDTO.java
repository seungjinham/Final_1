package com.iu.recruit;

//Recruit_Detail_SearchDTO 
//구인공고 상세검색용
public class RecruitSearchDTO {
	private String[] area;
	private String[] job;
	private String[] w_date;
	private String[] w_time;
	private String[] school;
	private String[] special;
	private String w_day;
	private String salary;
	private String gender;
	private String age;
	private String c_name;
	private String title;
	
	public String[] getArea() {
		return area;
	}
	public void setArea(String[] area) {
		if(area[0].equals("")&&area[1].equals("")) {
			area = null;
		}
		this.area = area;
	}
	public String[] getJob() {
		return job;
	}
	public void setJob(String[] job) {
		this.job = job;
	}
	public String[] getW_date() {
		return w_date;
	}
	public void setW_date(String[] w_date) {
		this.w_date = w_date;
	}
	public String[] getW_time() {
		return w_time;
	}
	public void setW_time(String[] w_time) {
		this.w_time = w_time;
	}
	public String[] getSchool() {
		return school;
	}
	public void setSchool(String[] school) {
		this.school = school;
	}
	public String[] getSpecial() {
		return special;
	}
	public void setSpecial(String[] special) {
		this.special = special;
	}
	public String getW_day() {
		return w_day;
	}
	public void setW_day(String w_day) {
		this.w_day = w_day;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
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
		if(age.equals("")) {
			age = null;
		}
		this.age = age;
	}
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
		if(title.equals("")) {
			title = null;
		}
		this.title = title;
	}
}
