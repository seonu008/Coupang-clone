package com.team1.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team1.model.MemberDto;
import com.team1.model.MemberService;



@Controller
@RequestMapping("/join")
public class JoinController {
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberService memberDao; 
	
	@GetMapping("/Join.do")
	public String join() {
		return "member/join";
	}
	
	@PostMapping("/JoinProcess.do")
	public void joinProcess(MemberDto memberDto,HttpServletRequest request, HttpServletResponse response,MultipartFile multipartFile) throws Exception {
		
		//file데이터
		memberDto.setPassword(passwordEncoder.encode(memberDto.getPassword()));
		int result = memberDao.insertMember(memberDto);
		System.out.println("memberDto :"+memberDto);
		System.out.println("joinprocess insert :"+result);
		return;
	}
	@ResponseBody    
	@PostMapping("/IDCheck.do")
	public Map<String, Object> idCheck(String id) {
		Map<String,Object> idMap = new HashMap<>();
		int result = memberDao.idCheck(id);
		idMap.put("count", result);
		return idMap;
	}
	
}
