package com.iu.company;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.iu.member.MemberDTO;
import com.iu.member.MemberService;
import com.iu.recruit.RecruitDAO;
import com.iu.recruit.RecruitDTO;
import com.iu.util.FileSaver;

@Service
public class CompanyService implements MemberService {
	
	@Inject
	private CompanyDAO companyDAO;
	@Inject
	private RecruitDAO recruitDAO;

	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		return companyDAO.join(memberDTO);
	}

	@Override
	public int delete(MemberDTO memberDTO) throws Exception {
		return 0;
	}

	@Override
	public int update(MemberDTO memberDTO) throws Exception {
		return 0;
	}

	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return companyDAO.login(memberDTO);
	}

	@Override
	public MemberDTO idCheck(String id) throws Exception {
		return null;
	}
	
	@Override
	public CompanyDTO MyPage(String id) throws Exception {
		return companyDAO.MyPage(id);
	}

	//공고등록
	public int companyRecruit(RecruitDTO recruitDTO, MultipartFile file, HttpSession session) throws Exception {
		String filepath = session.getServletContext().getRealPath("resouces/upload");
		System.out.println(filepath);
		File f = new File(filepath);
		if(!f.exists()) {
			f.mkdirs();
		}
		FileSaver fs = new FileSaver();
		String name = fs.saver(file, filepath);
		recruitDTO.setOname(file.getOriginalFilename());
		recruitDTO.setFname(name);
		return recruitDAO.companyRecruit(recruitDTO);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
