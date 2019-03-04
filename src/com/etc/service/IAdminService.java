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
	
	//��ѯȫ������Ա
		public List<Admins> getQueryAdminAll();
		
		//ɾ������Ա
		public boolean getDeleAdmin(int A_id);
		
		//�޸Ĺ���Ա����
		public boolean getUpdaAdmin(Admins ad);
		
		//ע�����Ա
		public boolean getAddAdmin(Admins ad);
		
		//���ݹ���Ա��ѯ
		public Admins getQueryByName(String aname);
		
		//��¼
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
