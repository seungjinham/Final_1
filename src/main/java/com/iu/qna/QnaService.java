package com.iu.qna;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.util.ListData;

@Service
public class QnaService {
	
	@Inject
	private QnaDAO talkDAO;
	
	
	public int insert(QnaDTO talkDTO) throws Exception{
		return talkDAO.insert(talkDTO);
	}
	
	public List<QnaDTO> selectList(ListData listData) throws Exception{
		return talkDAO.selectList(listData);
	}

	public QnaDTO selectOne(int num) throws Exception{
		return talkDAO.selectOne(num);
	}
	
	
}
