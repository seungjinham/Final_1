package com.iu.talk;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.util.ListData;

@Service
public class TalkService {
	
	@Inject
	private TalkDAO talkDAO;
	
	
	public int insert(TalkDTO talkDTO) throws Exception{
		return talkDAO.insert(talkDTO);
	}
	
	public List<TalkDTO> selectList(ListData listData) throws Exception{
		return talkDAO.selectList(listData);
	}

	public TalkDTO selectOne(int num) throws Exception{
		return talkDAO.selectOne(num);
	}
	
	
}
