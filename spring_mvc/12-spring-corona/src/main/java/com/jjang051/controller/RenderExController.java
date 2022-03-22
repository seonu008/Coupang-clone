package com.jjang051.controller;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jjang051.model.ItemDao;
import com.jjang051.model.ItemDto;
import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;

@Controller
public class RenderExController {
	
	@RequestMapping(value="/RenderEx.do", method=RequestMethod.GET)
	public String renderEx() {
		return "renderEx";
	}
}
