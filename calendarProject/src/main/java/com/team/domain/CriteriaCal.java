package com.team.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CriteriaCal {
	
	private String startTime;
	private String endTime;
	
	private String userId;
	
	public CriteriaCal(String startTime, String endTime, String userId) {
		this.startTime = startTime;
		this.endTime = endTime;
		this.userId = userId;
	}
	
	
}
