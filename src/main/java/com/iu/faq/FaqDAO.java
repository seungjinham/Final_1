package com.iu.faq;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="FaqMapper.";
	
	
	public int insert(FaqDTO faqDTO) throws Exception{
		
	}
	
	
	
	
	
}
