package com.jjang051.model;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//VO, DTO, BEAN
@Setter
@Getter
@ToString
@Component
public class MemberDto {
	private int no;
	private String id;
	private String password;

	
}
