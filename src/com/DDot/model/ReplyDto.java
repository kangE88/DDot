package com.DDot.model;

import java.io.Serializable;

/*
CREATE TABLE DDOTREPLY(
	SEQ NUMBER(8) PRIMARY KEY,
	BBS_SEQ NUMBER(8),
	COMM_SEQ NUMBER(8),
	NICKNAME VARCHAR2(50) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	WDATE DATE NOT NULL,
	DEL NUMBER(2)
);
*/

public class ReplyDto implements Serializable {
	private int seq;
	private int bbs_seq;
	private int comm_seq;
	private String nickname;
	private String content;
	private String wdate;
	private int del;
	
	public ReplyDto(){}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
	@Override
	public String toString() {
		return "ReplyDto [seq=" + seq + ", bbs_seq=" + bbs_seq + ", comm_seq=" + comm_seq + ", nickname=" + nickname
				+ ", content=" + content + ", wdate=" + wdate + ", del=" + del + "]";
	}

}
