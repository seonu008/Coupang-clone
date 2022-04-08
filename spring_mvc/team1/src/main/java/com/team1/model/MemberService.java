package com.team1.model;

import java.util.List;

import org.springframework.stereotype.Component;




public interface MemberService {
	public List<MemberDto> getAllMemberList(int start, int end, String search_select, String search_word);
	public MemberDto getSelectOne(String id);
	public MemberDto getLoggedMember(MemberDto memberDto);
	public int deleteMember(MemberDto memberDto);
	public int insertMember(MemberDto memberDto);
	public int updateMember(MemberDto memberDto);
	public int idCheck(String id);
	public int getTotal(String search_select, String search_word);
}
