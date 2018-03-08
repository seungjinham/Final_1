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
		if(file.getOriginalFilename() == ""){
			paperDTO.setFname("");
			paperDTO.setOname("");
		}else{
			File f = new File(filePath);
			if(!f.exists()){
				f.mkdirs();
			}
			FileSaver fs = new FileSaver();
			String name = fs.saver(file, filePath);
			paperDTO.setFname(name);
			paperDTO.setOname(file.getOriginalFilename());
		}
		//이력서
		int result = paperDAO.insert(paperDTO);

		//자격증
		licenseDTO.setPaper_num(paperDTO.getPaper_num());
		licenseDAO.insert(licenseDTO);
		//포트폴리오
		portDTO.setPaper_num(paperDTO.getPaper_num());
		portDAO.insert(portDTO, port_file, session);
		return result;
	}

	//이력서 갯수 제한
	public int count(String id) throws Exception{
		return paperDAO.count(id);
	}

	//이력서 리스트
	public List<PaperDTO> list(String id) throws Exception{
		return paperDAO.list(id);
	}

	//이력서 보기
	public PaperDTO view(int paper_num) throws Exception{
		licenseDAO.view(paper_num);
		portDAO.view(paper_num);
		return paperDAO.view(paper_num);
	}

	//이력서 수정
	public int update(PaperDTO paperDTO, LicenseDTO licenseDTO, PortDTO portDTO, MultipartFile file,MultipartFile port_file, HttpSession session) throws Exception{
		String filePath = session.getServletContext().getRealPath("resources/upload");
		if(file.getOriginalFilename() == ""){
			paperDTO.setFname("");
			paperDTO.setOname("");
		}else{
			File f = new File(filePath);
			if(!f.exists()){
				f.mkdirs();
			}
			FileSaver fs = new FileSaver();
			String name = fs.saver(file, filePath);
			paperDTO.setFname(name);
			paperDTO.setOname(file.getOriginalFilename());
		}
		licenseDAO.update(licenseDTO);
		portDAO.update(portDTO, port_file, session);
		int result = paperDAO.update(paperDTO);

		return result;
	}


	//이력서 삭제
	public int delete(int paper_num)  throws Exception{
		licenseDAO.delete(paper_num);
		portDAO.delete(paper_num);
		return paperDAO.delete(paper_num);
	}

}
