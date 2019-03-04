package com.etc.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.rowset.CachedRowSet;

import com.etc.dao.AdminDao;
import com.etc.entity.Admins;
import com.etc.entity.Areas;
import com.etc.entity.House;
import com.etc.entity.HouseState;
import com.etc.entity.HouseType;
import com.etc.entity.Orders;
import com.etc.entity.Units;
import com.etc.util.DBUtil;
import com.etc.util.PageData;

public class AdminDaoImpl implements AdminDao{
	//查询全部管理员
		public List<Admins> queryAdminAll(){
			CachedRowSet crs=DBUtil.execQuery("select * from admins");
			List<Admins> list=new ArrayList<>();
			Admins admin=null;
			try {
				while(crs.next()) {
					int a_id=crs.getInt(1);
					String a_name=crs.getString(2);
					String a_pwd=crs.getString(3);
					admin=new Admins(a_id, a_name, a_pwd);
					list.add(admin);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		};
		
		//删除管理员
		public boolean deleAdmin(int A_id){
			boolean flag=DBUtil.execUpdate("delete from admins where A_id=?", A_id);
			return flag;
		};
		
		//修改管理员信息
		public boolean updaAdmin(Admins ad) {
			boolean flag=DBUtil.execUpdate("update admins set A_pwd=? where A_id=?",ad.getA_pwd(),ad.getA_id());
			return flag;
		}
		//添加管理员
		@Override
		public boolean addAdmin(Admins ad) {
			// TODO Auto-generated method stub
			return DBUtil.execUpdate("insert into admins values(null,?,?)", ad.getA_name(),ad.getA_pwd());
		}
		//通过名字查询管理员
		@Override
		public Admins queryByName(String aname) {
			// TODO Auto-generated method stub
			CachedRowSet crs=DBUtil.execQuery("select * from admins where A_name=?", aname);
			Admins ad=null;
			try {
				while(crs.next()) {
					int A_id=crs.getInt(1);
					String A_name=crs.getString(2);
					String A_pwd=crs.getString(3);
					ad=new Admins(A_id,A_name,A_pwd);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ad;
		}
		//管理员登录
		@Override
		public Admins adminLogin(String aname, String apwd) {
			// TODO Auto-generated method stub
			CachedRowSet crs=DBUtil.execQuery("select * from admins where A_name=? and A_pwd=?", aname,apwd);
			Admins ad=null;
			try {
				while(crs.next()) {
					int A_id=crs.getInt(1);
					String A_name=crs.getString(2);
					String A_pwd=crs.getString(3);
					ad=new Admins(A_id,A_name,A_pwd);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return ad;
		};
		
		//查所有房子类型
		@Override
		public List<HouseType> queryAllHtype() {
			List<HouseType> list = new ArrayList<HouseType>();
			CachedRowSet crs = DBUtil.execQuery("select * from housetype");
			try {
				while (crs.next()) {
					int ht_id = crs.getInt(1);
					String ht_name = crs.getString(2);
					HouseType ht= new HouseType(ht_id, ht_name);
					list.add(ht);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		};
		//添加类型
		@Override
		public boolean addHT(String ht) {
			return DBUtil.execUpdate("insert into housetype values(null,?)",ht);
		};
		//删除类型
		@Override
		public boolean delHT(int id) {
			return DBUtil.execUpdate("delete from housetype where ht_id=?",id);
		};
		//查所有房子户型
		@Override
		public List<Units> queryAllHx() {
			List<Units> list = new ArrayList<Units>();
			CachedRowSet crs = DBUtil.execQuery("select * from units");
			try {
				while (crs.next()) {
					int un_id = crs.getInt(1);
					String un_name = crs.getString(2);
					String un_photo = crs.getString(3);
					Units hx= new Units(un_id, un_name,un_photo);
					list.add(hx);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		};
		//添加户型
		@Override
		public boolean addHX(String hx,String ph) {
			return DBUtil.execUpdate("insert into units values(null,?,?)",hx,ph);
		};
		//删除户型
		@Override
		public boolean delHx(int id) {
			return DBUtil.execUpdate("delete from units where un_id=?",id);
		};
		//查所有房子地区
		@Override
		public List<Areas> queryAllHArea() {
			List<Areas> list = new ArrayList<Areas>();
			CachedRowSet crs = DBUtil.execQuery("select * from areas");
			try {
				while (crs.next()) {
					int ar_id = crs.getInt(1);
					String ar_name = crs.getString(2);
					Areas areas= new Areas(ar_id, ar_name);
					list.add(areas);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		};
		//添加地区
		@Override
		public boolean addHA(String ha) {
			return DBUtil.execUpdate("insert into areas values(null,?)",ha);
		};
		//删除地区
		@Override
		public boolean delHA(int id) {
			return DBUtil.execUpdate("delete from areas where ar_id=?",id);
		};
		//查所有房子状态
		@Override
		public List<HouseState> queryAllHState() {
			List<HouseState> list = new ArrayList<HouseState>();
			CachedRowSet crs = DBUtil.execQuery("select * from HouseState");
			try {
				while (crs.next()) {
					int hs_id = crs.getInt(1);
					String hs_name = crs.getString(2);
					HouseState hs= new HouseState(hs_id, hs_name);
					list.add(hs);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		};
		//添加状态
		@Override
		public boolean addHS(String hs) {
			return DBUtil.execUpdate("insert into HouseState values(null,?)",hs);
		};
		//删除状态
		@Override
		public boolean delHS(int id) {
			return DBUtil.execUpdate("delete from HouseState where hs_id=?",id);
		};
		//添加房产
		@Override
		public boolean addHouse(House h) {
			
			return DBUtil.execUpdate("insert into house values(null,?,?,?,?,?,?,?,?,?)",h.getH_name(),h.getHt_id(),h.getUn_id(),h.getH_unitprice(),h.getH_area(),h.getHs_id(),h.getH_time(),h.getH_photo(),h.getAreas_id());
		};
		//修改房产
		@Override
		public boolean updHouse(House h) {
			
			return DBUtil.execUpdate("update house set H_name=?,Ht_id=?,Un_id=?,H_unitprice=?,H_area=?,Hs_id=?,H_time=?,H_photo=?,Areas_id=? where h_id=?",h.getH_name(),h.getHt_id(),h.getUn_id(),h.getH_unitprice(),h.getH_area(),h.getHs_id(),h.getH_time(),h.getH_photo(),h.getAreas_id(),h.getH_id());
		};
		//删除房产
		@Override
		public boolean delHouse(int id) {
			return DBUtil.execUpdate("delete from house where h_id=?",id);
		};
		
		// 房产模糊查询分页
		@Override
		public PageData queryHLikeByPage(int pageNo, int pageSize, String search) {
			List<House> data = new ArrayList<House>();
			CachedRowSet crs = DBUtil.execQuery("SELECT a.H_id,a.H_name,b.Ht_name,c.Un_name,a.H_unitprice,a.H_area,d.Ar_name,e.Hs_name,a.H_time,a.H_photo,b.Ht_id,c.Un_id,d.Ar_id,e.Hs_id FROM house a INNER JOIN housetype b ON a.Ht_id=b.Ht_id INNER JOIN units c ON a.Un_id=c.Un_id INNER JOIN areas d ON a.Areas_id=d.Ar_id INNER JOIN housestate e on a.Hs_id=e.Hs_id where a.H_name like ? or b.Ht_name like ? or c.Un_name like ? or d.Ar_name like ? ORDER BY a.H_id desc limit ?,?",
					"%" + search + "%", "%" + search + "%", "%" + search + "%", "%" + search + "%", (pageNo - 1) * pageSize, pageSize);
			try {
				while(crs.next()) {
					int hid = crs.getInt(1);
					String hname = crs.getString(2);
					String htname = crs.getString(3);
					String unname = crs.getString(4);
					double hunitprice = crs.getDouble(5);
					double harea = crs.getDouble(6);
					String areasname = crs.getString(7);
					String hsname = crs.getString(8);
					String htime = crs.getString(9);
					String hphoto = crs.getString(10);
					int ht_id = crs.getInt(11);
					int un_id = crs.getInt(12);
					int areas_id = crs.getInt(13);
					int hs_id = crs.getInt(14);
					House House=new House(hid, hname, htname, unname, hunitprice, harea, areasname, hsname, htime, hphoto, ht_id, un_id, areas_id, hs_id);
					data.add(House);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			CachedRowSet crs2 = DBUtil.execQuery("select count(*) FROM (SELECT a.H_id,a.H_name,b.Ht_name,c.Un_name,a.H_unitprice,a.H_area,d.Ar_name,e.Hs_name,a.H_time,a.H_photo,b.Ht_id,c.Un_id,d.Ar_id,e.Hs_id FROM house a INNER JOIN housetype b ON a.Ht_id=b.Ht_id INNER JOIN units c ON a.Un_id=c.Un_id INNER JOIN areas d ON a.Areas_id=d.Ar_id INNER JOIN housestate e on a.Hs_id=e.Hs_id where a.H_name like ? or b.Ht_name like ? or c.Un_name like ? or d.Ar_name like ?)f",
					"%" + search + "%", "%" + search + "%", "%" + search + "%", "%" + search + "%");
			int totalCount = 0;
			try {
				while (crs2.next()) {
					totalCount = crs2.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			PageData pageData = new PageData(data, pageNo, pageSize, totalCount);
			return pageData;
		};
		// 订单模糊查询分页
		@Override
		public PageData queryOLikeByPage(int pageNo, int pageSize, String search) {
			List<Orders> data = new ArrayList<Orders>();
			CachedRowSet crs = DBUtil.execQuery("SELECT a.O_id,b.U_id,b.U_name,c.H_id,c.H_name,a.O_time,a.O_price FROM Orders a INNER JOIN users b ON a.u_id=b.u_id INNER JOIN house c ON a.h_id=c.h_id where b.U_name like ? or c.H_name like ? ORDER BY a.O_id desc limit ?,?",
					"%" + search + "%", "%" + search + "%", (pageNo - 1) * pageSize, pageSize);
			try {
				while(crs.next()) {
					int o_id = crs.getInt(1);
					int u_id = crs.getInt(2);
					String u_name = crs.getString(3);
					int h_id = crs.getInt(4);
					String h_name = crs.getString(5);
					String o_time = crs.getString(6);
					double o_price = crs.getDouble(7);
					Orders Orders=new Orders(o_id, u_id, u_name, h_id, h_name, o_time, o_price);
					data.add(Orders);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			CachedRowSet crs2 = DBUtil.execQuery("select count(*) FROM (SELECT a.O_id,b.U_id,b.U_name,c.H_id,c.H_name,a.O_time,a.O_price FROM Orders a INNER JOIN users b ON a.u_id=b.u_id INNER JOIN house c ON a.h_id=c.h_id where b.U_name like ? or c.H_name like ?)d",
					"%" + search + "%", "%" + search + "%");
			int totalCount = 0;
			try {
				while (crs2.next()) {
					totalCount = crs2.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			PageData pageData = new PageData(data, pageNo, pageSize, totalCount);
			return pageData;
		};
		
		//删除订单
		@Override
		public boolean delOrder(int id) {
			return DBUtil.execUpdate("delete from orders where o_id=?",id);
		};
	
}
