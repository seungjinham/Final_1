package com.iu.paper;

public class CareerDTO { //경력
	
	private int num;
	private String id;
	private String cr_kind; //신입 & 경력 구분
	private String company_n; //회사명
	private String joined; //입사
	private String resign; //퇴사
	private String w_kind; //재직 & 퇴사 구분
	private String rank; //직책
	private String fess; //직종
	private String cr_work; //담당업무
	private int cr_sal; //연봉
	
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
	public String getCr_kind() {
		return cr_kind;
	}
	public void setCr_kind(String cr_kind) {
		this.cr_kind = cr_kind;
	}
	public String getCompany_n() {
		return company_n;
	}
	public void setCompany_n(String company_n) {
		this.company_n = company_n;
	}
	public String getJoined() {
		return joined;
	}
	public void setJoined(String joined) {
		this.joined = joined;
	}
	public String getResign() {
		return resign;
	}
	public void setResign(String resign) {
		this.resign = resign;
	}
	public String getW_kind() {
		return w_kind;
	}
	public void setW_kind(String w_kind) {
		this.w_kind = w_kind;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getFess() {
		return fess;
	}
	public void setFess(String fess) {
		this.fess = fess;
	}
	public String getCr_work() {
		return cr_work;
	}
	public void setCr_work(String cr_work) {
		this.cr_work = cr_work;
	}
	public int getCr_sal() {
		return cr_sal;
	}
	public void setCr_sal(int cr_sal) {
		this.cr_sal = cr_sal;
	}
	
}
