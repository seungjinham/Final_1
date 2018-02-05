package com.iu.seller;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.iu.member.MemberDTO;

@Service
public class SellerService {
	
	@Inject
	private SellerDAO sellerDAO;
	
	public int sellerWrite(MemberDTO memberDTO) throws Exception {
		return sellerDAO.sellerWrite(memberDTO);
	}
	
	public int sellerUpdate(MemberDTO memberDTO) throws Exception {
		return sellerDAO.sellerUpdate(memberDTO);
	}
	
	public int sellerDelete(String id) throws Exception {
		return sellerDAO.sellerDelete(id);
	}
	
	public MemberDTO sellerOne(String id) throws Exception{
		return sellerDAO.sellerOne(id);
	}
}
