package com.etc.service;

import java.util.List;

import com.etc.entity.Admins;
import com.etc.entity.Areas;
import com.etc.entity.House;
import com.etc.entity.HouseState;
import com.etc.entity.HouseType;
import com.etc.entity.Units;
import com.etc.util.PageData;

public interface IAdminService {
	
	//查询全部管理员
		public List<Admins> getQueryAdminAll();
		
		//删除管理员
		public boolean getDeleAdmin(int A_id);
		
		//修改管理员密码
		public boolean getUpdaAdmin(Admins ad);
		
		//注册管理员
		public boolean getAddAdmin(Admins ad);
		
		//根据管理员查询
		public Admins getQueryByName(String aname);
		
		//登录
		public Admins getAdminLogin(String aname,String apwd);
		
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

		public boolean addHT(String h);

		public boolean addHX(String ht, String ph);

		public boolean delHx(int id);

		public boolean addHA(String ha);

		public boolean delHA(int id);

		public boolean delHS(int id);

		public boolean addHS(String hs);
}
