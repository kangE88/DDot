package com.DDot.model;

import java.io.Serializable;

/*
CREATE TABLE DDOTMESSAGE(
	SEQ NUMBER(8) PRIMARY KEY,
	NICKNAME VARCHAR2(50) NOT NULL,
	SENDTO VARCHAR2(50),
	CONTENT VARCHAR2(1000) NOT NULL,
	WDATE DATE NOT NULL,
	NICKREAD NUMBER(2),
	SENDREAD NUMBER(2),
	NICKDEL NUMBER(2),
	SENDDEL NUMBER(2)
);
*/

public class MessageDto implements Serializable {

	private int seq;
	private String nickname;
	private String sendto;
	private String content;
	private String wdate;
	private int nickread;
	private int sendread;
	private int nickdel;
	private int senddel;

	public MessageDto() {
		super();
	}

	public MessageDto(int seq, String nickname, String sendto, String content, String wdate, int nickread, int sendread,
			int nickdel, int senddel) {
		super();
		this.seq = seq;
		this.nickname = nickname;
		this.sendto = sendto;
		this.content = content;
		this.wdate = wdate;
		this.nickread = nickread;
		this.sendread = sendread;
		this.nickdel = nickdel;
		this.senddel = senddel;
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

	public int getNickread() {
		return nickread;
	}

	public void setNickread(int nickread) {
		this.nickread = nickread;
	}

	public int getSendread() {
		return sendread;
	}

	public void setSendread(int sendread) {
		this.sendread = sendread;
	}

	public int getNickdel() {
		return nickdel;
	}

	public void setNickdel(int nickdel) {
		this.nickdel = nickdel;
	}

	public int getSenddel() {
		return senddel;
	}

	public void setSenddel(int senddel) {
		this.senddel = senddel;
	}

	@Override
	public String toString() {
		return "MessageDto [seq=" + seq + ", nickname=" + nickname + ", sendto=" + sendto + ", content=" + content
				+ ", wdate=" + wdate + ", nickread=" + nickread + ", sendread=" + sendread + ", nickdel=" + nickdel
				+ ", senddel=" + senddel + "]";
	}

	

}
