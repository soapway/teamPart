package com.team.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class CalendarVO {
	
	private String title;
	private Date start;
	private Date end;
	private String textColor; 
	private String color;
	private String url;
	
}
