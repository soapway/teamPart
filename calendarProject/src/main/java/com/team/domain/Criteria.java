package com.team.domain;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Criteria{
	
	private String userId;
	
	private int pageNum;
	private int amount;

	public Criteria() {
		this(1, 7);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
