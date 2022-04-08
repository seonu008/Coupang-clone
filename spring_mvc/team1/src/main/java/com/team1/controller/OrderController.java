package com.team1.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.mybatis.MemberMapper;

import lombok.Setter;

@Controller
public class OrderController {
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;
	@RequestMapping(value="/OrderPage.do", method=RequestMethod.GET)
	public String OrderPage(Principal principal, Model model) {
	    System.out.println("현재 로그인 id: "+principal.getName());
	    System.out.println("현재 로그인 한 사람 정보"+ this.memberMapper.read(principal.getName()));
		System.out.println("/member");
		
		model.addAttribute("memberDto", this.memberMapper.read(principal.getName()));
		
		String memberInfo = this.memberMapper.read(principal.getName()).toString();
		return "orderPage";
	} 
}
