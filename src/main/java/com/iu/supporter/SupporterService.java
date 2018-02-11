package com.iu.supporter;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.apply.ApplyDTO;

@Service
public class SupporterService {
	@Inject
	private SupporterDAO supporterDAO;
	
	public int insert(SupporterDTO supporterDTO) {
		supporterDTO.setStatus("지원");
		return supporterDAO.insert(supporterDTO);
	}
	
	public int update(SupporterDTO supporterDTO) {
		supporterDTO.setStatus("지원취소");
		return supporterDAO.update(supporterDTO);
	}
	
	public int applyConut(SupporterDTO supporterDTO) {
		supporterDTO.setStatus("지원취소");
		supporterDAO.applyCount(supporterDTO);
		return 0;
	}
}
