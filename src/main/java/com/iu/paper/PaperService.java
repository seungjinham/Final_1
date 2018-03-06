package com.iu.paper;

import java.io.File;
import java.util.List;

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
	@Inject
	private PortDAO portDAO;
	
	//이력서 등록
	public int insert(PaperDTO paperDTO,LicenseDTO licenseDTO,PortDTO portDTO, MultipartFile file,MultipartFile port_file, HttpSession session) throws Exception{
		String filePath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(filePath);
		if(!f.exists()){
			f.mkdirs();
		}
		FileSaver fs = new FileSaver();
		String name = fs.saver(file, filePath);
		paperDTO.setFname(name);
		paperDTO.setOname(file.getOriginalFilename());
		
		if(portDTO.getFname() == null && portDTO.getOname() == null){
			portDTO.setFname("no");
			portDTO.setOname("no");
		}
		if(portDTO.getFname() != null && portDTO.getOname() != null){
			portDAO.insert(portDTO, port_file, session);
		}
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
	
	//이력서 갯수 제한
	public int count(String id) throws Exception{
		return paperDAO.count(id);
	}

}
