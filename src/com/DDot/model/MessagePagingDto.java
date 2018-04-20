package com.DDot.model;

import java.io.Serializable;

public class MessagePagingDto implements Serializable {

	private int seq;
	private String nickname;
	private String sendto;
	private String content;
	private int nickread;
	private int sendread;
	private int nickdel=2;
	private int senddel=2;
	
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
				+ ", nickread=" + nickread + ", sendread=" + sendread + ", nickdel=" + nickdel + ", senddel=" + senddel
				+ ", recordCountPerPage=" + recordCountPerPage + ", pageNumber=" + pageNumber + ", start=" + start
				+ ", end=" + end + "]";
	}
	
	
	
	
		
}






