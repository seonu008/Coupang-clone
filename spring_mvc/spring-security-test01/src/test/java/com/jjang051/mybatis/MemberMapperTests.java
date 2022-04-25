package com.jjang051.mybatis;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.jjang051.model.MemberDto;

import lombok.Setter;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes= {com.jjang051.config.RootAppContext.class})
public class MemberMapperTests {
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Test
	public void testRead() {
		MemberDto memberDto = mapper.read("test1");
		System.out.println(memberDto);
		memberDto.getAuthList().forEach(authDto -> System.out.println(authDto));
		}
}
