package com.iu.review;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.iu.util.ListData;

@Repository
public class ReviewDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE= "ReviewMapper.";
	
	
	public int insert(ReviewDTO reviewDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", reviewDTO);
	}
	
	public int update(ReviewDTO reviewDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", reviewDTO);
	}
	
	public int delete(int num) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", num);
	}

	public List<ReviewDTO> selectList(ListData listData) throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList", listData);
	}

	public ReviewDTO selectOne(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", num);
	}
	
	
	
	
}
