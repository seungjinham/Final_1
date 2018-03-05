package com.iu.paper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class PortDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="PaperMapper.";
	
	//이력서 등록
	public int insert(PortDTO portDTO, MultipartFile port_file) throws Exception{
		return sqlSession.insert(NAMESPACE+"portInsert", portDTO);
	}
	
	//이력서 수정
	public int update(PortDTO portDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"portUpdate", portDTO);
	}
	
	//이력서 삭제
	public int delete(String id) throws Exception{
		return sqlSession.delete(NAMESPACE+"portDelete", id);
	}
	
	//이력서 보기
	public PortDTO view(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"portView", id);
	}


}
