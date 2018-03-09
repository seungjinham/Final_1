package com.iu.supporter;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.iu.apply.ApplyDTO;
import com.iu.paper.PaperDTO;

@Repository
public class SupporterDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "SupporterMapper.";
	
	public List<SupporterDTO> supporterList(String id) {
		return sqlSession.selectList(NAMESPACE+"supporterList", id);
	}
	
	public List<PaperDTO> paperList(String id) {
		return sqlSession.selectList(NAMESPACE+"paperList", id);
	} 
	
	
	public int insert(SupporterDTO supporterDTO) {
		return sqlSession.insert(NAMESPACE+"insert", supporterDTO);
	}
	
	public int update(SupporterDTO supporterDTO) {
		return sqlSession.update(NAMESPACE+"update", supporterDTO);
	}
	
	public int applyCount(SupporterDTO supporterDTO) {
		return sqlSession.selectOne(NAMESPACE+"applyCount", supporterDTO);
	}
}
