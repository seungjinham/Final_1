package com.iu.qna;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.util.FileSaver;
import com.iu.util.ListData;
import com.iu.util.PageMaker;

@Service
public class QnaService {
	
	@Inject
	private QnaDAO qnaDAO;
	
	public int insert(QnaDTO qnaDTO, HttpSession session, MultipartFile file) throws Exception{
		String filePath = session.getServletContext().getRealPath("resources/upload");
		
		if(file.equals(file)){
			qnaDTO.setFname("");
			qnaDTO.setOname("");	

		}else{
			File f = new File(filePath);
			if(!f.exists()){
				f.mkdirs();
			}
			
			FileSaver fileSaver = new FileSaver();
			String fileName=fileSaver.saver(file, filePath);
			
			qnaDTO.setFname(fileName);
			qnaDTO.setOname(file.getOriginalFilename());	
		}
		
		return qnaDAO.insert(qnaDTO);
	}
	
	public int delete(QnaDTO qnaDTO, HttpSession session) throws Exception{
		String filePath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(filePath, qnaDTO.getFname());
		f.delete();
		return qnaDAO.delete(qnaDTO);
	}
	
	
	public List<QnaDTO> selectList(ListData listData) throws Exception{
		int totalCount = qnaDAO.totalCount(listData);
		PageMaker pageMaker = new PageMaker();
		pageMaker.pageMaker(totalCount, listData);
		return qnaDAO.selectList(listData);
	}

	public QnaDTO selectOne(int num) throws Exception{
		return qnaDAO.selectOne(num);
	}
	
	
}
