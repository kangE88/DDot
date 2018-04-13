package com.DDot.model;

import java.io.Serializable;

public class ChatVo implements Serializable {
	public String nickname;
	public boolean isFisrt;
	public String message;
	
	@Override
	public String toString() {
		return "MessageVo [nickname=" + nickname + ", isFisrt=" + isFisrt + ", message=" + message + "]";
	}
	
	
}
