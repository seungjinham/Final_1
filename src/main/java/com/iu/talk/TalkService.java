package com.iu.talk;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class TalkService {
	
	@Inject
	private TalkDAO talkDAO;
	
	private int insert(TalkDTO talkDTO) throws Exception{
		return talkDAO.insert(talkDTO);
	}
	
	
	
	
}
