package com.DDot.model;

import java.io.Serializable;

/*
CREATE TABLE DDOTMESSAGE(
	SEQ NUMBER(8) PRIMARY KEY,
	NICKNAME VARCHAR2(50) NOT NULL,
	SENDTO VARCHAR2(50) NOT NULL,
	CONTENT VARCHAR2(1000) NOT NULL,
	WDATE DATE NOT NULL,
	READ NUMBER(2)      // 0 = 읽지않음 1 = 읽음
);
*/

public class MessageDto implements Serializable {
	
	private int seq;
	private String nickname;
	private String sendto;
	private String content;
	private String wdate;
	private int read;
	public MessageDto() {
		super();
	}
	public MessageDto(int seq, String nickname, String sendto, String content, String wdate, int read) {
		super();
		this.seq = seq;
		this.nickname = nickname;
		this.sendto = sendto;
		this.content = content;
		this.wdate = wdate;
		this.read = read;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSendto() {
		return sendto;
	}
	public void setSendto(String sendto) {
		this.sendto = sendto;
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
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	@Override
	public String toString() {
		return "MessageDto [seq=" + seq + ", nickname=" + nickname + ", sendto=" + sendto + ", content=" + content
				+ ", wdate=" + wdate + ", read=" + read + "]";
	}
	
	
	
	
}
