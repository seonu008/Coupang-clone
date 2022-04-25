package com.team1.mybatis;

import com.team1.model.MemberDto;

public interface MemberMapper {
	public MemberDto read(String id);
}
