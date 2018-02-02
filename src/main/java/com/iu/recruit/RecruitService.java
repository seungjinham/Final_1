package com.iu.recruit;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class RecruitService {
	@Inject
	private RecruitDAO recruitDAO;
	
	public int insert(RecruitDTO recruitDTO) {
		return 0;
	}
	
	public int update(RecruitDTO recruitDTO) {
		recruitDAO.update(recruitDTO);
		return 0;
	}
	
	public int delete(int num) {
		return 0;
	}
	
	public List<RecruitDTO> selectList(RecruitSearchDTO recruitSearchDTO) {
		List<String> checkVar = new ArrayList<>();
		List<String[]> checkArray = new ArrayList<>();
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
	}
	
	public RecruitDTO selectOne(int num) {
		return recruitDAO.selectOne(num);
	}
}
