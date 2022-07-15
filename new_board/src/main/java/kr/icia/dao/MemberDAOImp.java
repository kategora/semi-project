package kr.icia.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.icia.domain.MemberVO;
import lombok.Setter;

@Repository
public class MemberDAOImp implements memberDAO {

	@Setter(onMethod_ = {@Autowired})
	private SqlSession sqlSession;
	
	@Override
	public int signup(MemberVO vo) {
		return sqlSession.insert("kr.icia.mapper.MemberMapper.signup", vo);
	}

	@Override
	public MemberVO read1(String userid) {
		return sqlSession.selectOne("kr.icia.mapper.MemberMapper.read1", userid);
	}
}
