package com.iu.supporter;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.apply.ApplyDTO;

@Service
public class SupporterService {
	@Inject
	private SupporterDAO supporterDAO;
	
	public int insert(ApplyDTO applyDTO) {
		return supporterDAO.insert(applyDTO);
	}
}
