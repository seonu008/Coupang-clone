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

import com.team1.model.ItemDao;
import com.team1.model.ItemDto;
import com.team1.model.MemberDto;
import com.team1.model.MemberService;



@Controller
public class HomeController {

	@Autowired
	ItemDao itemDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("home controller 호출");
		return "index";
	}

	@RequestMapping(value = "/Detail.do", method = RequestMethod.GET)
	public String renderDetail(Model model, HttpServletRequest req) throws Exception {

		
		ItemDto itemDto = itemDao.getItemByNo(req.getParameter("no"));
		model.addAttribute("key",itemDto);
		
		
		String no = req.getParameter("no");

		model.addAttribute("no", no);
		return "detail";
	}
	
	@GetMapping("/CustomLogin.do")
	public String loginInput(String error, String logout, Model model) {
		System.out.println("customLogin");
		return "customLogin";
	}	
	
	@GetMapping("/CustomLogout.do")
	public String customLogout(HttpSession session, HttpServletResponse response) throws Exception {
		session.invalidate();
		return "customLogout";
	}
	
}
