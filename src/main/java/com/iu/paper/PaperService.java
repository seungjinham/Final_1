package com.iu.paper;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.util.FileSaver;

@Service
public class PaperService {

	@Inject
	private PaperDAO paperDAO;
	@Inject
	private LicenseDAO licenseDAO;
	
	//이력서 등록
	public int insert(PaperDTO paperDTO,LicenseDTO licenseDTO, MultipartFile file, HttpSession session) throws Exception{
		String filePath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(filePath);
		if(!f.exists()){
			f.mkdirs();
		}
		FileSaver fs = new FileSaver();
		String name = fs.saver(file, filePath);
		paperDTO.setFname(name);
		paperDTO.setOname(file.getOriginalFilename());
		
		licenseDAO.insert(licenseDTO);
		int result = paperDAO.insert(paperDTO);
		return result;
	}

	//이력서 수정
	public int update(PaperDTO paperDTO) throws Exception{
		return paperDAO.update(paperDTO);
	}

	//이력서 삭제
	public int delete(String id) throws Exception{
		return paperDAO.delete(id);
	}

	//이력서 보기
	public PaperDTO view(String id) throws Exception{
		return paperDAO.view(id);
	}
	
	//이력서 리스트
	public PaperDTO list(String id) throws Exception{
		return paperDAO.list(id);
	}

}
