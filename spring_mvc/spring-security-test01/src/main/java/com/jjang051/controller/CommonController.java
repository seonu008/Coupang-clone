package com.jjang051.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {
	@Autowired
	PasswordEncoder pwEncoder;
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		System.out.println("customLogin");
		System.out.println(pwEncoder.encode("member"));
	
	}
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		System.out.println("customLogout");
	}
	
	

}
