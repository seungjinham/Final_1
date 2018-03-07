package com.iu.paper;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.iu.util.FileSaver;

@Repository
public class PortDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="PaperMapper.";
	
	//이력서 등록
	public int insert(PortDTO portDTO, MultipartFile port_file, HttpSession session) throws Exception{
		String filePath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(filePath);
		if(!f.exists()){
			f.mkdirs();
		}
		FileSaver fs = new FileSaver();
		String name2 = fs.saver(port_file, filePath);
		portDTO.setFname(name2);
		portDTO.setOname(port_file.getOriginalFilename());
		
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