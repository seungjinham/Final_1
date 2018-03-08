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
	
	public ConditionDTO check(RecruitSearchDTO recruitSearchDTO) {
		ConditionDTO conditionDTO = new ConditionDTO();
		List<String> checkVar = new ArrayList<String>();
		List<String[]> checkArray = new ArrayList<String[]>();
		
		boolean check_var=false;
		boolean check_array=false;
		boolean result = false;
		
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
			if(checkVar.get(i)!=null) {
				varcount++;
				check_var=true;
			}
			if(checkArray.get(i)!=null) {
				arraycount++;
				check_array=true;
			}
		}
		
		totalcount = varcount + arraycount;
		
		if(check_var==false&&check_array==false) {
			//검색조건이 하나도 없는 경우
			conditionDTO.setCheck(false);
			conditionDTO.setCount(totalcount);
			//result = false;
			//totalcount=0;
		} else {
			//검색조건이 하나라도 있는 경우
			conditionDTO.setCheck(true);
			conditionDTO.setCount(totalcount);
			
			conditionDTO = matching(conditionDTO, recruitSearchDTO, checkVar, checkArray);
		}
		return conditionDTO;
	}
	
	public ConditionDTO matching(ConditionDTO conditionDTO, RecruitSearchDTO recruitSearchDTO, List<String> checkVar, List<String[]> checkArray) {
		String[] tempstr = new String[31];
		int num = 5;
		
/*		for(int i=0; i<checkVar.size(); i++) {
			if(checkVar.get(i)==null) {
				checkVar.remove(i);
			}
		}*/
		
		for(int i=0; i<checkVar.size(); i++) {
			if(checkVar.get(i)!=null) {
				tempstr[i] = checkVar.get(i);
			}
		}
		
		for(int i=0; i<tempstr.length; i++) {
			switch(i) {
			case 0: if(tempstr[i]==null) {
				conditionDTO.setCon0(""); 
			} else {
				conditionDTO.setCon0(tempstr[i]);
			}
			break;
			case 1: if(tempstr[i]==null) {
				conditionDTO.setCon1(""); 
			} else {
				conditionDTO.setCon1(tempstr[i]);
			}
			break;
			case 2: if(tempstr[i]==null) {
				conditionDTO.setCon2(""); 
			} else {
				conditionDTO.setCon2(tempstr[i]);
			}
			break;
			case 3: if(tempstr[i]==null) {
				conditionDTO.setCon3(""); 
			} else {
				conditionDTO.setCon3(tempstr[i]);
			}
			break;
			case 4: if(tempstr[i]==null) {
				conditionDTO.setCon4(""); 
			} else {
				conditionDTO.setCon4(tempstr[i]);
			}
			break;
			case 5: if(tempstr[i]==null) {
				conditionDTO.setCon5(""); 
			} else {
				conditionDTO.setCon5(tempstr[i]);
			}
			break;
			}
		}
		
/*		for(int i=0; i<checkArray.size(); i++) {
			if(checkArray.get(i)==null) {
				checkArray.remove(i);
			}
		}*/
		
		for(int i=0; i<checkArray.size(); i++) {
			num++;
			if(checkArray.get(i)!=null) {
				for(int j=0; j<checkArray.get(i).length; j++) {
					if(checkArray.get(i)[j]!=null) {
						tempstr[num] = checkArray.get(i)[j];
						num++;
					}
				}
			}
		}
		
		for(int i=0; i<tempstr.length; i++) {
			switch(6+i) {
			case 6: conditionDTO.setCon6(tempstr[i]); break;
			case 7: conditionDTO.setCon7(tempstr[i]); break;
			case 8: conditionDTO.setCon8(tempstr[i]); break;
			case 9: conditionDTO.setCon9(tempstr[i]); break;
			case 10: conditionDTO.setCon10(tempstr[i]); break;
			case 11: conditionDTO.setCon11(tempstr[i]); break;
			case 12: conditionDTO.setCon12(tempstr[i]); break;
			case 13: conditionDTO.setCon13(tempstr[i]); break;
			case 14: conditionDTO.setCon14(tempstr[i]); break;
			case 15: conditionDTO.setCon15(tempstr[i]); break;
			case 16: conditionDTO.setCon16(tempstr[i]); break;
			case 17: conditionDTO.setCon17(tempstr[i]); break;
			case 18: conditionDTO.setCon18(tempstr[i]); break;
			case 19: conditionDTO.setCon19(tempstr[i]); break;
			case 20: conditionDTO.setCon20(tempstr[i]); break;
			case 21: conditionDTO.setCon21(tempstr[i]); break;
			case 22: conditionDTO.setCon22(tempstr[i]); break;
			case 23: conditionDTO.setCon23(tempstr[i]); break;
			case 24: conditionDTO.setCon24(tempstr[i]); break;
			case 25: conditionDTO.setCon25(tempstr[i]); break;
			case 26: conditionDTO.setCon26(tempstr[i]); break;
			case 27: conditionDTO.setCon27(tempstr[i]); break;
			case 28: conditionDTO.setCon28(tempstr[i]); break;
			case 29: conditionDTO.setCon29(tempstr[i]); break;
			case 30: conditionDTO.setCon30(tempstr[i]); break;
			}
		}
		return conditionDTO;
	}
}
