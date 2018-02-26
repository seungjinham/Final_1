package com.iu.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class AreaCodeDTO {
	private String si_code;
	private String gu_code;
	private String dong_code;
	private String si_value;
	private String gu_value;
	private String dong_value;
	private String code_num;
	private String area;
	
	public String getSi_code() {
		return si_code;
	}
	public void setSi_code(String si_code) {
		this.si_code = si_code;
	}
	public String getGu_code() {
		return gu_code;
	}
	public void setGu_code(String gu_code) {
		this.gu_code = gu_code;
	}
	public String getDong_code() {
		return dong_code;
	}
	public void setDong_code(String dong_code) {
		this.dong_code = dong_code;
	}
	public String getSi_value() {
		return si_value;
	}
	public void setSi_value(String si_value) {
		this.si_value = si_value;
	}
	public String getGu_value() {
		return gu_value;
	}
	public void setGu_value(String gu_value) {
		this.gu_value = gu_value;
	}
	public String getDong_value() {
		return dong_value;
	}
	public void setDong_value(String dong_value) {
		this.dong_value = dong_value;
	}
	public String getCode_num() {
		return code_num;
	}
	public void setCode_num(String code_num) {
		this.code_num = code_num;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
	
/*	private Map<String, String> si = null;
	private Map<String, String> gu = null;
	private Map<String, String> dong = null;
	private List<Object> districtCode= null;
	private String[] tempstr = null;
	private List<String> sinum = null;
	private List<String> gunum = null;
	private List<String> dongnum = null;
	
	public List<Object> discrictCode() throws Exception {
		si = new HashMap<>();
		gu = new HashMap<>();
		dong = new HashMap<>();
		sinum = new ArrayList<>();
		gunum = new ArrayList<>();
		dongnum = new ArrayList<>();
		
		//String filepath = "D:\\Leesh\\Workspace2\\Final_1\\src\\main\\webapp\\resources\\etc\\districtcode.txt";
		String filepath = "D:\\Leesh\\Workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Final_1\\resources\\etc\\districtcode.txt";
		
		File file = new File(filepath);
		FileReader filereader = new FileReader(file);
		BufferedReader bufReader = new BufferedReader(filereader);
		String line = "";
		
		while((line = bufReader.readLine()) != null) {
			tempstr = line.split("\\s");
			if(tempstr.length==3) {
				si.put(tempstr[1], tempstr[2]);
				sinum.add(tempstr[1]);
			} else if(tempstr.length==5) {
				gu.put(tempstr[3], tempstr[4]);
				gunum.add(tempstr[3]);
			} else if(tempstr.length==7) {
				dong.put(tempstr[5], tempstr[6]);
				dongnum.add(tempstr[5]);
			} else {
				
			}
		}
		bufReader.close();
		
		districtCode = new ArrayList<Object>();
		
		districtCode.add(si);
		districtCode.add(gu);
		districtCode.add(dong);
		districtCode.add(sinum);
		districtCode.add(gunum);
		districtCode.add(dongnum);
		
		return districtCode;

	}*/
}
