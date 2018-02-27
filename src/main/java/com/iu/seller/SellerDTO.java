package com.iu.seller;

import java.util.List;

import com.iu.person.PersonDTO;

public class SellerDTO extends PersonDTO{
	private String title; //제목
	private String category; //카테고리
	private String contents; //판매 내용, 서비스 설명
	private String fname;
	private String oname;
	private String refund;//환불
	private List<SellOptionDTO> sellOption;	
	
	public List<SellOptionDTO> getSellOption() {
		return sellOption;
	}
	public void setSellOption(List<SellOptionDTO> sellOption) {
		this.sellOption = sellOption;
	}
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
