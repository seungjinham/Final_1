package com.iu.seller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.member.MemberDTO;
import com.iu.util.FileSaver;

@Service
public class SellerService {
	
	@Inject
	private SellerDAO sellerDAO;
	
	//============== Write ==============
	public int sellerWrite(SellerDTO sellerDTO, HttpSession session, MultipartFile file) throws Exception {
		String filePath = session.getServletContext().getRealPath("resources/upload");
		
		File f = new File(filePath);
		if(!f.exists()){
			f.mkdirs();
		}
		
		FileSaver fileSaver = new FileSaver();
		String name=fileSaver.saver(file, filePath);
		
		sellerDTO.setFname(name);
		sellerDTO.setOname(file.getOriginalFilename());
		int result = sellerDAO.sellerWrite(sellerDTO);

		return result;
	}
	
	//============== View ==============
	public MemberDTO sellerOne(SellerDTO sellerDTO) throws Exception{
		return sellerDAO.sellerOne(sellerDTO);
	}
	
	//============== Update ==============
	public int sellerUpdate(SellerDTO sellerDTO,HttpSession session, MultipartFile file) throws Exception {
		if(file != null){
			String filePath = session.getServletContext().getRealPath("resources/upload");

			File f = new File(filePath);
			if(!f.exists()){
				f.mkdirs();
			}

			FileSaver fileSaver = new FileSaver();
			String fileName=fileSaver.saver(file, filePath);

			sellerDTO.setFname(fileName);
			sellerDTO.setOname(file.getOriginalFilename());
		}else{
			SellerDTO sellerDTO2 = (SellerDTO)session.getAttribute("member");
			sellerDTO.setFname(sellerDTO2.getFname());
			sellerDTO.setOname(sellerDTO2.getOname());
		}
		
		return sellerDAO.sellerUpdate(sellerDTO);
	}
	
	//============== Delete ==============
	public int sellerDelete(SellerDTO sellerDTO, HttpSession session) throws Exception {
		String filePath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(filePath, sellerDTO.getFname());
		f.delete();
		
		return sellerDAO.sellerDelete(sellerDTO);
	}
	
}
