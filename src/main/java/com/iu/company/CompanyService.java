package com.iu.company;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
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
	
	public CompanyDTO selectOne(String id) {
		CompanyDTO companyDTO = companyDAO.selectOne(id);
		return companyDTO;
	}
	
	public List<CompanyDTO> selectList(List<RecruitDTO> recruit_ar) {
		List<CompanyDTO> company_ar = new ArrayList<>();
		for(int i=0; i<recruit_ar.size(); i++) {
			String id = recruit_ar.get(i).getId();
			CompanyDTO companyDTO = companyDAO.selectList(id);
			if(companyDTO!=null) {
				company_ar.add(companyDTO);
			}
		}
		return company_ar;
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
