package com.iu.scrap;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.iu.recruit.RecruitDTO;

@Service
public class ScrapDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "ScrapMapper.";
	
	public int Insert(ScrapDTO scrapDTO) {
		return sqlSession.insert(NAMESPACE+"insert", scrapDTO);
	}
	
	public int Delete(ScrapDTO scrapDTO) {
		return sqlSession.delete(NAMESPACE+"delete", scrapDTO);
	}
	
	public List<ScrapDTO> SelectList(ScrapDTO scrapDTO) {
		return sqlSession.selectList(NAMESPACE+"selectList", scrapDTO);
	}
		
//	public ScrapDTO SelectOne(ScrapDTO scrapDTO) {
//		return sqlSession.selectOne(NAMESPACE+"", scrapDTO);
//	}
}
