package kr.icia.service;


import kr.icia.domain.MemberVO;


public interface signupService {
	public boolean signup(MemberVO membervo);
	
	public MemberVO read1(String userid);
}
