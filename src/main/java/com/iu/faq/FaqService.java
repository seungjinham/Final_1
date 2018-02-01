package com.iu.faq;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.util.ListData;

@Service
public class FaqService {
	
	@Inject
	private FaqDAO faqDAO;
	
	public int insert(FaqDTO faqDTO) throws Exception{
		return faqDAO.insert(faqDTO);
	}
	
	public List<FaqDTO> selectList(ListData listData) throws Exception{
		return faqDAO.selectList(listData);
	}
	
	public int delete(int num) throws Exception{
		return faqDAO.delete(num);
	}
	
	public int update(FaqDTO faqDTO) throws Exception{
		return faqDAO.update(faqDTO);
	}
	
	public FaqDTO selectOne(int num) throws Exception{
		return faqDAO.selectOne(num);
	}
	
	
}
