package com.iu.scrap;

import java.util.List;
import java.util.Map;

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
	
	public int Delete(ScrapDTO scrapDTO, String page) {
		int result = 0;
		
		if(page.equals("view")) {
			result = sqlSession.delete(NAMESPACE+"delete", scrapDTO);
		} else if(page.equals("list")) {
			result = sqlSession.delete(NAMESPACE+"delete", scrapDTO);
		} else {
			String tempid = scrapDTO.getId();
			int[] tempnum = new int[scrapDTO.getSelect_ch().size()];
			for(int i=0; i<tempnum.length; i++) {
				tempnum[i] = scrapDTO.getSelect_ch().get(i);
			}
			for(int i=0; i<tempnum.length; i++) {
				scrapDTO.setId(tempid);
				scrapDTO.setRecruit_num(tempnum[i]);
				result = sqlSession.delete(NAMESPACE+"delete", scrapDTO);
			}
		}
		return result;
	}
	
	public List<ScrapDTO> SelectList(ScrapDTO scrapDTO) {
		return sqlSession.selectList(NAMESPACE+"selectList", scrapDTO);
	}
	
	public int TotalCount() {
		return sqlSession.selectOne(NAMESPACE+"totalCount");
	}
		
//	public ScrapDTO SelectOne(ScrapDTO scrapDTO) {
//		return sqlSession.selectOne(NAMESPACE+"", scrapDTO);
//	}
}
