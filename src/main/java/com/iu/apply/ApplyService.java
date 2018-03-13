package com.iu.apply;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iu.company.CompanyDAO;
import com.iu.company.CompanyDTO;
import com.iu.recruit.RecruitDAO;
import com.iu.recruit.RecruitDTO;
import com.iu.util.ListData;
import com.iu.util.ListSort;
import com.iu.util.PageMaker;

@Service
public class ApplyService {
	@Inject
	private ApplyDAO applyDAO;
	@Inject
	private RecruitDAO recruitDAO;
	@Inject
	private CompanyDAO companyDAO;
	
	public int insert(ApplyDTO applyDTO) {
		return applyDAO.insert(applyDTO);
	}
	
	public int delete(ApplyDTO applyDTO) {
		return applyDAO.delete(applyDTO);
	}
	
	public List<Object> selectList(ApplyDTO applyDTO, ListData listData) {
		List<Object> obj_ar = new ArrayList<>();
		Integer at_count = applyDAO.totalCount();
		List<ApplyDTO> apply_ar = applyDAO.selectList(applyDTO);
		List<RecruitDTO> recruit_ar = new ArrayList<RecruitDTO>();
		for(int i=0; i<apply_ar.size(); i++) {
			RecruitDTO recruitDTO = recruitDAO.selectOne(apply_ar.get(i).getRecruit_num());
			recruit_ar.add(recruitDTO);
		}
		List<CompanyDTO> company_ar = new ArrayList<>();
		for(int i=0; i<recruit_ar.size(); i++) {
			CompanyDTO companyDTO = companyDAO.selectOne(recruit_ar.get(i).getId());
			company_ar.add(companyDTO);
		}//for end
		ListSort listSort = new ListSort();
		recruit_ar = listSort.listSort(recruit_ar, company_ar);
		PageMaker pageMaker = new PageMaker();
		pageMaker.pageMaker(at_count, listData);
		obj_ar.add(recruit_ar);
		obj_ar.add(listData);
		return obj_ar;
	}//method end
	
	public int duplicationCheck(ApplyDTO applyDTO) {
		int result = applyDAO.duplicationCheck(applyDTO);
		return result;
	}
}//class end
