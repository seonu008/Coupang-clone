package com.team1.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("home controller 호출");
		return "index";
	}

	@RequestMapping(value = "/Detail.do", method = RequestMethod.GET)
	public String renderDetail(Model model, HttpServletRequest req) throws Exception {
		String no = req.getParameter("no");
		System.out.println(no);

		model.addAttribute("no", no);
		return "detail";
	}

	@RequestMapping(value = "/SearchPage.do", method = RequestMethod.GET)
	public String SearchPage() {
		return "searchPage";
	}

	@GetMapping("/CustomLogout")
	public String customLogout(HttpSession session, HttpServletResponse response) throws Exception {
		session.invalidate();
		return "customLogout";
	}

}
