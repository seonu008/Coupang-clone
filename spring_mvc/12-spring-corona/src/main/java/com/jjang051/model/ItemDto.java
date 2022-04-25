package com.jjang051.model;

import lombok.Data;

@Data
public class ItemDto {
	private int no;
	private String imgUrl;
	private String title;
	private String price;
	private String shipping;
	private String rating;
	private String imgDetailUrl;
}
