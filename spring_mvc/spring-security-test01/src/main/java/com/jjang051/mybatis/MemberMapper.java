package com.jjang051.mybatis;

import com.jjang051.model.MemberDto;

public interface MemberMapper {
	public MemberDto read(String id);
}
