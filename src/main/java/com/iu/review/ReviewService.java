package com.iu.review;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.util.ListData;

@Service
public class ReviewService {
	
	@Inject
	private ReviewDAO reviewDAO;
	
	public int insert(ReviewDTO reviewDTO) throws Exception{
		return reviewDAO.insert(reviewDTO);
	}
	
	public int update(ReviewDTO reviewDTO) throws Exception{
		return reviewDAO.update(reviewDTO);
	}
	
	public int delete(int num) throws Exception{
		return reviewDAO.delete(num);
	}

	public List<ReviewDTO> selectList(ListData listData) throws Exception{
		return reviewDAO.selectList(listData);
	}
	
	public ReviewDTO selectOne(int num) throws Exception{
		return reviewDAO.selectOne(num);
	}
	
	
}

