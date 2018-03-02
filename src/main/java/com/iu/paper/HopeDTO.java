package com.iu.paper;

public class HopeDTO { //희망 근무조건
	
	private String id;
	private String h_kind; //근무형태
	private String h_job; //직종
	private String h_work; //업종
	private String location; //근무지역 
	private String salary; //연봉

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getH_kind() {
		return h_kind;
	}
	public void setH_kind(String h_kind) {
		this.h_kind = h_kind;
	}
	public String getH_job() {
		return h_job;
	}
	public void setH_job(String h_job) {
		this.h_job = h_job;
	}
	public String getH_work() {
		return h_work;
	}
	public void setH_work(String h_work) {
		this.h_work = h_work;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	
}
