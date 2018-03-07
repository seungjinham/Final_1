package com.iu.seller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.file.FileDAO;
import com.iu.file.FileDTO;
import com.iu.member.MemberDTO;
import com.iu.util.FileSaver;
@Service
public class SellerService {
	
	@Inject
	private SellerDAO sellerDAO;
	@Inject
	private FileDAO fileDAO;
	
	//============== Write ==============
	public int sellerWrite(SellerDTO sellerDTO, HttpSession session, MultipartFile file[]) throws Exception {

		sellerDAO.sellerWrite(sellerDTO);
		
		FileSaver fileSaver = new FileSaver();
		String filePath = session.getServletContext().getRealPath("resources/upload");
		
		File f = new File(filePath);
		if(!f.exists()){
			f.mkdirs();
		}
		
		List<String> names=fileSaver.saver(file, filePath);
		int result=0;
		
		for(int i=0; i<names.size(); i++){
			FileDTO fileDTO = new FileDTO();
			fileDTO.setFname(names.get(i));
			fileDTO.setOname(file[i].getOriginalFilename());
			fileDTO.setId(sellerDTO.getId());
			
			result=fileDAO.insert(fileDTO);			
		}

		return result;
	}
	
	//============== View ==============
	public MemberDTO sellerOne(SellerDTO sellerDTO) throws Exception{
		return sellerDAO.sellerOne(sellerDTO);
	}
	
	//============== Update ==============
	public int sellerUpdate(SellerDTO sellerDTO,HttpSession session, MultipartFile[] file) throws Exception {
		sellerDAO.sellerUpdate(sellerDTO);
		
		FileSaver fileSaver = new FileSaver();
		String filePath = session.getServletContext().getRealPath("resources/upload");

		File f = new File(filePath);
		if(!f.exists()){
			f.mkdirs();
		}

		List<String> names=fileSaver.saver(file, filePath);
		int result=0;

		for(int i=0; i<names.size(); i++){
			FileDTO fileDTO = new FileDTO();
			fileDTO.setFname(names.get(i));
			fileDTO.setOname(file[i].getOriginalFilename());
			fileDTO.setId(sellerDTO.getId());

			result=fileDAO.insert(fileDTO);			
		}	
		return result;
		
	}
	
	//============== Delete ==============
	public int sellerDelete(SellerDTO sellerDTO, HttpSession session) throws Exception {
		String filePath = session.getServletContext().getRealPath("resources/upload");
		List<FileDTO> ar = fileDAO.selectList(sellerDTO.getId());
		
		int result = sellerDAO.sellerDelete(sellerDTO); 
		result = fileDAO.delete(sellerDTO.getId());
		
		for(FileDTO fileDTO : ar){
			try {
				File file = new File(filePath, fileDTO.getFname());
				file.delete();				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//============== selectList ==============
	public List<SellerDTO> sellerList(String category) throws Exception{
		return sellerDAO.sellerList(category);
	}
}
