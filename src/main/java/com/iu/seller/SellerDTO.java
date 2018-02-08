package com.iu.seller;

import com.iu.person.PersonDTO;

public class SellerDTO extends PersonDTO{
	private String title; //제목
	private String category; //카테고리
	private String add_option; //옵션
	private int price; //가격 정보
	private String work_date; //작업 기간
	private String contents; //판매 내용, 서비스 설명
	private String fname;
	private String oname;
	private String refund;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAdd_option() {
		return add_option;
	}
	public void setAdd_option(String add_option) {
		this.add_option = add_option;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getWork_date() {
		return work_date;
	}
	public void setWork_date(String work_date) {
		this.work_date = work_date;
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
	
}
