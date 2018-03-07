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
/*			switch(totalcount) {
			case 1:
				for(int i=0; i<checkVar.size(); i++) {
					if(checkVar.get(i)!=null) {
						conditionDTO.setCon1(checkVar.get(i));
					}
				}
				for(int i=0; i<checkArray.size(); i++) {
					if(checkArray.get(i)!=null) {
						for(int j=0; j<checkArray.get(i).length; j++) {
							switch(i) {
							case 0: 
								if(checkArray.get(i)[j]!=null&&j==0) {
									conditionDTO.setCon1(checkArray.get(i)[j]);
								}
								if(checkArray.get(i).length==2) {
									if(checkArray.get(i)[j]!=null&&j==1) {
										conditionDTO.setCon2(checkArray.get(i)[j]);
									}
								}
								break;
							case 1: 
								if(checkArray.get(i)[j]!=null&&j==0) {
									conditionDTO.setCon1(checkArray.get(i)[j]);
								}
								if(checkArray.get(i).length==2) {
									if(checkArray.get(i)[j]!=null&&j==1) {
										conditionDTO.setCon2(checkArray.get(i)[j]);
									}
								}
								break;
							case 2:
								if(checkArray.get(i)[j]!=null&&j==0) {
									conditionDTO.setCon1(checkArray.get(i)[j]);
								}
								if(checkArray.get(i).length==2) {
									if(checkArray.get(i)[j]!=null&&j==1) {
										conditionDTO.setCon2(checkArray.get(i)[j]);
									}
								}
								break;
							case 3: 
								if(checkArray.get(i)[j]!=null&&j==0) {
									conditionDTO.setCon1(checkArray.get(i)[j]);
								}
								if(checkArray.get(i).length==2) {
									if(checkArray.get(i)[j]!=null&&j==1) {
										conditionDTO.setCon2(checkArray.get(i)[j]);
									}
								}
								break;
							case 4: 
								if(checkArray.get(i)[j]!=null&&j==0) {
									conditionDTO.setCon1(checkArray.get(i)[j]);
								}
								if(checkArray.get(i).length==2) {
									if(checkArray.get(i)[j]!=null&&j==1) {
										conditionDTO.setCon2(checkArray.get(i)[j]);
									}
								}
								break;
							case 5: 
								if(checkArray.get(i)[j]!=null&&j==0) {
									conditionDTO.setCon1(checkArray.get(i)[j]);
								}
								if(checkArray.get(i).length==2) {
									if(checkArray.get(i)[j]!=null&&j==1) {
										conditionDTO.setCon2(checkArray.get(i)[j]);
									}
								}
								break;
							}
						}
					}
				}
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
			}*/
			//result = true;
			//totalcount=varcount+arraycount;
		}
		return conditionDTO;
	}
	
	public ConditionDTO matching(ConditionDTO conditionDTO, RecruitSearchDTO recruitSearchDTO, List<String> checkVar, List<String[]> checkArray) {
		String[] tempstr = new String[25];
		
		for(int i=0; i<checkVar.size(); i++) {
			if(checkVar.get(i)==null) {
				checkVar.remove(i);
			}
		}
		
		for(int i=0; i<checkVar.size(); i++) {
			if(checkVar.get(i)!=null) {
				tempstr[i] = checkVar.get(i);
			}
		}
		
		for(int i=0; i<checkArray.size(); i++) {
			int num = 0;
			if(checkArray.get(i)!=null) {
				for(int j=0; j<checkArray.get(i).length; j++) {
					if(checkArray.get(i)[j]!=null) {
						tempstr[num] = checkArray.get(i)[j];
						num++;
					}
				}
			}
		}
		return null;
	}
}
