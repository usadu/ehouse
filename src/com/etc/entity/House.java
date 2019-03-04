package com.etc.entity;

public class House {
	private int h_id;
	private String h_name;
	private int ht_id;
	private int un_id;
	private double h_unitprice;
	private double h_area;
	private int hs_id;
	private String h_time;
	private String h_photo;
	private int areas_id;
	
	private String ht_name;
	private String un_name;
	private String hs_name;
	private String areas_name;
	private String un_photo;
	
	
	
	public House(String h_name, int ht_id, int un_id, double h_unitprice, double h_area, int hs_id, String h_time,
			String h_photo, int areas_id) {
		super();
		this.h_name = h_name;
		this.ht_id = ht_id;
		this.un_id = un_id;
		this.h_unitprice = h_unitprice;
		this.h_area = h_area;
		this.hs_id = hs_id;
		this.h_time = h_time;
		this.h_photo = h_photo;
		this.areas_id = areas_id;
	}
	public House(int h_id, String h_name, String ht_name,String un_name, double h_unitprice, double h_area, String areas_name, String hs_name, String h_time, String h_photo, int ht_id, int un_id, int areas_id, int hs_id) {
		super();
		this.h_id = h_id;
		this.h_name = h_name;
		this.h_unitprice = h_unitprice;
		this.h_area = h_area;
		this.h_time = h_time;
		this.h_photo = h_photo;
		this.ht_name = ht_name;
		this.un_name = un_name;
		this.hs_name = hs_name;
		this.areas_name = areas_name;
		this.ht_id = ht_id;
		this.un_id = un_id;
		this.areas_id = areas_id;
		this.hs_id = hs_id;
	}
	public House(int h_id, String h_name, String ht_name,String un_name, double h_unitprice, String areas_name, String hs_name, String h_time, String h_photo) {
		super();
		this.h_id = h_id;
		this.h_name = h_name;
		this.h_unitprice = h_unitprice;
		this.h_time = h_time;
		this.h_photo = h_photo;
		this.ht_name = ht_name;
		this.un_name = un_name;
		this.hs_name = hs_name;
		this.areas_name = areas_name;
	}
	
	
	
	public House(int h_id, String h_name, String ht_name, String un_name, double h_unitprice, double h_area,
			String hs_name, String h_time, String h_photo, String areas_name) {
		super();
		this.h_id = h_id;
		this.h_name = h_name;
		this.ht_name = ht_name;
		this.un_name = un_name;
		this.h_unitprice = h_unitprice;
		this.h_area = h_area;
		this.hs_name = hs_name;
		this.h_time = h_time;
		this.h_photo = h_photo;
		this.areas_name = areas_name;
	}
	public House(int h_id, String h_name, String ht_name, String un_name, double h_unitprice, double h_area,
			String hs_name, String h_time, String h_photo, String areas_name,String un_photo) {
		super();
		this.h_id = h_id;
		this.h_name = h_name;
		this.ht_name = ht_name;
		this.un_name = un_name;
		this.h_unitprice = h_unitprice;
		this.h_area = h_area;
		this.hs_name = hs_name;
		this.h_time = h_time;
		this.h_photo = h_photo;
		this.areas_name = areas_name;
		this.un_photo=un_photo;
	}
	public House(int h_id, String h_name, int ht_id, int un_id, double h_unitprice, double h_area, int hs_id,
			String h_time, String h_photo, int areas_id) {
		super();
		this.h_id = h_id;
		this.h_name = h_name;
		this.ht_id = ht_id;
		this.un_id = un_id;
		this.h_unitprice = h_unitprice;
		this.h_area = h_area;
		this.hs_id = hs_id;
		this.h_time = h_time;
		this.h_photo = h_photo;
		this.areas_id = areas_id;
	}
	
	public House(String h_name, int ht_id, int un_id, double h_unitprice, double h_area, int hs_id, String h_photo,
			int areas_id) {
		super();
		this.h_name = h_name;
		this.ht_id = ht_id;
		this.un_id = un_id;
		this.h_unitprice = h_unitprice;
		this.h_area = h_area;
		this.hs_id = hs_id;
		this.h_photo = h_photo;
		this.areas_id = areas_id;
	}
	public String getUn_photo() {
		return un_photo;
	}
	public void setUn_photo(String un_photo) {
		this.un_photo = un_photo;
	}
	public int getH_id() {
		return h_id;
	}
	public void setH_id(int h_id) {
		this.h_id = h_id;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public int getHt_id() {
		return ht_id;
	}
	public void setHt_id(int ht_id) {
		this.ht_id = ht_id;
	}
	public int getUn_id() {
		return un_id;
	}
	public void setUn_id(int un_id) {
		this.un_id = un_id;
	}
	public double getH_unitprice() {
		return h_unitprice;
	}
	public void setH_unitprice(double h_unitprice) {
		this.h_unitprice = h_unitprice;
	}
	public double getH_area() {
		return h_area;
	}
	public void setH_area(double h_area) {
		this.h_area = h_area;
	}
	public int getHs_id() {
		return hs_id;
	}
	public void setHs_id(int hs_id) {
		this.hs_id = hs_id;
	}
	public String getH_time() {
		return h_time;
	}
	public void setH_time(String h_time) {
		this.h_time = h_time;
	}
	public String getH_photo() {
		return h_photo;
	}
	public void setH_photo(String h_photo) {
		this.h_photo = h_photo;
	}
	public int getAreas_id() {
		return areas_id;
	}
	public void setAreas_id(int areas_id) {
		this.areas_id = areas_id;
	}
	public String getHt_name() {
		return ht_name;
	}
	public void setHt_name(String ht_name) {
		this.ht_name = ht_name;
	}
	public String getUn_name() {
		return un_name;
	}
	public void setUn_name(String un_name) {
		this.un_name = un_name;
	}
	public String getHs_name() {
		return hs_name;
	}
	public void setHs_name(String hs_name) {
		this.hs_name = hs_name;
	}
	public String getAreas_name() {
		return areas_name;
	}
	public void setAreas_name(String areas_name) {
		this.areas_name = areas_name;
	}
	@Override
	public String toString() {
		return "House [H_id=" + this.h_id + ", H_name=" + this.h_name + ", Ht_name=" + this.ht_name + ", Un_name=" + this.un_name
				+ ", H_unitprice=" + this.h_unitprice + ", H_area=" + this.h_area + ", Hs_name=" + this.hs_name + ", H_time=" + this.h_time
				+ ", H_photo=" + this.h_photo + ", Areas_name=" + this.areas_name + "]";
	}
	
	
	
}
