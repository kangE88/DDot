package com.DDot.model;

import java.io.Serializable;
/*
 		CREATE TABLE DDOTBBS(
		SEQ NUMBER(8) PRIMARY KEY,
		NICKNAME VARCHAR2(50) NOT NULL,
		CATEGORY VARCHAR2(50) NOT NULL,
		SUBCATEGORY VARCHAR2(50) NOT NULL,
		TITLE VARCHAR2(50) NOT NULL,
		CONTENT VARCHAR2(2000) NOT NULL,
		WDATE DATE NOT NULL,
		UP NUMBER(20),
		DOWN NUMBER(20),
		READCOUNT NUMBER(20),
		DEL NUMBER(2)
	);
	*/
public class BbsDto implements Serializable {
	private int seq;
	private String nickname;
	private String category;
	private String subcategory;
	private String title;
	private String content;
	private String wdate;
	private int up;
	private int down;
	private int readcount;
	private int del;
	
	public BbsDto() {
		super();
	}
	public BbsDto(int seq, String nickname, String category, String subcategory, String title, String content,
			String wdate, int up, int down, int readcount, int del) {
		super();
		this.seq = seq;
		this.nickname = nickname;
		this.category = category;
		this.subcategory = subcategory;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.up = up;
		this.down = down;
		this.readcount = readcount;
		this.del = del;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getUp() {
		return up;
	}
	public void setUp(int up) {
		this.up = up;
	}
	public int getDown() {
		return down;
	}
	public void setDown(int down) {
		this.down = down;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	@Override
	public String toString() {
		return "BbsDto [seq=" + seq + ", nickname=" + nickname + ", category=" + category + ", subcategory="
				+ subcategory + ", title=" + title + ", content=" + content + ", wdate=" + wdate + ", up=" + up
				+ ", down=" + down + ", readcount=" + readcount + ", del=" + del + "]";
	}
	
	
	
}
