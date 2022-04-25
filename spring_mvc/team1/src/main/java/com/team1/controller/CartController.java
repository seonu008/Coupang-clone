package com.team1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.model.CartDao;
import com.team1.model.CartDto;
import com.team1.model.ItemDto;

@Controller
public class CartController {

	@Autowired
	private CartDao cartDao;
	@Autowired
	ItemDto itemDto;

	@GetMapping("/cartItems.do")
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

	/**
	 *
	 * Test Url
	 * /insertCartItem.do?userId=test01&itemNo=6&itemAmount=8&price=3000&shipping=1
	 * 
	 * @param String userId
	 * @param int    itemNo
	 * @param int    itemAmount
	 * @param int    price
	 * @param int    shipping
	 * @return boolean
	 */
	@RequestMapping("/insertCartItem.do")
	@ResponseBody
	public String insertItem(CartDto vo) {
		System.out.println("vo==="+vo);
		boolean result = cartDao.insertCart(vo);
		if(result) {
			return "ok";
		} else {
			return "fail";
		}
		 
	}

	@RequestMapping("/updateCartItem.do")
	@ResponseBody
	public boolean updateItem(CartDto vo) {
		return cartDao.updateCart(vo);
	}

	@RequestMapping("/deleteCartItem.do")
	@ResponseBody
	public boolean deleteItem(CartDto vo) {
		return cartDao.deleteCart(vo);
	}

	@RequestMapping(value = "/CartEx.do", method = RequestMethod.GET)
	public String renderEx() {
		return "cartEx";
	}

}