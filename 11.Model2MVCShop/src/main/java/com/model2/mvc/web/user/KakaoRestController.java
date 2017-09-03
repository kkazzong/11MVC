package com.model2.mvc.web.user;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("kakao/*")
public class KakaoRestController {

	public KakaoRestController() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping(value="json/kakaologin")
	public String kakaoLogin(@RequestParam("code") String code) throws Exception {
		System.out.println("카카오 로그인 code : "+code);
		return null;
	}
	
}
