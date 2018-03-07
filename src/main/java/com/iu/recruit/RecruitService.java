package com.iu.recruit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.company.CompanyDAO;
import com.iu.company.CompanyDTO;
import com.iu.util.AreaCodeDTO;
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
	
	public RecruitDTO selectOne(int num) {
		return recruitDAO.selectOne(num);
	}
	
	public void searchSelectList(RecruitSearchDTO recruitSearchDTO) {
		ListSort listSort = new ListSort();
	}
	
	public List<Object> searchInfo(AreaCodeDTO areacodeDTO) {
		List<String> sicode_ar = null;
		List<String> gucode_ar = null;
		List<String> dongcode_ar = null;
		List<String> job_ar = null;
		List<String> spec_ar = null;
		Map<String, String> sicode_map = null;
		Map<String, String> gucode_map = null;
		Map<String, String> dongcode_map = null;
		List<Object> info = null;
		String city = null;
		String city_code = null;
		String cut_num = null;
		
		if(areacodeDTO.getSi_value()!=null && areacodeDTO.getGu_value()==null) {
			gucode_ar = new ArrayList<>();
			gucode_map = new HashMap<>();
			info = new ArrayList<>();
			List<AreaCodeDTO> ar = recruitDAO.selectArea(areacodeDTO);
			
			for(int i=0; i<ar.size(); i++) {
				if(ar.get(i).getCode_num().length()==5) {
					String tmp = ar.get(i).getCode_num().substring(0, 2);
					if(tmp.equals(areacodeDTO.getSi_code())) {
						cut_num = ar.get(i).getCode_num().substring(4);
						if(cut_num.equals("0")) {
							city = ar.get(i).getArea();
							city_code = ar.get(i).getCode_num();
							gucode_map.put(city_code, city);
							gucode_ar.add(city_code);
						} else {
							cut_num = city_code.substring(0, 4);
							tmp = ar.get(i).getCode_num().substring(0, 4);
							if(cut_num.equals(tmp)) {
								tmp = city;
								cut_num = city_code;
								city = city + " " + ar.get(i).getArea();
								city_code = city_code + " " + ar.get(i).getCode_num();
								gucode_map.put(city_code, city);
								gucode_ar.add(city_code);
								city = tmp;
								city_code = cut_num;
							}
						}
					}
				}
			}
			String[] remove_code = {"31010", "31020", "31040", "31050", "31090", "31100", "31190", "33010", "34010", "35010", "37010", "38110"};
			for(int a=0; a<remove_code.length; a++) {
				gucode_map.remove(remove_code[a]);
			}
			for(int a=0; a<gucode_ar.size(); a++) {
				for(int b=0; b<remove_code.length; b++) {
					if(gucode_ar.get(a).equals(remove_code[b])) {
						gucode_ar.remove(a);
					}
				}
			}
			
			info.add(gucode_ar);
			info.add(gucode_map);
		} else if(areacodeDTO.getSi_value()!=null && areacodeDTO.getGu_value()!=null) {
			dongcode_ar = new ArrayList<>();
			dongcode_map = new HashMap<>();
			info = new ArrayList<>();
			List<AreaCodeDTO> ar = recruitDAO.selectArea(areacodeDTO);
			
			for(int i=0; i<ar.size(); i++) {
				if(ar.get(i).getCode_num().length()==7) {
					String tmp = ar.get(i).getCode_num().substring(0, 5);
					if(tmp.equals(areacodeDTO.getGu_code())) {
						areacodeDTO.setDong_code(ar.get(i).getCode_num());
						areacodeDTO.setDong_value(ar.get(i).getArea());
						dongcode_map.put(areacodeDTO.getDong_code(), areacodeDTO.getDong_value());
						dongcode_ar.add(areacodeDTO.getDong_code());
					}
				}
			}
			info.add(dongcode_ar);
			info.add(dongcode_map);
			
		} else {
			sicode_ar = new ArrayList<>();
			sicode_map = new HashMap<>();
			info = new ArrayList<>();
			List<AreaCodeDTO> ar = recruitDAO.selectArea(areacodeDTO);
			
			for(int i=0; i<ar.size(); i++) {
				if(ar.get(i).getCode_num().length()==2) {
					areacodeDTO.setSi_code(ar.get(i).getCode_num());
					areacodeDTO.setSi_value(ar.get(i).getArea());
					sicode_map.put(areacodeDTO.getSi_code(), areacodeDTO.getSi_value());
					sicode_ar.add(areacodeDTO.getSi_code());
				}
			}
			
			job_ar = recruitDAO.selectJob();
			spec_ar = recruitDAO.selectSpec();
			

			
			info.add(sicode_ar);
			info.add(sicode_map);
			info.add(job_ar);
			info.add(spec_ar);
		}
		
		return info;
	}
}
