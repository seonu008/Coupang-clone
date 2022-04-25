package com.jjang051.model;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberDto {
	private String id;
	private String password;
	private String name;
	private String phone;
	private int zipcode;
	private String address;
	private Date regdate;
	private List<AuthDto> authList;
}
