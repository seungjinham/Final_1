package com.iu.apply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iu.recruit.RecruitDTO;

@Service
public class ApplyService {
	@Inject
	private ApplyDAO applyDAO;
	
	public int insert(ApplyDTO applyDTO) {
		return applyDAO.insert(applyDTO);
	}
}
