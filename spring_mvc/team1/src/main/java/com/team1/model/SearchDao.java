package com.team1.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SearchDao implements SearchService{

	@Autowired
	public SqlSessionFactory sqlSessionFactory;

	@Override
	public List<ItemDto> getSearchAllList( String search_select, String search_word) {
		HashMap<String,Object> pageMap = new HashMap<>();
		pageMap.put("searchSelect", search_select);
		pageMap.put("searchWord", search_word);
		
		List<ItemDto> searchList = null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		searchList = sqlSession.selectList("getSearchAllList", pageMap);
		sqlSession.close();
		return searchList;
	}

	@Override
	public ItemDto getSelectOne(int no) {
		return null;
	}
	
	@Override
	public int getTotal(String search_select, String search_word) {
		return 0;
	}

//	@Override
//	public ReplyBoardDto getSelectOne(int no) {
//		SqlSession sqlSession = sqlSessionFactory.openSession();
//		ReplyBoardDto replyBoardDto = sqlSession.selectOne("getSelectOne",no);
//		sqlSession.close();
//		return replyBoardDto;
//	}

//	@Override
//	public int getTotal(String search_select, String search_word) {
//		HashMap<String,Object> searchMap = new HashMap<>();
//		searchMap.put("searchSelect",search_select);
//		searchMap.put("searchWord",search_word);
//		SqlSession sqlSession = sqlSessionFactory.openSession();
//		int total = sqlSession.selectOne("getTotal",searchMap);
//		sqlSession.close();
//		return total;
//	}


}
