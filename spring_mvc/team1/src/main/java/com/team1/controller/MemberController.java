package com.team1.controller;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team1.model.MemberDto;
import com.team1.model.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	private MemberDto memberDto;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberService memberDao; 
	
	@GetMapping("/List.do")
	public String list(HttpServletRequest request,Model model) {
		List<MemberDto> memberList = memberDao.getAllMemberList(1, 5, null, null);
		model.addAttribute("memberList",memberList);
		return "member/list";
	}
	
	@GetMapping("/LogOut.do")
	public void logout(HttpSession session,HttpServletResponse response) throws Exception {
		String loggedName =  (String)session.getAttribute("loggedName");
		
		session.invalidate();
	}
	
	@GetMapping("/Update.do")
	public String update() {
		return "member/update";
	}
	
	@PostMapping("/UpdateProcess.do")
	public void updateProcess(MemberDto memberDto,HttpServletRequest request,  HttpServletResponse response,MultipartFile multipartFile, HttpSession session) throws Exception {
		
//		memberDto.setPhone(memberDto.getPhoneFirst()+"-"+memberDto.getPhoneMiddle()+"-"+memberDto.getPhoneLast());
//		memberDto.setAddress(memberDto.getAddress01()+" "+memberDto.getAddress02());
		int result = memberDao.updateMember(memberDto);

	}
	
	
	@GetMapping("/Delete.do")
	public String delete() {
		return "member/delete";
	}
	
	@PostMapping("/DeleteProcess.do")
	public void deleteProcess(MemberDto memberDto,HttpServletResponse response) throws Exception {
		int result = memberDao.deleteMember(memberDto);
	}
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
	
	@GetMapping("/Info.do")
	public String info(String id,Model model) {
		memberDto = memberDao.getSelectOne(id);
		model.addAttribute("memberDto",memberDto);
		return "member/info";
	}
	
	@PostMapping("/LoginProcess.do")
	public void loginProcess(MemberDto memberDto,HttpServletResponse response, HttpSession session) throws Exception {
		memberDto = memberDao.getLoggedMember(memberDto);
		if(memberDto!=null) {
			session.setAttribute("loggedMember", memberDto);
			session.setAttribute("loggedId", memberDto.getId());
			session.setAttribute("loggedName", memberDto.getName());
		} 
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