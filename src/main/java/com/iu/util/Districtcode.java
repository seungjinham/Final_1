package com.iu.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Districtcode {
	private Map<String, String> si = null;
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
		
		districtCode = new ArrayList<Object>();
		
		districtCode.add(si);
		districtCode.add(gu);
		districtCode.add(dong);
		districtCode.add(sinum);
		districtCode.add(gunum);
		districtCode.add(dongnum);
		
		
		bufReader.close();
		
		return districtCode;
	}
}
