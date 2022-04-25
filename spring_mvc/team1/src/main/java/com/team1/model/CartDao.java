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

	public int selectCountCart(CartDto dto) {
		System.out.println(dto);
		SqlSession sqlSession = null;
		if (dto.getUserId() != null && !"".equals(dto.getUserId())) {
			try {
				sqlSession = sqlSessionFactory.openSession();
				int result = (Integer) sqlSession.selectOne("selectCountCart", dto);
				sqlSession.close();
				return result;

			} catch (Exception e) {
				System.out.println("selectCountCart 에러발생");
				e.printStackTrace();
				return -1;
			} finally {
				sqlSession.close();
			}
		}
		return 0;
	}

	public boolean insertCart(CartDto dto) {
		System.out.println(dto);
		SqlSession sqlSession = null;
		if (dto.getUserId() != null && !"".equals(dto.getUserId())) {
			// 중복인지 체크
			int cnt = selectCountCart(dto);
			if (cnt > 0) {
				// 중복시 수량 업데이트
				return updateCart(dto);
			} else if (cnt == 0) {
				// 중복이 아니면 insert 시작

				// insert
				try {
					sqlSession = sqlSessionFactory.openSession();
					sqlSession.insert("insertCart", dto);
					sqlSession.close();
					return true;
				} catch (Exception e) {
					System.out.println("insertCart 에러발생");
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return false;
			} else {
				return false;
			}

		}
		return false;
	}

	public boolean updateCart(CartDto dto) {
		System.out.println(dto);
		SqlSession sqlSession = null;
		if (dto.getUserId() != null && !"".equals(dto.getUserId())) {
			try {
				sqlSession = sqlSessionFactory.openSession();
				sqlSession.update("updateCart", dto);
				sqlSession.close();
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

	public boolean deleteCart(CartDto dto) {
		System.out.println(dto);
		SqlSession sqlSession = null;
		if (dto.getUserId() != null && !"".equals(dto.getUserId())) {
			try {
				sqlSession = sqlSessionFactory.openSession();
				sqlSession.delete("deleteCart", dto);
				sqlSession.close();
				return true;
			} catch (Exception e) {
				System.out.println("deleteCart 에러발생");
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
		if (dto.getUserId() != null && !"".equals(dto.getUserId())) {
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
