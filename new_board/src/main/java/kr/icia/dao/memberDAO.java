package kr.icia.dao;

import kr.icia.domain.MemberVO;

public interface memberDAO {
	public int signup(MemberVO membervo);
	
	public MemberVO read1(String userid);
}
