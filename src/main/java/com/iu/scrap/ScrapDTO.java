package com.iu.scrap;

import java.util.List;

public class ScrapDTO {
	private int 	num;
	private int 	recruit_num;
	private String 	id;
	private List<Integer> select_ch;
	
	public List<Integer> getSelect_ch() {
		return select_ch;
	}
	public void setSelect_ch(List<Integer> select_ch) {
		this.select_ch = select_ch;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getRecruit_num() {
		return recruit_num;
	}
	public void setRecruit_num(int recruit_num) {
		this.recruit_num = recruit_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
