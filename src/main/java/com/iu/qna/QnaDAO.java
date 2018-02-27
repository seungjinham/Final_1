package com.iu.qna;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.iu.util.ListData;

@Repository
public class QnaDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="QnaMapper.";
	
	
	public int insert(QnaDTO qnaDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", qnaDTO);
	}
	
	public int delete(QnaDTO qnaDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"delete", qnaDTO);
	}
	
	public List<QnaDTO> selectList(ListData listData) throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList", listData);
	}
	
	public QnaDTO selectOne(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", num);
	}	
	
	public int totalCount(ListData listData) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"totalCount", listData);
	}
	
}
