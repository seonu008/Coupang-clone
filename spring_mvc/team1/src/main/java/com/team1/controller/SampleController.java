package com.team1.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.model.AuthDto;
import com.team1.model.CustomUser;
import com.team1.mybatis.MemberMapper;

import lombok.Setter;

@RequestMapping("/sample/*")
@Controller
public class SampleController {
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;
	
	@GetMapping("/all")
	public void doAll() {
		System.out.println("/all");
	}

	@GetMapping("/member")
	public void doMember(Principal principal, Model model) {
	    System.out.println("현재 로그인 id: "+principal.getName());
	    System.out.println("현재 로그인 한 사람 정보"+ this.memberMapper.read(principal.getName()));
		System.out.println("/member");
		
		model.addAttribute("memberDto", this.memberMapper.read(principal.getName()));
		
		String memberInfo = this.memberMapper.read(principal.getName()).toString();
	}


}
