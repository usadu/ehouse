package com.etc.entity;

public class Units {
	private int un_id;
	private String un_name;
	private String un_photo;
	
	public int getUn_id() {
		return un_id;
	}
	public void setUn_id(int un_id) {
		this.un_id = un_id;
	}
	public String getUn_photo() {
		return un_photo;
	}
	public void setUn_photo(String un_photo) {
		this.un_photo = un_photo;
	}
	public String getUn_name() {
		return un_name;
	}
	public Units(int un_id, String un_name, String un_photo) {
		super();
		this.un_id = un_id;
		this.un_name = un_name;
		this.un_photo = un_photo;
	}
	public void setUn_name(String un_name) {
		this.un_name = un_name;
	}
	public Units(int un_id, String un_name) {
		super();
		this.un_id = un_id;
		this.un_name = un_name;
	}
	@Override
	public String toString() {
		return "Units [un_id=" + un_id + ", un_name=" + un_name + "]";
	}
	
	
}
