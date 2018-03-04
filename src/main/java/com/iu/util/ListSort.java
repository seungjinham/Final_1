package com.iu.util;

import java.util.ArrayList;
import java.util.List;

import com.iu.company.CompanyDTO;
import com.iu.recruit.RecruitDTO;
import com.iu.recruit.RecruitSearchDTO;

public class ListSort {
	public List<RecruitDTO> listSort(List<RecruitDTO> recruit_ar, List<CompanyDTO> company_ar) {
		for(int i=0; i<company_ar.size(); i++) {
			String temp_str = company_ar.get(i).getAddr();
			String[] temp_ar = temp_str.split(",");
			String[] result_ar = temp_ar[1].split(" ");
			temp_str = result_ar[0]+" "+result_ar[1];
			String id = company_ar.get(i).getId();
			for(int j=0; j<recruit_ar.size(); j++) {
				if(recruit_ar.get(j).getId().equals(id)) {
					recruit_ar.get(j).setAddr(temp_str);
					recruit_ar.get(j).setC_name(company_ar.get(j).getC_name());
				}
			}
		}
		return recruit_ar;
	}
	
	public int check(RecruitSearchDTO recruitSearchDTO) {
		List<String> checkVar = new ArrayList<String>();
		List<String[]> checkArray = new ArrayList<String[]>();
		
/*		boolean check_var=false;
		boolean check_array=false;
		boolean result = false;*/
		
		int varcount=0;
		int arraycount=0;
		int totalcount=0;
		
		for(int i=0; i<6; i++) {
			switch(i) {
			case 0: checkVar.add(recruitSearchDTO.getC_name());
					checkArray.add(recruitSearchDTO.getJob());
					break;
			
			case 1: checkVar.add(recruitSearchDTO.getTitle());
					checkArray.add(recruitSearchDTO.getArea());
					break;
			
			case 2: checkVar.add(recruitSearchDTO.getGender());
					checkArray.add(recruitSearchDTO.getW_date());
					break;
			
			case 3: checkVar.add(recruitSearchDTO.getW_day());
					checkArray.add(recruitSearchDTO.getSchool());
					break;
			
			case 4: checkVar.add(recruitSearchDTO.getSalary());
					checkArray.add(recruitSearchDTO.getW_time());
					break;
			
			case 5: checkVar.add(recruitSearchDTO.getAge());
					checkArray.add(recruitSearchDTO.getSpecial());
					break;
			}
		}
		
		//검색조건 있으면 true, 없으면 false
		for(int i=0; i<6; i++) {
			if(checkVar.get(i)!=null) varcount++;//check_var=true;
			if(checkArray.get(i)!=null) arraycount++;//check_array=true;
		}
		
		if(varcount==0&&arraycount==0) {//(check_var==false&&check_array==false) {
			//검색조건이 하나도 없는 경우
			//result = false;
			totalcount=0;
		} else {
			//검색조건이 하나라도 있는 경우
			//result = true;
			totalcount=varcount+arraycount;
		}
		return totalcount;//result;
	}
	
	public void condition(RecruitSearchDTO recruitSearchDTO, int count) {
		ConditionDTO conditionDTO = new ConditionDTO();
		List<String> checkVar = new ArrayList<String>();
		List<String[]> checkArray = new ArrayList<String[]>();
		
		for(int i=0; i<6; i++) {
			switch(i) {
			case 0: checkVar.add(recruitSearchDTO.getC_name());
					checkArray.add(recruitSearchDTO.getJob());
					break;
			
			case 1: checkVar.add(recruitSearchDTO.getTitle());
					checkArray.add(recruitSearchDTO.getArea());
					break;
			
			case 2: checkVar.add(recruitSearchDTO.getGender());
					checkArray.add(recruitSearchDTO.getW_date());
					break;
			
			case 3: checkVar.add(recruitSearchDTO.getW_day());
					checkArray.add(recruitSearchDTO.getSchool());
					break;
			
			case 4: checkVar.add(recruitSearchDTO.getSalary());
					checkArray.add(recruitSearchDTO.getW_time());
					break;
			
			case 5: checkVar.add(recruitSearchDTO.getAge());
					checkArray.add(recruitSearchDTO.getSpecial());
					break;
			}
		}
		
		switch(count) {
		case 0: 
			break;
		case 1:
			break;
		case 2:break;
		case 3:break;
		case 4:break;
		case 5:break;
		case 6:break;
		case 7:break;
		case 8:break;
		case 9:break;
		case 10:break;
		case 11:break;
		default:break;
		}
	}
}
