package com.yoojung0318.Dailygram.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("/user/signup/view")
	public String singupView() {
		return "user/signup";			
	}
	
	@GetMapping("/user/signin/view")
	public String signinView() {
		return "user/signin";
	}
}