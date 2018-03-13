package com.iu.seller;

public class OptionDTO {
	private int num; //기본키 번호
	private String id; //판매자 아이디
	private String name; //패키지 제목
	private String contents; //패키지 내용
	private String price; //가격정보
	private String original; // 원본파일 제공
	private String work_modify; //수정 횟수
	private String work_date; //작업 기간	
	private String selloption;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getOriginal() {
		return original;
	}
	public void setOriginal(String original) {
		this.original = original;
	}
	public String getWork_modify() {
		return work_modify;
	}
	public void setWork_modify(String work_modify) {
		this.work_modify = work_modify;
	}
	public String getWork_date() {
		return work_date;
	}
	public void setWork_date(String work_date) {
		this.work_date = work_date;
	}
	public String getSelloption() {
		return selloption;
	}
	public void setSelloption(String selloption) {
		this.selloption = selloption;
	}
	
	
	
}
