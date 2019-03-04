package com.etc.entity;

public class Areas {
	private int ar_id;
	private String ar_name;
	public int getAr_id() {
		return ar_id;
	}
	public void setAr_id(int ar_id) {
		this.ar_id = ar_id;
	}
	public String getAr_name() {
		return ar_name;
	}
	public void setAr_name(String ar_name) {
		this.ar_name = ar_name;
	}
	public Areas(int ar_id, String ar_name) {
		super();
		this.ar_id = ar_id;
		this.ar_name = ar_name;
	}
	@Override
	public String toString() {
		return "Areas [ar_id=" + ar_id + ", ar_name=" + ar_name + "]";
	}
	
	
}
