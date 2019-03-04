package com.etc.entity;

public class HouseState {
	private int hs_id;
	private String hs_name;
	public int getHs_id() {
		return hs_id;
	}
	public void setHs_id(int hs_id) {
		this.hs_id = hs_id;
	}
	public String getHs_name() {
		return hs_name;
	}
	public void setHs_name(String hs_name) {
		this.hs_name = hs_name;
	}
	
	public HouseState(String hs_name) {
		super();
		this.hs_name = hs_name;
	}
	public HouseState(int hs_id, String hs_name) {
		super();
		this.hs_id = hs_id;
		this.hs_name = hs_name;
	}
	@Override
	public String toString() {
		return "HouseState [hs_id=" + hs_id + ", hs_name=" + hs_name + "]";
	}
}
