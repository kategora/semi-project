package kr.icia.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.icia.domain.BoardVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

//	@Test
//	public void testGetList() {
//		log.info(mapper.getList());
//	}
//	
//	@Test
//	public void testInsert() {
//		BoardVO b = new BoardVO();
//		b.setTitle("1");
//		b.setContent("2");
//		b.setWriter("3");
//		
//		mapper.insert(b);
//		log.info(mapper.read(7L));
//	}
//	@Test
//	public void testDelete() {
//		log.info(mapper.delete(7L));
//	}
	
	@Test
	public void testUpdate() {
		BoardVO ub = new BoardVO();
		ub.setTitle("11");
		ub.setContent("22");
		ub.setBno(6L);
		ub.setWriter("33");
		log.info(mapper.update(ub));
	}
	
}
