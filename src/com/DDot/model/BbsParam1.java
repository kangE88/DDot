package com.DDot.model;

import java.io.Serializable;

public class BbsParam1 implements Serializable {

	private int seq;
	private String nickname;
	private String title;
	private String content;
	private String wdate;
	
	private String category;
	private String subcategory;
	
	private int del;
	private int readcount;
	
	// search
	private String s_category;
	private String s_keyword;
	
	// paging
	private int recordCountPerPagec=10;
	private int pageNumberc=0;
	
	private int start=1;
	private int end=10;
	
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
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getS_category() {
		return s_category;
	}
	public void setS_category(String s_category) {
		this.s_category = s_category;
	}
	public String getS_keyword() {
		return s_keyword;
	}
	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}
	public int getRecordCountPerPagec() {
		return recordCountPerPagec;
	}
	public void setRecordCountPerPagec(int recordCountPerPagec) {
		this.recordCountPerPagec = recordCountPerPagec;
	}
	public int getPageNumberc() {
		return pageNumberc;
	}
	public void setPageNumberc(int pageNumberc) {
		this.pageNumberc = pageNumberc;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "BbsParam [seq=" + seq + ", nickname=" + nickname + ", title=" + title + ", content=" + content
				+ ", wdate=" + wdate + ", category=" + category + ", subcategory=" + subcategory + ", del=" + del
				+ ", readcount=" + readcount + ", s_category=" + s_category + ", s_keyword=" + s_keyword
				+ ", recordCountPerPage=" + recordCountPerPagec + ", pageNumber=" + pageNumberc + ", start=" + start
				+ ", end=" + end + "]";
	}
	
	
		
}






