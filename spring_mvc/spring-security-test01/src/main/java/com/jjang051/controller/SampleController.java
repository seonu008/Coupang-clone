package com.jjang051.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sample/*")
@Controller
public class SampleController {
	@GetMapping("/all")
	public void doAll() {
		System.out.println("/all");
	}

	@GetMapping("/member")
	public void doMember() {
		System.out.println("/member");
	}


}
