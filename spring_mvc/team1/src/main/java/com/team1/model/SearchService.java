package com.team1.model;

import java.util.List;

public interface SearchService {

	public List<ItemDto> getSearchAllList(String search_select, String search_word);

	public ItemDto getSelectOne(int no);

	public int getTotal(String search_select, String search_word);



}
