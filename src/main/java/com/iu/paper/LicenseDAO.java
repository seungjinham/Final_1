package com.iu.paper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LicenseDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="PaperMapper.";
	
	//이력서 등록
	public int insert(LicenseDTO licenseDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"licenseInsert", licenseDTO);
	}
	
	//이력서 수정
	public int update(LicenseDTO licenseDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"licenseUpdate", licenseDTO);
	}
	
	//이력서 삭제
	public int delete(String id) throws Exception{
		return sqlSession.delete(NAMESPACE+"licenseDelete", id);
	}
	
	//이력서 보기
	public LicenseDTO view(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"licenseView", id);
	}

}
