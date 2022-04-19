package com.team1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.model.CartDao;
import com.team1.model.CartDto;

@Controller
public class CartController {

	@Autowired
	private CartDao cartDao;

	@RequestMapping("/cartItems.do")
	@ResponseBody
	public Map<String, List<CartDto>> getItem(CartDto vo) {
		
		// 유저아이디가 없을 경우 test01 강제로 집어넣어서 처리
		if (vo.getUserId() == null || vo.getUserId().equals("")) {
			vo.setUserId("test01");
		}
		Map<String, List<CartDto>> cartList = new HashMap<String, List<CartDto>>();
		List<CartDto> result = cartDao.getCartList(vo);
		cartList.put("cartList", result);
		return cartList;
		
	}
	
	
	@RequestMapping(value="/CartEx.do", method=RequestMethod.GET)
	public String renderEx() {
		return "cartEx";
	}
	
	
	
}
