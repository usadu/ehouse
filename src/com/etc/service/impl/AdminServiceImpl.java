package com.etc.service.impl;

import java.util.List;

import com.etc.dao.impl.AdminDaoImpl;
import com.etc.entity.Admins;
import com.etc.entity.Areas;
import com.etc.entity.House;
import com.etc.entity.HouseState;
import com.etc.entity.HouseType;
import com.etc.entity.Units;
import com.etc.service.IAdminService;
import com.etc.util.PageData;

public class AdminServiceImpl implements IAdminService{

	AdminDaoImpl adi=new AdminDaoImpl();
	
	@Override
	public List<Admins> getQueryAdminAll() {
		// TODO Auto-generated method stub
		return adi.queryAdminAll();
	}

	@Override
	public boolean getDeleAdmin(int A_id) {
		// TODO Auto-generated method stub
		return adi.deleAdmin(A_id);
	}

	@Override
	public boolean getUpdaAdmin(Admins ad) {
		// TODO Auto-generated method stub
		return adi.updaAdmin(ad);
	}

	@Override
	public boolean getAddAdmin(Admins ad) {
		// TODO Auto-generated method stub
		return adi.addAdmin(ad);
	}

	@Override
	public Admins getQueryByName(String aname) {
		// TODO Auto-generated method stub
		return adi.queryByName(aname);
	}

	@Override
	public Admins getAdminLogin(String aname, String apwd) {
		// TODO Auto-generated method stub
		return adi.adminLogin(aname, apwd);
	}

	@Override
	public List<HouseType> queryAllHtype() {
		// TODO Auto-generated method stub
		return adi.queryAllHtype();
	}

	@Override
	public List<Units> queryAllHx() {
		// TODO Auto-generated method stub
		return adi.queryAllHx();
	}

	@Override
	public List<Areas> queryAllHArea() {
		// TODO Auto-generated method stub
		return adi.queryAllHArea();
	}

	@Override
	public List<HouseState> queryAllHState() {
		// TODO Auto-generated method stub
		return adi.queryAllHState();
	}

	@Override
	public boolean addHouse(House h) {
		// TODO Auto-generated method stub
		return adi.addHouse(h);
	}

	@Override
	public boolean updHouse(House h) {
		// TODO Auto-generated method stub
		return adi.updHouse(h);
	}

	@Override
	public boolean delHouse(int id) {
		// TODO Auto-generated method stub
		return adi.delHouse(id);
	}

	@Override
	public PageData queryHLikeByPage(int pageNo, int pageSize, String search) {
		// TODO Auto-generated method stub
		return adi.queryHLikeByPage(pageNo, pageSize, search);
	}

	@Override
	public PageData queryOLikeByPage(int pageNo, int pageSize, String search) {
		// TODO Auto-generated method stub
		return adi.queryOLikeByPage(pageNo, pageSize, search);
	}

	@Override
	public boolean delOrder(int id) {
		// TODO Auto-generated method stub
		return adi.delOrder(id);
	}

	@Override
	public boolean delHT(int id) {
		// TODO Auto-generated method stub
		return adi.delHT(id);
	}

	@Override
	public boolean addHT(String ht) {
		// TODO Auto-generated method stub
		return adi.addHT(ht);
	}

	@Override
	public boolean addHX(String hx, String ph) {
		// TODO Auto-generated method stub
		return adi.addHX(hx, ph);
	}

	@Override
	public boolean delHx(int id) {
		// TODO Auto-generated method stub
		return adi.delHx(id);
	}

	@Override
	public boolean addHA(String ha) {
		// TODO Auto-generated method stub
		return adi.addHA(ha);
	}

	@Override
	public boolean delHA(int id) {
		// TODO Auto-generated method stub
		return adi.delHA(id);
	}

	@Override
	public boolean delHS(int id) {
		// TODO Auto-generated method stub
		return adi.delHS(id);
	}

	@Override
	public boolean addHS(String hs) {
		// TODO Auto-generated method stub
		return adi.addHS(hs);
	}
}
