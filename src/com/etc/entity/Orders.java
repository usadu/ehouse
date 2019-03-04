package com.etc.entity;

public class Orders {
	private int o_id;
	private int u_id;
	private int h_id;
	private String o_time;
	private double o_price;
	private String ht_name;
	private double h_area;
	private String u_name;
	private String h_name;
	
	public int getO_id() {
		return o_id;
	}


	public void setO_id(int o_id) {
		this.o_id = o_id;
	}


	public int getU_id() {
		return u_id;
	}


	public void setU_id(int u_id) {
		this.u_id = u_id;
	}


	public int getH_id() {
		return h_id;
	}


	public void setH_id(int h_id) {
		this.h_id = h_id;
	}


	public String getO_time() {
		return o_time;
	}


	public void setO_time(String o_time) {
		this.o_time = o_time;
	}


	public double getO_price() {
		return o_price;
	}


	public void setO_price(double o_price) {
		this.o_price = o_price;
	}


	public String getHt_name() {
		return ht_name;
	}


	public void setHt_name(String ht_name) {
		this.ht_name = ht_name;
	}


	public double getH_area() {
		return h_area;
	}


	public void setH_area(double h_area) {
		this.h_area = h_area;
	}


	public String getU_name() {
		return u_name;
	}


	public void setU_name(String u_name) {
		this.u_name = u_name;
	}


	public String getH_name() {
		return h_name;
	}


	public void setH_name(String h_name) {
		this.h_name = h_name;
	}


	public Orders(int o_id, int u_id, String u_name, int h_id, String h_name, String o_time, double o_price) {
		super();
		this.o_id = o_id;
		this.u_id = u_id;
		this.h_id = h_id;
		this.o_time = o_time;
		this.o_price = o_price;
		this.u_name = u_name;
		this.h_name = h_name;
	}


	public Orders(int o_id, int u_id, int h_id, String o_time, double o_price, String ht_name, double h_area) {
		super();
		this.o_id = o_id;
		this.u_id = u_id;
		this.h_id = h_id;
		this.o_time = o_time;
		this.o_price = o_price;
		this.ht_name = ht_name;
		this.h_area = h_area;
	}
	
	
	public Orders(int u_id, int h_id, double o_price) {
		super();
		this.u_id = u_id;
		this.h_id = h_id;
		this.o_price = o_price;
	}
	public Orders(String ht_name, int h_id, double h_area, double o_price) {
		super();
		this.h_id = h_id;
		this.o_price = o_price;
		this.ht_name = ht_name;
		this.h_area = h_area;
	}


	@Override
	public String toString() {
		return "Orders [o_id=" + o_id + ", u_id=" + u_id + ", h_id=" + h_id + ", o_time=" + o_time + ", o_price="
				+ o_price + ", ht_name=" + ht_name + ", h_area=" + h_area + ", u_name=" + u_name + ", h_name=" + h_name
				+ "]";
	}
	
}
