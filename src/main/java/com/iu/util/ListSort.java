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
			conditionDTO.setArraycount(arraycount);
			conditionDTO.setVarcount(varcount);
			
			conditionDTO = matching(conditionDTO, recruitSearchDTO, checkVar, checkArray);
		}
		return conditionDTO;
	}
	
	public ConditionDTO matching(ConditionDTO conditionDTO, RecruitSearchDTO recruitSearchDTO, List<String> checkVar, List<String[]> checkArray) {
		String[] tempstr = new String[31];
		int num = 5;
		char ch = 95;
		
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
		
		loop:
		for(int i=0; i<tempstr.length; i++) {
			if(i==6) {
				break loop;
			}
			switch(i) {
			case 0: if(tempstr[i]==null) {
				//conditionDTO.setCon0(Character.toString(ch)); 
			} else {
				conditionDTO.setCon0(tempstr[i]);
			}
			break;
			case 1: if(tempstr[i]==null) {
				//conditionDTO.setCon1(Character.toString(ch)); 
			} else {
				conditionDTO.setCon1(tempstr[i]);
			}
			break;
			case 2: if(tempstr[i]==null) {
				//conditionDTO.setCon2(Character.toString(ch)); 
			} else {
				conditionDTO.setCon2(tempstr[i]);
			}
			break;
			case 3: if(tempstr[i]==null) {
				//conditionDTO.setCon3(Character.toString(ch)); 
			} else {
				conditionDTO.setCon3(tempstr[i]);
			}
			break;
			case 4: if(tempstr[i]==null) {
				//conditionDTO.setCon4(Character.toString(ch)); 
			} else {
				conditionDTO.setCon4(tempstr[i]);
			}
			break;
			case 5: if(tempstr[i]==null) {
				//conditionDTO.setCon5(Character.toString(ch)); 
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
			int k=0;
			switch(i) {
			case 0: if(checkArray.get(i)!=null) {
				k=5;
				for(int j=0; j<checkArray.get(i).length; j++) {
					if(checkArray.get(i)[j]!=null) {
						k++;
						tempstr[k] = checkArray.get(i)[j];
					}
				}
			}
			break;
			case 1: if(checkArray.get(i)!=null) {
				k=7;
				for(int j=0; j<checkArray.get(i).length; j++) {
					if(checkArray.get(i)[j]!=null) {
						k++;
						tempstr[k] = checkArray.get(i)[j];
					}
				}
			}
			break;
			case 2: if(checkArray.get(i)!=null) {
				k=9;
				for(int j=0; j<checkArray.get(i).length; j++) {
					if(checkArray.get(i)[j]!=null) {
						k++;
						tempstr[k] = checkArray.get(i)[j];
					}
				}
			}
			break;
			case 3: if(checkArray.get(i)!=null) {
				k=15;
				for(int j=0; j<checkArray.get(i).length; j++) {
					if(checkArray.get(i)[j]!=null) {
						k++;
						tempstr[k] = checkArray.get(i)[j];
					}
				}
			}
			break;
			case 4: if(checkArray.get(i)!=null) {
				k=20;
				for(int j=0; j<checkArray.get(i).length; j++) {
					if(checkArray.get(i)[j]!=null) {
						k++;
						tempstr[k] = checkArray.get(i)[j];
					}
				}
			}
			break;
			case 5: if(checkArray.get(i)!=null) {
				k=28;
				for(int j=0; j<checkArray.get(i).length; j++) {
					if(checkArray.get(i)[j]!=null) {
						k++;
						tempstr[k] = checkArray.get(i)[j];
					}
				}
			}
			break;
			}
/*			num++;
			if(checkArray.get(i)!=null) {
				for(int j=0; j<checkArray.get(i).length; j++) {
					if(checkArray.get(i)[j]!=null) {
						tempstr[num] = checkArray.get(i)[j];
						num++;
					}
				}
				num--;
			}*/
		}
		
		for(int i=0; i<tempstr.length; i++) {
			switch(6+i) {
			case 6: if(tempstr[6+i]==null) {
				//conditionDTO.setCon6(Character.toString(ch)); 
			} else {
				conditionDTO.setCon6(tempstr[6+i]);
			}
			break;
			case 7: if(tempstr[6+i]==null) {
				//conditionDTO.setCon7(Character.toString(ch)); 
			} else {
				conditionDTO.setCon7(tempstr[6+i]);
			}
			break;
			case 8: if(tempstr[6+i]==null) {
				//conditionDTO.setCon8(Character.toString(ch)); 
			} else {
				conditionDTO.setCon8(tempstr[6+i]);
			}
			case 9: if(tempstr[6+i]==null) {
				//conditionDTO.setCon9(Character.toString(ch)); 
			} else {
				conditionDTO.setCon9(tempstr[6+i]); 
			}
			break;
			case 10: if(tempstr[6+i]==null) {
				//conditionDTO.setCon10(Character.toString(ch)); 
			} else {
				conditionDTO.setCon10(tempstr[6+i]); 
			}
			break;
			case 11: if(tempstr[6+i]==null) {
				//conditionDTO.setCon11(Character.toString(ch)); 
			} else {
				conditionDTO.setCon11(tempstr[6+i]);
			}
			break;
			case 12: if(tempstr[6+i]==null) {
				//conditionDTO.setCon12(Character.toString(ch)); 
			} else {
				conditionDTO.setCon12(tempstr[6+i]); 
			}
			break;
			case 13: if(tempstr[6+i]==null) {
				//conditionDTO.setCon13(Character.toString(ch)); 
			} else {
				conditionDTO.setCon13(tempstr[6+i]); 
			}
			break;
			case 14: if(tempstr[6+i]==null) {
				//conditionDTO.setCon14(Character.toString(ch)); 
			} else {
				conditionDTO.setCon14(tempstr[6+i]); 
			}
			break;
			case 15: if(tempstr[6+i]==null) {
				//conditionDTO.setCon15(Character.toString(ch)); 
			} else {
				conditionDTO.setCon15(tempstr[6+i]);
			}
			break;
			case 16: if(tempstr[6+i]==null) {
				//conditionDTO.setCon16(Character.toString(ch)); 
			} else {
				conditionDTO.setCon16(tempstr[6+i]);
			}
			break;
			case 17: if(tempstr[6+i]==null) {
				//conditionDTO.setCon17(Character.toString(ch)); 
			} else {
				conditionDTO.setCon17(tempstr[6+i]);
			}
			break;
			case 18: if(tempstr[6+i]==null) {
				//conditionDTO.setCon18(Character.toString(ch)); 
			} else {
				conditionDTO.setCon18(tempstr[6+i]);
			}
			break;
			case 19: if(tempstr[6+i]==null) {
				//conditionDTO.setCon19(Character.toString(ch));
			} else {
				conditionDTO.setCon19(tempstr[6+i]);
			}
			break;
			case 20: if(tempstr[6+i]==null) {
				//conditionDTO.setCon20(Character.toString(ch)); 
			} else {
				conditionDTO.setCon20(tempstr[6+i]);
			}
			break;
			case 21: if(tempstr[6+i]==null) {
				//conditionDTO.setCon21(Character.toString(ch)); 
			} else {
				conditionDTO.setCon21(tempstr[6+i]);
			}
			break;
			case 22: if(tempstr[6+i]==null) {
				//conditionDTO.setCon22(Character.toString(ch)); 
			} else {
				conditionDTO.setCon22(tempstr[6+i]);
			}
			break;
			case 23: if(tempstr[6+i]==null) {
				//conditionDTO.setCon23(Character.toString(ch)); 
			} else {
				conditionDTO.setCon23(tempstr[6+i]);
			}
			break;
			case 24: if(tempstr[6+i]==null) {
				//conditionDTO.setCon24(Character.toString(ch)); 
			} else {
				conditionDTO.setCon24(tempstr[6+i]);
			}
			break;
			case 25: if(tempstr[6+i]==null) {
				//conditionDTO.setCon25(Character.toString(ch)); 
			} else {
				conditionDTO.setCon25(tempstr[6+i]);
			}
			break;
			case 26: if(tempstr[6+i]==null) {
				//conditionDTO.setCon26(Character.toString(ch)); 
			} else {
				conditionDTO.setCon26(tempstr[6+i]);
			}
			break;
			case 27: if(tempstr[6+i]==null) {
				//conditionDTO.setCon27(Character.toString(ch)); 
			} else {
				conditionDTO.setCon27(tempstr[6+i]);
			}
			break;
			case 28: if(tempstr[6+i]==null) {
				//conditionDTO.setCon28(Character.toString(ch));
			} else {
				conditionDTO.setCon28(tempstr[6+i]);
			}
			break;
			case 29: if(tempstr[6+i]==null) {
				//conditionDTO.setCon29(Character.toString(ch)); 
			} else {
				conditionDTO.setCon29(tempstr[6+i]); 
			}
			break;
			case 30: if(tempstr[6+i]==null) {
				//conditionDTO.setCon30(Character.toString(ch)); 
			} else {
				conditionDTO.setCon30(tempstr[6+i]);
			}
			break;
			}
		}
		return conditionDTO;
	}
}
