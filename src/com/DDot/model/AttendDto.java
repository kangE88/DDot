package com.DDot.model;

import java.io.Serializable;

public class AttendDto implements Serializable {

	public AttendDto() {
		// TODO Auto-generated constructor stub
	}
	
	String nickname;
	String table;
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTable() {
		return table;
	}
	public void setTable(String table) {
		this.table = table;
	}
	
	
}
