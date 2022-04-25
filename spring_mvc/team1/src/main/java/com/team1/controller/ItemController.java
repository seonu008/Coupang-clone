package com.team1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.model.ItemDao;
import com.team1.model.ItemDto;
import com.team1.model.SearchService;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Autowired
	ItemDto itemDto;
	
	@Autowired
	SearchService searchDao;
	
	@Autowired
	ItemDao itemDao;
	
	@RequestMapping(value = "/SearchPage.do", method = RequestMethod.GET)
	public String SearchPage(HttpServletRequest request, ModelMap model) {
		System.out.println(request.getParameter("query"));
		model.addAttribute("query", request.getParameter("query"));
		return "searchPage";
	}
	
	@ResponseBody
	@RequestMapping(value="/SearchProcess.do", method=RequestMethod.GET)
	public Map<String,List<ItemDto>> SearchPage(HttpServletRequest request) {
		Map<String,List<ItemDto>> hashMap = new HashMap<>();
		String search_select_ = request.getParameter("search_select");
		String search_word_ = request.getParameter("search_word");
		
		String search_select = "title";
		if(search_select_ != null) search_select = search_select_;
		
		String search_word = "";
		if(search_word_ != null) search_word = search_word_;
		
		List<ItemDto> searchList = searchDao.getSearchAllList(search_select, search_word);
		hashMap.put("searchList",searchList);
		
		return hashMap;
	} 

	
	@ResponseBody
	@RequestMapping("/Items.do")
	public Map<String,List<ItemDto>> jsonList() {
		//System.out.println("items controller start");
		Map<String,List<ItemDto>> hashMap = new HashMap<>();
		List<ItemDto> itemList = itemDao.getAllItemList();
		hashMap.put("itemList",itemList);
		return hashMap;
	}

}
