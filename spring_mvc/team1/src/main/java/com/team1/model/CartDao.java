package com.team1.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CartDao {
	
	@Autowired
	public SqlSessionFactory sqlSessionFactory;
//	
//	public int insertItem(ItemDto itemDto) {
//		int result = 0;
//		SqlSession sqlSession = sqlSessionFactory.openSession();
//		result = sqlSession.insert("insertItem",itemDto);
//		sqlSession.commit();
//		sqlSession.close();
//		return result;
//	}
//	
//	
//	public List<ItemDto> getAllItemList() {
//		List<ItemDto> itemList = null;
//		SqlSession sqlSession = sqlSessionFactory.openSession();
//		itemList = sqlSession.selectList("getAllItemList");
//		sqlSession.close();
//		return itemList;
//	}

	
	public List<CartDto> getCartList(CartDto dto) {
		System.out.println(dto);
		if(dto.getUserId() != null && !"".equals(dto.getUserId())) {
			List<CartDto> cartList = null;
			SqlSession sqlSession = sqlSessionFactory.openSession();
			cartList = sqlSession.selectList("selectCartList", dto);
			sqlSession.close();
			return cartList;
		} else {
			return null;
		}
	}
}







