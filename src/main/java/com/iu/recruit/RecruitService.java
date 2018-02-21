package com.iu.recruit;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.company.CompanyDAO;
import com.iu.company.CompanyDTO;
import com.iu.util.ListData;
import com.iu.util.ListSort;
import com.iu.util.PageMaker;

@Service
public class RecruitService {
	@Inject
	private RecruitDAO recruitDAO;
	@Inject
	private CompanyDAO companyDAO;
	
	public int insert(RecruitDTO recruitDTO) {
		return 0;
	}
	/*
	public int update(RecruitDTO recruitDTO) {
		recruitDAO.update(recruitDTO);
		return 0;
	}
	*/
	public int delete(int num) {
		return 0;
	}
	
	public List<Object> selectList(ListData listData) {
		//List<List<Object>> collect_ar = new ArrayList<>();
		List<Object> obj_ar = new ArrayList<>();
		List<RecruitDTO> recruit_ar = recruitDAO.selectList();
		List<CompanyDTO> company_ar = new ArrayList<CompanyDTO>();
		for(int i=0; i<recruit_ar.size(); i++) {
			CompanyDTO companyDTO = companyDAO.selectOne(recruit_ar.get(i).getId());
			company_ar.add(companyDTO);
		}
		ListSort listSort = new ListSort();
		recruit_ar = listSort.listSort(recruit_ar, company_ar);
		Integer totalCount = recruitDAO.totalCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.pageMaker(totalCount, listData);
		
		obj_ar.add(recruit_ar);
		obj_ar.add(listData);
		return obj_ar;
	}
	
//	public List<RecruitDTO> selectList(ListData listData) {
//		List<RecruitDTO> recruit_ar = recruitDAO.selectList();
//		List<CompanyDTO> company_ar = new ArrayList<CompanyDTO>();
//		for(int i=0; i<recruit_ar.size(); i++) {
//			CompanyDTO companyDTO = companyDAO.selectOne(recruit_ar.get(i).getId());
//			company_ar.add(companyDTO);
//		}
//		ListSort listSort = new ListSort();
//		recruit_ar = listSort.listSort(recruit_ar, company_ar);
//		return recruit_ar;
//	}
	
/*	public List<RecruitDTO> selectList(RecruitSearchDTO recruitSearchDTO) {
		List<String> checkVar = new ArrayList<String>();
		List<String[]> checkArray = new ArrayList<String[]>();
		List<RecruitDTO> selectList_result;
		
		boolean check_var=false;
		boolean check_array=false;
		
		for(int i=0; i<6; i++) {
			switch(i) {
			case 0: checkVar.add(recruitSearchDTO.getC_name());
					checkArray.add(recruitSearchDTO.getJob());
					break;
			
			case 1: checkVar.add(recruitSearchDTO.getTitle());
					checkArray.add(recruitSearchDTO.getWork());
					break;
			
			case 2: checkVar.add(recruitSearchDTO.getGender());
					checkArray.add(recruitSearchDTO.getW_date());
					break;
			
			case 3: checkVar.add(recruitSearchDTO.getSchool());
					checkArray.add(recruitSearchDTO.getW_day());
					break;
			
			case 4: checkVar.add(recruitSearchDTO.getSalary());
					checkArray.add(recruitSearchDTO.getW_time());
					break;
			
			case 5: checkVar.add(recruitSearchDTO.getSal_input());
					checkArray.add(recruitSearchDTO.getAddr());
					break;
			}
		}
		
		//검색조건 있으면 true, 없으면 false
		for(int i=0; i<6; i++) {
			if(checkVar.get(i)!=null) check_var=true;
			if(checkArray.get(i)!=null) check_array=true;
		}
		
		if(check_var==false&&check_array==false) {
			recruitSearchDTO=null;
			selectList_result = recruitDAO.selectList(recruitSearchDTO);
		} else {
			selectList_result = recruitDAO.selectList(recruitSearchDTO);
		}

		return selectList_result;
	}*/
	
	public RecruitDTO selectOne(int num) {
		return recruitDAO.selectOne(num);
	}
}
