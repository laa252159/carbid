package com.ted.model;

import java.io.Serializable;

public class CommonBid implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private Integer userid;
	
	private Long count;

	public CommonBid(int userid, Long count) {
		this.userid = userid;
		this.count = count;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}
	
	

}
