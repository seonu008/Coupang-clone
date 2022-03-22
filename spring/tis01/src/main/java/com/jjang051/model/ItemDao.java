package com.jjang051.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ItemDao {
	
	@Autowired
	public SqlSessionFactory sqlSessionFactory;
	
	public int insertItem(ItemDto itemDto) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertItem",itemDto);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	
	public List<ItemDto> getAllItemList() {
		List<ItemDto> itemList = null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		itemList = sqlSession.selectList("getAllItemList");
		sqlSession.close();
		return itemList;
	}
	
}







