package com.iu.faq;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.util.ListData;
import com.iu.util.PageMaker;

@Service
public class FaqService {

	@Inject
	private FaqDAO faqDAO;
	
	
	public int insert(FaqDTO faqDTO) throws Exception{
		return faqDAO.insert(faqDTO);
	}
	
	public List<FaqDTO> selectList(ListData listData) throws Exception{
		int totalCount = faqDAO.totalCount(listData);
		PageMaker pageMaker = new PageMaker();
		pageMaker.pageMaker(totalCount, listData);
		return faqDAO.selectList(listData);
	}
 	
	
	
	
	
}
