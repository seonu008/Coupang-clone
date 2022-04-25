package com.team1.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.team1.model.CustomUser;
import com.team1.model.MemberDto;
import com.team1.mybatis.MemberMapper;

import lombok.Setter;

public class CustomUserDetailsService implements UserDetailsService {
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("Load User By UserName : " + username);
		
		MemberDto memberDto = memberMapper.read(username);
		
		System.out.println("Queried by member mapper : " + memberDto);
		
		return memberDto == null ? null: new CustomUser(memberDto);
	}

}
