package com.movie.mymovie.dto;

public class UserDto {

	private String member_id;
	private String member_nick;
	private String member_pwd;
	private String member_email;
	private String member_email2;
	private String member_pic;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_email2() {
		return member_email2;
	}

	public void setMember_email2(String member_email2) {
		this.member_email2 = member_email2;
	}

	public String getMember_pic() {
		return member_pic;
	}

	public void setMember_pic(String member_pic) {
		this.member_pic = member_pic;
	}

	@Override
	public String toString() {
		return "UserDto [member_id=" + member_id + ", member_nick=" + member_nick + ", member_pwd=" + member_pwd
				+ ", member_email=" + member_email + ", member_email2=" + member_email2 + ", member_pic=" + member_pic
				+ "]";
	}
}
