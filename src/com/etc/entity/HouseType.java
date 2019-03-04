package com.etc.entity;

public class HouseType {
	private int ht_id;
	private String ht_name;
	public int getHt_id() {
		return ht_id;
	}
	public void setHt_id(int ht_id) {
		this.ht_id = ht_id;
	}
	public String getHt_name() {
		return ht_name;
	}
	public void setHt_name(String ht_name) {
		this.ht_name = ht_name;
	}
	public HouseType(int ht_id, String ht_name) {
		super();
		this.ht_id = ht_id;
		this.ht_name = ht_name;
	}
	@Override
	public String toString() {
		return "HouseType [ht_id=" + ht_id + ", ht_name=" + ht_name + "]";
	}
	
	
}
