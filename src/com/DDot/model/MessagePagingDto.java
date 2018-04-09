package com.DDot.model;

import java.io.Serializable;

public class MessagePagingDto implements Serializable {

	private int seq;
	private String nickname;
	private String sendto;
	private String content;
	private String wdate;
	private String read;
	private int del;
	
	// paging
	private int recordCountPerPage=10;
	private int pageNumber=0;
	
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
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
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
		return "MessagePagingDto [seq=" + seq + ", nickname=" + nickname + ", sendto=" + sendto + ", content=" + content
				+ ", wdate=" + wdate + ", read=" + read + ", del=" + del + ", recordCountPerPage=" + recordCountPerPage
				+ ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end + "]";
	}
	
	
	
	
		
}






