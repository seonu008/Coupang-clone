package com.team1.controller;

import java.io.File;
import java.io.InputStream;
import java.security.Principal;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team1.model.CartDao;
import com.team1.model.CartDto;
import com.team1.model.ItemDao;
import com.team1.model.ItemDto;
import com.team1.model.MemberDto;
import com.team1.model.MemberService;
import com.team1.mybatis.MemberMapper;

import lombok.Setter;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberDao;

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper memberMapper;

	@Autowired
	CartDao cartDao;
	
	@Autowired
	ItemDao itemDao;
	
	@GetMapping("/List.do")
	public String list(HttpServletRequest request, Model model) {
		List<MemberDto> memberList = memberDao.getAllMemberList(1, 5, null, null);
		model.addAttribute("memberList", memberList);
		return "member/list";
	}

	@RequestMapping(value = "/OrderPage.do", method = RequestMethod.GET)
	public String OrderPage(CartDto vo, Principal principal, Model model, HttpServletRequest req) {

		model.addAttribute("memberDto", this.memberMapper.read(principal.getName()));

		
		ItemDto itemDto = itemDao.getItemByNo(req.getParameter("no"));
		
		List<CartDto> cartDto = cartDao.getCartList(vo);
		
		model.addAttribute("key",itemDto);
		model.addAttribute("Ckey",cartDto);
		System.out.print(cartDto);
		
		return "orderPage";
	}

//	@GetMapping("/Info.do")
//	public String info(String id,Model model) {
//		memberDto = memberDao.getSelectOne(id);
//		model.addAttribute("memberDto",memberDto);
//		return "member/info";
//	}
//	
//	@PostMapping("/LoginProcess.do")
//	public void loginProcess(MemberDto memberDto,HttpServletResponse response, HttpSession session) throws Exception {
//		memberDto = memberDao.getLoggedMember(memberDto);
//		if(memberDto!=null) {
//			session.setAttribute("loggedMember", memberDto);
//			session.setAttribute("loggedId", memberDto.getId());
//			session.setAttribute("loggedName", memberDto.getName());
//		} 
//	}
//
//	@GetMapping("/Update.do")
//	public String update() {
//		return "member/update";
//	}
//	
//	@PostMapping("/UpdateProcess.do")
//	public void updateProcess(MemberDto memberDto,HttpServletRequest request,  HttpServletResponse response,MultipartFile multipartFile, HttpSession session) throws Exception {
//		
////		memberDto.setPhone(memberDto.getPhoneFirst()+"-"+memberDto.getPhoneMiddle()+"-"+memberDto.getPhoneLast());
////		memberDto.setAddress(memberDto.getAddress01()+" "+memberDto.getAddress02());
//		int result = memberDao.updateMember(memberDto);
//
//	}
//	
//	
//	@GetMapping("/Delete.do")
//	public String delete() {
//		return "member/delete";
//	}
//	
//	@PostMapping("/DeleteProcess.do")
//	public void deleteProcess(MemberDto memberDto,HttpServletResponse response) throws Exception {
//		int result = memberDao.deleteMember(memberDto);
//	}

}