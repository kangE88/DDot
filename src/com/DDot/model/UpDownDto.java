package com.DDot.model;

import java.io.Serializable;

/*
		CREATE TABLE DDOTUPDOWN(
		BBS_SEQ NUMBER(8),
		COMM_SEQ NUMBER(8),
		NICKNAME VARCHAR2(50) NOT NULL,
		UPDOWN NUMBER(2) NOT NULL	--안눌렀을때 0 눌렀을때 1
	);
*/
public class UpDownDto implements Serializable {
	private int bbs_seq;
	private int comm_seq;
	private String nickname;
	private int updown;
		
	public UpDownDto() {
		super();
	}

	public int getBbs_seq() {
		return bbs_seq;
	}

	public void setBbs_seq(int bbs_seq) {
		this.bbs_seq = bbs_seq;
	}

	public int getComm_seq() {
		return comm_seq;
	}

	public void setComm_seq(int comm_seq) {
		this.comm_seq = comm_seq;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getUpdown() {
		return updown;
	}

	public void setUpdown(int updown) {
		this.updown = updown;
	}

	@Override
	public String toString() {
		return "UpDownDto [bbs_seq=" + bbs_seq + ", comm_seq=" + comm_seq + ", nickname=" + nickname + ", updown="
				+ updown + "]";
	}

	

	
	
	
	
}
