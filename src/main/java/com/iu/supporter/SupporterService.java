package com.iu.supporter;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.iu.apply.ApplyDTO;
import com.iu.paper.LicenseDAO;
import com.iu.paper.PaperDAO;
import com.iu.paper.PaperDTO;
import com.iu.paper.PortDAO;

@Service
public class SupporterService {
	@Inject
	private SupporterDAO supporterDAO;
	@Inject
	private PaperDAO paperDAO;
	@Inject
	private LicenseDAO licenseDAO;
	@Inject
	private PortDAO portDAO;
	
	//지원자 리스트
	public List<SupporterDTO> supporterList(String id) throws Exception{
		return supporterDAO.supporterList(id);
	}
	
	//지원자 이력서리스트
	public List<PaperDTO> paperlist(String id) throws Exception{
		return paperDAO.list(id);
	}

	//지원자 이력서보기
	public PaperDTO view(int paper_num) throws Exception{
		licenseDAO.view(paper_num);
		portDAO.view(paper_num);
		return paperDAO.view(paper_num);
	}
	
	public int insert(SupporterDTO supporterDTO) {
		supporterDTO.setStatus("지원");
		return supporterDAO.insert(supporterDTO);
	}
	
	public int update(SupporterDTO supporterDTO) {
		supporterDTO.setStatus("지원취소");
		return supporterDAO.update(supporterDTO);
	}

	public int applyCount(SupporterDTO supporterDTO) {
		supporterDTO.setStatus("지원취소");
		return supporterDAO.applyCount(supporterDTO);
	}
}
