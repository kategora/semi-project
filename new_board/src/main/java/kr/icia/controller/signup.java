package kr.icia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.icia.domain.MemberVO;
import kr.icia.service.signupService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


	
@Controller
@Log4j
@AllArgsConstructor
public class signup {

	private signupService service;
	
	@GetMapping("/signup")
	public void signupGet() {
	}
	
	@PostMapping("/signup")
	public void signupSet(MemberVO membervo) {
		log.info(membervo);	
		service.signup(membervo);
	}
	
	@GetMapping("/mypage")
	public void asd(String userid, Model model) {
		model.addAttribute("mypage", service.read1("125521"));
	}
	
}
