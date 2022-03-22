package com.jjang051.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Component
public class ItemDto {
	private int no;
	private String imgUrl;
	private String title;
	private String price;
	private String shipping;
	private String rating;
	private String imgDetailUrl;
}
