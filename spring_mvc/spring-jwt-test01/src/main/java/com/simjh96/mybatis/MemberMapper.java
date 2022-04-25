package com.simjh96.mybatis;

import com.simjh96.model.MemberDto;

public interface MemberMapper {
	public MemberDto read(String id);
}
