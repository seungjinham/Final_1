package com.iu.faq;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.iu.util.ListData;

@Repository
public class FaqDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="FaqMapper.";
	
	
	public int insert(FaqDTO faqDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", faqDTO);
	}
	
	public List<FaqDTO> selectList(ListData listData) throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList", listData);
	}
	
	public int delete(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", num);
	}
	
	public int update(FaqDTO faqDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", faqDTO);
	}
	
	public FaqDTO selectOne(int num)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", num);
	}
	
	
	
	
}
