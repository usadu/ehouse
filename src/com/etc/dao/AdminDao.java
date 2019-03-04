package com.etc.dao;

import java.util.List;

import com.etc.entity.Admins;
import com.etc.entity.Areas;
import com.etc.entity.House;
import com.etc.entity.HouseState;
import com.etc.entity.HouseType;
import com.etc.entity.Units;
import com.etc.util.PageData;

public interface AdminDao {
	//查询全部管理员
	public List<Admins> queryAdminAll();
	
	//删除管理员
	public boolean deleAdmin(int A_id);
	
	//修改管理员密码
	public boolean updaAdmin(Admins ad);
	
	//注册管理员
	public boolean addAdmin(Admins ad);
	
	//根据管理员查询
	public Admins queryByName(String aname);
	
	//登录
	public Admins adminLogin(String aname,String apwd);

	public List<HouseType> queryAllHtype();

	public List<Units> queryAllHx();

	public List<Areas> queryAllHArea();

	public List<HouseState> queryAllHState();

	public boolean addHouse(House h);

	public boolean updHouse(House h);

	public boolean delHouse(int id);

	public PageData queryHLikeByPage(int pageNo, int pageSize, String search);

	public PageData queryOLikeByPage(int pageNo, int pageSize, String search);

	public boolean delOrder(int id);

	public boolean delHT(int id);

	public boolean addHT(String ht);

	public boolean addHX(String hx, String ph);

	public boolean delHx(int id);

	public boolean addHA(String ha);

	public boolean delHA(int id);

	public boolean delHS(int id);

	public boolean addHS(String hs);
}
