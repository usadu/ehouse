/**
 * 
 */
package com.etc.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.CachedRowSet;

import com.etc.dao.HouseDao;
import com.etc.entity.Areas;
import com.etc.entity.House;
import com.etc.entity.Users;
import com.etc.util.DBUtil;
import com.etc.util.PageData;

/**
 * @author Administrator
 *
 */
public class HouseDaoImpl implements HouseDao {
	/**
	 * 查询所有房源
	 */
	@Override
	public List<House> queryAll() {
		CachedRowSet crs = DBUtil.execQuery("select * from house");
		House house = null;
		List<House> list = new ArrayList<House>();
		try {
			while (crs.next()) {
				int hid = crs.getInt(1);
				String hname = crs.getString(2);
				String htname = queryTypeById(crs.getInt(3));
				String unname = queryUnitsById(crs.getInt(4));
				double hunitprice = crs.getDouble(5);
				double harea = crs.getDouble(6);
				String hsname = querystateById(crs.getInt(7));
				String htime = crs.getString(8);
				String hphoto = crs.getString(9);
				String areasname = queryAreasNameById(crs.getInt(10));
				house = new House(hid, hname, htname, unname, hunitprice, harea, hsname, htime, hphoto, areasname);
				list.add(house);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 通过id查房源
	 */
	@Override
	public House queryById(int id) {
		CachedRowSet crs = DBUtil.execQuery("select * from house where H_id=?", id);
		House house = null;
		try {
			while (crs.next()) {
				int hid = crs.getInt(1);
				String hname = crs.getString(2);
				int htid = crs.getInt(3);
				int unid = crs.getInt(4);
				double hunitprice = crs.getDouble(5);
				double harea = crs.getDouble(6);
				int hsid = crs.getInt(7);
				String htime = crs.getString(8);
				String hphoto = crs.getString(9);
				int areasid = crs.getInt(10);
				house = new House(hid, hname, htid, unid, hunitprice, harea, hsid, htime, hphoto, areasid);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return house;
	}

	/**
	 * 通过id改房源信息
	 */
	@Override
	public boolean updateById(House house) {
		return DBUtil.execUpdate(
				"update house set ht_id=?,un_id=?,h_unitprice=?,h_area=?,hs_id=?,h_time=?,h_photo=?,areas_id=? where h_id=?",
				house.getHt_id(), house.getUn_id(), house.getH_unitprice(), house.getH_area(), house.getHs_id(),
				house.getH_time(), house.getH_photo(), house.getAreas_id(), house.getH_id());
	}

	/**
	 * 通过id查房源状态名
	 */
	@Override
	public String querystateById(int id) {
		CachedRowSet crs = DBUtil.execQuery("select hs_name from housestate where hs_id=?", id);
		String sname = null;
		try {
			while (crs.next()) {
				sname = crs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return sname;
	}

	/**
	 * 通过id查户型名
	 */
	@Override
	public String queryUnitsById(int id) {
		CachedRowSet crs = DBUtil.execQuery("select un_name from units where un_id=?", id);
		String uname = null;
		try {
			while (crs.next()) {
				uname = crs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return uname;
	}

	/**
	 * 通过id查房源类型名
	 */
	@Override
	public String queryTypeById(int id) {
		CachedRowSet crs = DBUtil.execQuery("select ht_name from housetype where ht_id=?", id);
		String htname = null;
		try {
			while (crs.next()) {
				htname = crs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return htname;
	}

	@Override
	public String queryAreasNameById(int id) {
		CachedRowSet crs = DBUtil.execQuery("select ar_name from areas where ar_id=?", id);
		String arname = null;
		try {
			while (crs.next()) {
				arname = crs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return arname;
	}

	/**
	 * 查类型名
	 */
	@Override
	public List<String> queryAlltype() {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<String>();
		CachedRowSet crs = DBUtil.execQuery("select*from housetype");
		try {
			while (crs.next()) {
				String tname = crs.getString(2);
				list.add(tname);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 通过房源类型查房源
	 */
	@Override
	public PageData queryByTypeName(String name, int aid, int page, int pagesize) {
		int a = page * pagesize - pagesize;
		CachedRowSet crs = null;
		CachedRowSet crs1 = null;
		if (name.equals("全部")) {
			crs = DBUtil.execQuery("select*from house where areas_id=? LIMIT ?,?", aid, a, pagesize);
			crs1 = DBUtil.execQuery("select count(*) from house where  areas_id=?", aid);

		} else {
			crs = DBUtil.execQuery(
					"select*from house where ht_id=(select ht_id from housetype where ht_name=?) and areas_id=? LIMIT ?,?",
					name, aid, a, pagesize);
			crs1 = DBUtil.execQuery(
					"select count(*) from house where ht_id=(select ht_id from housetype where ht_name=?) and areas_id=?",
					name, aid);

		}
		int num = 0;
		List<House> list = new ArrayList<House>();
		House house = null;
		try {
			while (crs.next()) {
				int hid = crs.getInt(1);
				String hname = crs.getString(2);
				String htname = queryTypeById(crs.getInt(3));
				String unname = queryUnitsById(crs.getInt(4));
				double hunitprice = crs.getDouble(5);
				double harea = crs.getDouble(6);
				String hsname = querystateById(crs.getInt(7));
				String htime = crs.getString(8);
				String hphoto = crs.getString(9);
				String areasname = queryAreasNameById(crs.getInt(10));
				house = new House(hid, hname, htname, unname, hunitprice, harea, hsname, htime, hphoto, areasname);
				list.add(house);
			}
			while (crs1.next()) {
				num = crs1.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PageData pData = new PageData(list, page, pagesize, num);
		return pData;
	}

	/**
	 * 查所有户型
	 */
	@Override
	public List<String> queryAllunits() {
		List<String> list = new ArrayList<String>();
		CachedRowSet crs = DBUtil.execQuery("select*from units");
		try {
			while (crs.next()) {
				String uname = crs.getString(2);
				list.add(uname);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Areas> queryAllAreas() {
		List<Areas> list = new ArrayList<Areas>();
		CachedRowSet crs = DBUtil.execQuery("select*from areas");
		try {
			while (crs.next()) {
				int aid = crs.getInt(1);
				String aname = crs.getString(2);
				Areas area = new Areas(aid, aname);
				list.add(area);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public PageData queryByUnitsName(String uname, int aid, int page, int pagesize) {
		int a = page * pagesize - pagesize;
		CachedRowSet crs = DBUtil.execQuery(
				"select*from house where un_id=(select un_id from units where un_name=?) and areas_id=? LIMIT ?,?",
				uname, aid, a, pagesize);
		CachedRowSet crs1 = DBUtil.execQuery(
				"select count(*) from house where un_id=(select un_id from units where un_name=?) and areas_id=?",
				uname, aid);
		int num = 0;
		List<House> list = new ArrayList<House>();
		House house = null;
		try {
			while (crs.next()) {
				int hid = crs.getInt(1);
				String hname = crs.getString(2);
				String htname = queryTypeById(crs.getInt(3));
				String unname = queryUnitsById(crs.getInt(4));
				double hunitprice = crs.getDouble(5);
				double harea = crs.getDouble(6);
				String hsname = querystateById(crs.getInt(7));
				String htime = crs.getString(8);
				String hphoto = crs.getString(9);
				String areasname = queryAreasNameById(crs.getInt(10));
				house = new House(hid, hname, htname, unname, hunitprice, harea, hsname, htime, hphoto, areasname);
				list.add(house);
			}
			while (crs1.next()) {
				num = crs1.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PageData pData = new PageData(list, page, pagesize, num);
		return pData;
	}

	/**
	 * 地区下的房源
	 */
	@Override
	public List<House> queryByAreasId(int aid) {
		CachedRowSet crs = DBUtil.execQuery("select*from house where areas_id=?", aid);
		List<House> list = new ArrayList<House>();
		House house = null;
		try {
			while (crs.next()) {
				int hid = crs.getInt(1);
				String hname = crs.getString(2);
				String htname = queryTypeById(crs.getInt(3));
				String unname = queryUnitsById(crs.getInt(4));
				double hunitprice = crs.getDouble(5);
				double harea = crs.getDouble(6);
				String hsname = querystateById(crs.getInt(7));
				String htime = crs.getString(8);
				String hphoto = crs.getString(9);
				String areasname = queryAreasNameById(crs.getInt(10));
				house = new House(hid, hname, htname, unname, hunitprice, harea, hsname, htime, hphoto, areasname);
				list.add(house);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 详情房子
	 */

	@Override
	public House houseXqById(int h_id) {
		CachedRowSet crs = DBUtil.execQuery("select*from house where h_id=?", h_id);
		House house = null;
		try {
			while (crs.next()) {
				int hid = crs.getInt(1);
				String hname = crs.getString(2);
				String htname = queryTypeById(crs.getInt(3));
				String unname = queryUnitsById(crs.getInt(4));
				double hunitprice = crs.getDouble(5);
				double harea = crs.getDouble(6);
				String hsname = querystateById(crs.getInt(7));
				String htime = crs.getString(8);
				String hphoto = crs.getString(9);
				String areasname = queryAreasNameById(crs.getInt(10));
				String unphoto = null;
				CachedRowSet crs1 = DBUtil.execQuery("select un_photo from units where un_id=?", crs.getInt(4));
				while (crs1.next()) {
					unphoto = crs1.getString(1);
				}
				house = new House(hid, hname, htname, unname, hunitprice, harea, hsname, htime, hphoto, areasname,
						unphoto);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return house;
	}

		
		public boolean addHouse(House h) {
			boolean flag=DBUtil.execUpdate("insert into house values(null,?,?,?,?,?,?,null,?,?)",h.getH_name(),h.getHt_id(),h.getUn_id(),h.getH_unitprice(),h.getH_area(),h.getHs_id(),h.getH_photo(),h.getAreas_id());
			return flag;
		}


		@Override
		public boolean updataState(int hid) {
			
			return DBUtil.execUpdate("update house set hs_id=2  where h_id=?", hid);
		}

}
