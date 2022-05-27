package com.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class DiaryVO {
	
	private String user_id;
	private Long no;
	private String title;
	private String content;
	private String textColor;
	private String color;
	private Date reg_date;

}
