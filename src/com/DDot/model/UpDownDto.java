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
	private int bbsseq;
	private int commseq;
	private String nickname;
	private int updown;
	
	public UpDownDto() {
		super();
	}
	
	public UpDownDto(int bbsseq, int commseq, String nickname, int updown) {
		super();
		this.bbsseq = bbsseq;
		this.commseq = commseq;
		this.nickname = nickname;
		this.updown = updown;
	}
	
	public int getBbsseq() {
		return bbsseq;
	}
	public void setBbsseq(int bbsseq) {
		this.bbsseq = bbsseq;
	}
	public int getCommseq() {
		return commseq;
	}
	public void setCommseq(int commseq) {
		this.commseq = commseq;
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
		return "UpDownDto [bbsseq=" + bbsseq + ", commseq=" + commseq + ", nickname=" + nickname + ", updown=" + updown
				+ "]";
	}
	
	
	
	
}
