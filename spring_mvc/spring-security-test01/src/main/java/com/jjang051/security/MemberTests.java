package com.jjang051.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {
	com.jjang051.config.RootAppContext.class, com.jjang051.config.SecurityConfig.class
})
public class MemberTests {
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	@Test
	public void testInsertMember() {
		System.out.println("testInsertMember");
		String sql = "insert into COUPANGUSER VALUES (SEQ_COUPANGUSER.nextval, ?, ?, '1', '홍길동', '010-1234-5678', NULL, NULL, NULL)";
		for (int i = 0; i < 3; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(2, pwencoder.encode("pw"+i));
				pstmt.setString(1, "test"+i);
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) {try {pstmt.close();}catch(Exception e) {}}
				if (con != null) {try {con.close();}catch(Exception e) {}}
			}
			
		}
	}
	

}
