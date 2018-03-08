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


	//이력서 보기
	public LicenseDTO view(int paper_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"licenseView", paper_num);
	}

	//이력서 수정
	public int update(LicenseDTO licenseDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"licenseUpdate", licenseDTO);
	}

	//이력서 삭제
	public int delete(int paper_num) throws Exception{
		return sqlSession.delete(NAMESPACE+"licenseDelete", paper_num);
	}

}
