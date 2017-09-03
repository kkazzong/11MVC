package com.model2.mvc.web.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("kakao/*")
public class KakaoController {

	public KakaoController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="kakaologin")
	public String kakaoLogin(@RequestParam("code") String code) throws Exception {
		System.out.println("카카오 로그인 code : "+code);
		return "/user/kakaologin.jsp";
	}

}
