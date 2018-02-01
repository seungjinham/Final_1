package com.iu.recruit;

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
	
	public List<RecruitDTO> selectList() {
		return null;
	}
	
	public int selectOne(int num) {
		return 0;
	}
}
