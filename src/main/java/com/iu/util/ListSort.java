package com.iu.util;

import java.util.List;

import com.iu.company.CompanyDTO;
import com.iu.recruit.RecruitDTO;

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
}
