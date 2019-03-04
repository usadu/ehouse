package com.etc.entity;

public class Users {
	private int u_id;
	private String u_nickname;
	private String u_pwd;
	private String u_name;
	private String u_idcard;
	private String u_phone;
	private String u_paypwd;
	private String u_bankcard;
	
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_idcard() {
		return u_idcard;
	}
	public void setU_idcard(String u_idcard) {
		this.u_idcard = u_idcard;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getU_paypwd() {
		return u_paypwd;
	}
	public void setU_paypwd(String u_paypwd) {
		this.u_paypwd = u_paypwd;
	}
	public String getU_bankcard() {
		return u_bankcard;
	}
	public void setU_bankcard(String u_bankcard) {
		this.u_bankcard = u_bankcard;
	}
	public Users(int u_id, String u_nickname, String u_pwd, String u_name, String u_idcard, String u_phone,
			String u_paypwd, String u_bankcard) {
		super();
		this.u_id = u_id;
		this.u_nickname = u_nickname;
		this.u_pwd = u_pwd;
		this.u_name = u_name;
		this.u_idcard = u_idcard;
		this.u_phone = u_phone;
		this.u_paypwd = u_paypwd;
		this.u_bankcard = u_bankcard;
	}
	
	public Users(String u_nickname, String u_pwd, String u_phone) {
		super();
		this.u_nickname = u_nickname;
		this.u_pwd = u_pwd;
		this.u_phone = u_phone;
	}
	public Users(String u_nickname, String u_pwd, String u_name, String u_idcard, String u_phone, String u_paypwd,
			String u_bankcard) {
		super();
		this.u_nickname = u_nickname;
		this.u_pwd = u_pwd;
		this.u_name = u_name;
		this.u_idcard = u_idcard;
		this.u_phone = u_phone;
		this.u_paypwd = u_paypwd;
		this.u_bankcard = u_bankcard;
	}
	
	public Users(int u_id, String u_nickname, String u_pwd, String u_name, String u_idcard, String u_phone,
			String u_bankcard) {
		super();
		this.u_id = u_id;
		this.u_nickname = u_nickname;
		this.u_pwd = u_pwd;
		this.u_name = u_name;
		this.u_idcard = u_idcard;
		this.u_phone = u_phone;
		this.u_bankcard = u_bankcard;
	}
	public Users(String u_nickname, String u_pwd) {
		super();
		this.u_nickname = u_nickname;
		this.u_pwd = u_pwd;
	}
	
	public Users() {
		super();
	}
	@Override
	public String toString() {
		return "Users [u_id=" + u_id + ", u_nickname=" + u_nickname + ", u_pwd=" + u_pwd + ", u_name=" + u_name
				+ ", u_idcard=" + u_idcard + ", u_phone=" + u_phone + ", u_bankcard=" + u_bankcard + "]";
	}
	
	
		
	
}
