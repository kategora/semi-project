package kr.icia.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.icia.domain.MemberVO;
import kr.icia.service.signupService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


	
@Controller
@Log4j
@AllArgsConstructor
public class signupController {

	private signupService service;
	
	@GetMapping("/signup")
	public void signupGet() {
	}
	
	@PostMapping("/signup")
	public void signupSet(MemberVO membervo) {
		log.info(membervo);	
		service.signup(membervo);
	}
	
//	@GetMapping("/mypage")
//	public void asd(String userid, Model model) {
//		model.addAttribute("mypage", service.read1("usdrid"));
//	}
	
	
	@GetMapping("/mypage")
	public void asd() {
		
	}
	
	@GetMapping(value="/mypage/get"  ,produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public MemberVO asda(String userid) {
		log.info(userid);
		return service.read1(userid);
	}
}
