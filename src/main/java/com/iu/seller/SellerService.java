package com.iu.seller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.file.FileDAO;
import com.iu.file.FileDTO;
import com.iu.util.FileSaver;
@Service
public class SellerService {
	
	@Inject
	private SellerDAO sellerDAO;
	@Inject
	private OptionDAO optionDAO;
	@Inject
	private FileDAO fileDAO;
	
	//============== Write ==============
	public int sellerWrite(SellerDTO sellerDTO, HttpSession session, MultipartFile file[], MultipartFile profile) throws Exception {		
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
			System.out.println(fileDTO.getFname());
			fileDTO.setId(sellerDTO.getId());
			
			result=fileDAO.insert(fileDTO);			
		}

		if(profile.getOriginalFilename() == ""){
			sellerDTO.setFname("");
			sellerDTO.setOname("");
		}else{
			FileSaver fs = new FileSaver();
			String name = fs.saver(profile, filePath);
			sellerDTO.setFname(name);
			sellerDTO.setOname(profile.getOriginalFilename());
		}
		
		sellerDAO.sellerWrite(sellerDTO);
		optionDAO.optionWrite(sellerDTO);

		return result;
	}
	
	//============== Update ==============
	public int sellerUpdate(SellerDTO sellerDTO,HttpSession session, OptionDTO optionDTO[], MultipartFile[] file) throws Exception {
		sellerDAO.sellerUpdate(sellerDTO);
		optionDAO.optionUpdate(sellerDTO);
		
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
	
	//============== View ==============
	public SellerDTO sellerOne(SellerDTO sellerDTO) throws Exception{
		optionDAO.optionList(sellerDTO.getId());
		return sellerDAO.sellerOne(sellerDTO);
	}
	
	//============== selectList ==============
	public List<SellerDTO> sellerList(String category) throws Exception{
		return sellerDAO.sellerList(category);
	}
	
	
	//============== Favor ==============
	public int favorInsert(FavorDTO favorDTO) throws Exception{
		return sellerDAO.favorInsert(favorDTO);
	}
	
	public int favorDelete(FavorDTO favorDTO) throws Exception{
		return sellerDAO.favorDelete(favorDTO);
	}
	
	public List<FavorDTO> favorList(String id) throws Exception{
		return sellerDAO.favorList(id);
	}
	
}
