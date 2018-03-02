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
	private SchoolDAO schoolDAO;
	
	@Inject
	private HopeDAO hopeDAO;
	
	@Inject
	private CareerDAO careerDAO;

	//이력서 등록
	public int insert(PaperDTO paperDTO,SchoolDTO schoolDTO,HopeDTO hopeDTO,CareerDTO careerDTO, MultipartFile file, HttpSession session) throws Exception{
		String filePath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(filePath);
		if(!f.exists()){
			f.mkdirs();
		}
		FileSaver fs = new FileSaver();
		String name = fs.saver(file, filePath);
		paperDTO.setFname(name);
		paperDTO.setOname(file.getOriginalFilename());
		
		int result = paperDAO.insert(paperDTO);
		if(result>0){
			result = schoolDAO.insert(schoolDTO);
			result = hopeDAO.insert(hopeDTO);
			result = careerDAO.insert(careerDTO);
		}
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

}
