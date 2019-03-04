/**
 * 
 */
package com.etc.service.impl;

import java.util.List;

import com.etc.dao.impl.HouseDaoImpl;
import com.etc.entity.Areas;
import com.etc.entity.House;
import com.etc.service.HouseDaoService;
import com.etc.util.PageData;

/**
 * @author Administrator
 *
 */
public class HouseDaoServiceImpl implements HouseDaoService{
	HouseDaoImpl dao=new HouseDaoImpl();
	@Override
	public List<House> queryAll() {
		// TODO Auto-generated method stub
		return dao.queryAll();
	}

	@Override
	public House queryById(int id) {
		// TODO Auto-generated method stub
		return dao.queryById(id);
	}

	@Override
	public boolean updateById(House h) {
		// TODO Auto-generated method stub
		return dao.updateById(h);
	}

	@Override
	public String querystateById(int id) {
		// TODO Auto-generated method stub
		return dao.querystateById(id);
	}

	@Override
	public String queryUnitsById(int id) {
		// TODO Auto-generated method stub
		return dao.queryUnitsById(id);
	}

	@Override
	public String queryTypeById(int id) {
		// TODO Auto-generated method stub
		return dao.queryTypeById(id);
	}

	@Override
	public String queryAreasNameById(int id) {
		// TODO Auto-generated method stub
		return dao.queryAreasNameById(id);
	}

	@Override
	public List<String> queryAlltype() {
		// TODO Auto-generated method stub
		return dao.queryAlltype();
	}

	@Override
	public List<String> queryAllunits() {
		// TODO Auto-generated method stub
		return dao.queryAllunits();
	}

	@Override
	public PageData queryByTypeName(String name,int aid,int page,int pagesize) {
		// TODO Auto-generated method stub
		return dao.queryByTypeName(name,aid,page,pagesize);
	}

	@Override
	public List<Areas> queryAllAreas() {
		// TODO Auto-generated method stub
		return dao.queryAllAreas();
	}

	@Override
	public PageData queryByUnitsName(String uname, int aid,int page,int pagesize) {
		// TODO Auto-generated method stub
		return dao.queryByUnitsName(uname, aid,page,pagesize);
	}

	@Override
	public List<House> queryByAreasId(int aid) {
		// TODO Auto-generated method stub
		return dao.queryByAreasId(aid);
	}

	@Override
	public House houseXqById(int hid) {
		// TODO Auto-generated method stub
		return dao.houseXqById(hid);
	}

	@Override
	public boolean updataState(int hid) {
		// TODO Auto-generated method stub
		return dao.updataState(hid);
	}
	
}
