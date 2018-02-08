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
import com.iu.util.ListSort;

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
	
	public List<RecruitDTO> selectList(ApplyDTO applyDTO) {
		List<ApplyDTO> apply_ar = applyDAO.selectList(applyDTO);
		List<RecruitDTO> recruit_ar = new ArrayList<RecruitDTO>();
		for(int i=0; i<apply_ar.size(); i++) {
			RecruitDTO recruitDTO = recruitDAO.selectOne(apply_ar.get(i).getRecruit_num());
			recruit_ar.add(recruitDTO);
		}
		List<CompanyDTO> company_ar = new ArrayList<>();
		for(int i=0; i<recruit_ar.size(); i++) {
			CompanyDTO companyDTO = companyDAO.selectList(recruit_ar.get(i).getId());
			if(i==0) {
				company_ar.add(companyDTO);
			} else {
				//rotate:
				for(int j=0; j<recruit_ar.size(); j++) {
					if(companyDTO.getId().equals(company_ar.get(j).getId())) {
						company_ar.add(companyDTO);
					} else {
						company_ar.add(companyDTO);
						//break rotate;
					}//else end
				}//for end
			}//else end
		}//for end
		ListSort listSort = new ListSort();
		recruit_ar = listSort.listSort(recruit_ar, company_ar);
		return recruit_ar;
	}//method end
}//class end
