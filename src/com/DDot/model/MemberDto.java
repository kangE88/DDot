package com.DDot.model;

import java.io.Serializable;

/*
CREATE TABLE DDOTMEMBER(
	SEQ NUMBER(8) PRIMARY KEY,
	ID VARCHAR2(50) NOT NULL,
	PWD VARCHAR2(50) NOT NULL,
	EMAIL VARCHAR2(50) NOT NULL,
	POINT NUMBER(8) NOT NULL,
	NICKNAME VARCHAR2(50) UNIQUE,
	PIC VARCHAR2(50) NOT NULL,
	INTRO VARCHAR2(50) NOT NULL,
	AUTH NUMBER(2)
);
*/

public class MemberDto implements Serializable {
	private int seq;		//  seq
	private String id;		//	id
	private String pwd;		//	pwd
	private String email;	//	email
	private int point;		//	point
	private String nickname;//	nickname
	private String pic;		//	이미지파일이름
	private String intro;	//	소개
	private int auth;		//	구분자
	
	public MemberDto() {}

	public MemberDto(int seq, String id, String pwd, String email, int point, String nickname, String pic, String intro,
			int auth) {
		super();
		this.seq = seq;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.point = point;
		this.nickname = nickname;
		this.pic = pic;
		this.intro = intro;
		this.auth = auth;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberDto [seq=" + seq + ", id=" + id + ", pwd=" + pwd + ", email=" + email + ", point=" + point
				+ ", nickname=" + nickname + ", pic=" + pic + ", intro=" + intro + ", auth=" + auth + "]";
	}
	
	
	
	
}
