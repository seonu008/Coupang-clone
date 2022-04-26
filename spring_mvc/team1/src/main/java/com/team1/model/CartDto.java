package com.team1.model;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Component
@NoArgsConstructor
public class CartDto {
	private String userId;
	private int itemNo;
	private int itemAmount;
	private int price;
	private String shipping;
	private Date regDt;
	private Date modDt;
	private String[] itemArr;
	
	// item dto

	private int no;
	private String imgUrl;
	private String title;
	private String rating;
	private String imgDetailUrl;
}
