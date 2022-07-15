package kr.icia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.icia.dao.memberDAO;
import kr.icia.domain.MemberVO;
import lombok.Setter;


@Service
public class signupServiceImp implements signupService{

	@Setter(onMethod_ = {@Autowired})
	private memberDAO memberDAO;
	
	@Override
	public boolean signup(MemberVO membervo) {
		
		return memberDAO.signup(membervo)==1;
	}

	@Override
	public MemberVO read1(String userid) {
		return memberDAO.read1(userid);
	}
	
}
