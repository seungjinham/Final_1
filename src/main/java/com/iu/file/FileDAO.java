package com.iu.file;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="FileMapper.";
	
	public int insert(FileDTO fileDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", fileDTO);
	}
	
	public List<FileDTO> selectList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList", id);
	}
	
	public int delete(String id) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete",id);
	}
	
	public int deleteFnum(int fnum) throws Exception{
		return sqlSession.delete(NAMESPACE+"deleteFnum",fnum);
	}
}
