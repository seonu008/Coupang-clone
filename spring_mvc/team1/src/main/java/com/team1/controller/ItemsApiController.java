package com.team1.controller;

import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.model.ItemDao;
import com.team1.model.ItemDto;

@Controller
public class ItemsApiController {
	@Autowired
	ItemDao itemDao;
	
	@ResponseBody
	@RequestMapping("/Items.do")
	public Map<String,List<ItemDto>> jsonList() {
		System.out.println("items controller start");
		Map<String,List<ItemDto>> hashMap = new HashMap<>();
		List<ItemDto> itemList = itemDao.getAllItemList();
		hashMap.put("itemList",itemList);
		return hashMap;
	}
}













