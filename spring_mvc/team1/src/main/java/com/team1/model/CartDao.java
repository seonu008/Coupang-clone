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

	
	public boolean updateCart(CartDto dto) {
		System.out.println(dto);
		SqlSession sqlSession = null;
		if(dto.getUserId() != null && !"".equals(dto.getUserId())) {
			try {
				sqlSession = sqlSessionFactory.openSession();
				sqlSession.selectList("updateCart", dto);
				return true;
			} catch (Exception e) {
				System.out.println("updateCart 에러발생");
				e.printStackTrace();
				return false;
			} finally {
				sqlSession.close();
			}
		}
		return false;
	}


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







