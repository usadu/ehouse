package com.etc.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.CachedRowSet;

import com.etc.dao.OrdersDao;
import com.etc.entity.Admins;
import com.etc.entity.House;
import com.etc.entity.Orders;
import com.etc.util.DBUtil;
import com.etc.util.PageData;

public class OrdersDaoImpl implements OrdersDao {
	
	@Override
	public List<Orders> queryOrder() {
		// TODO Auto-generated method stub
		CachedRowSet crs=DBUtil.execQuery("select * from orders as o inner join house as h on h.H_id=o.H_id  inner JOIN housetype as t on h.Ht_id=t.Ht_id");
		List<Orders> list=new ArrayList<>();
		Orders orders=null;
		try {
			while(crs.next()) {
				int o_id=crs.getInt("o_id");
				int u_id=crs.getInt("u_id");
				int h_id=crs.getInt("h_id");
			    String o_time=crs.getString("o_time");
			    double o_price=crs.getDouble("o_price");
				String ht_name=crs.getString("ht_name");
				double h_area=crs.getDouble("h_area");
				orders=new Orders(o_id,u_id,h_id, o_time,o_price,ht_name,h_area);
				list.add(orders);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}


	//删除订单
	@Override
	public boolean deleteOrders(int O_id) {
		// TODO Auto-generated method stub
		return  DBUtil.execUpdate("delete from orders where o_id=?",O_id);
	
	}
	//分页
	@Override
	public PageData queryByPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		PageData pageData=null;
		CachedRowSet crs=DBUtil.execQuery("select * from orders as o inner join house as h on h.H_id=o.H_id  inner JOIN housetype as t on h.Ht_id=t.Ht_id limit ?,?", (pageNo-1)*pageSize,pageSize);
		List<Orders> data=new ArrayList<>();
		Orders orders=null;
		try {
			while(crs.next()) {
				int o_id=crs.getInt("o_id");
				int u_id=crs.getInt("u_id");
				int h_id=crs.getInt("h_id");
			    String o_time=crs.getString("o_time");
			    double o_price=crs.getDouble("o_price");
				String ht_name=crs.getString("ht_name");
				double h_area=crs.getDouble("h_area");
				orders=new Orders(o_id,u_id,h_id, o_time,o_price,ht_name,h_area);
				data.add(orders);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		CachedRowSet crs2=DBUtil.execQuery("select count(*) from orders as o inner join house as h on h.H_id=o.H_id  inner JOIN housetype as t on h.Ht_id=t.Ht_id");
		int totalCount=0;
		try {
			while(crs2.next()) {
				totalCount=crs2.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		 pageData=new PageData(data, pageNo, pageSize, totalCount);
		return pageData;
	}
	//根据订单id查询订单
	@Override
	public Orders queryById(int o_id) {
		// TODO Auto-generated method stub
		Orders or=null;
		CachedRowSet crs=DBUtil.execQuery("select * from orders as o inner join house as h on h.H_id=o.H_id  inner JOIN housetype as t on h.Ht_id=t.Ht_id where O_id=?", o_id);
		try {
			while(crs.next()) {
				int o_id1=crs.getInt("o_id");
				int u_id=crs.getInt("u_id");
				int h_id=crs.getInt("h_id");
			    String o_time=crs.getString("o_time");
			    double o_price=crs.getDouble("o_price");
				String ht_name=crs.getString("ht_name");
				double h_area=crs.getDouble("h_area");
				or=new Orders(o_id1,u_id,h_id, o_time,o_price,ht_name,h_area);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return or;
	}

	//上一页订单
	@Override
	public Orders queryPre(int o_id,int u_id) {
		// TODO Auto-generated method stub
		Orders or=null;
		CachedRowSet crs=DBUtil.execQuery("select * from orders as o inner join house as h on h.H_id=o.H_id  inner JOIN housetype as t on h.Ht_id=t.Ht_id where O_id<? and U_id=? order by O_id desc limit 0,1", o_id,u_id);
		try {
			while(crs.next()) {
				int o_id1=crs.getInt("o_id");
				int u_id1=crs.getInt("u_id");
				int h_id=crs.getInt("h_id");
			    String o_time=crs.getString("o_time");
			    double o_price=crs.getDouble("o_price");
				String ht_name=crs.getString("ht_name");
				double h_area=crs.getDouble("h_area");
				or=new Orders(o_id1,u_id1,h_id, o_time,o_price,ht_name,h_area);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return or;
	}

	//下一页订单
	@Override
	public Orders queryNext(int o_id,int u_id) {
		// TODO Auto-generated method stub
		Orders or=null;
		CachedRowSet crs=DBUtil.execQuery("select * from orders as o inner join house as h on h.H_id=o.H_id  inner JOIN housetype as t on h.Ht_id=t.Ht_id where O_id>? and U_id=? order by O_id asc limit 0,1", o_id,u_id);
		try {
			while(crs.next()) {
				int o_id1=crs.getInt("o_id");
				int u_id1=crs.getInt("u_id");
				int h_id=crs.getInt("h_id");
			    String o_time=crs.getString("o_time");
			    double o_price=crs.getDouble("o_price");
				String ht_name=crs.getString("ht_name");
				double h_area=crs.getDouble("h_area");
				or=new Orders(o_id1,u_id1,h_id, o_time,o_price,ht_name,h_area);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return or;
	}

	//最小订单id
	@Override
	public int queryMinOrder(int u_id) {
		// TODO Auto-generated method stub
		CachedRowSet crs=DBUtil.execQuery("select min(O_id) from orders as o inner join house as h on h.H_id=o.H_id  inner JOIN housetype as t on h.Ht_id=t.Ht_id where U_id=?",u_id);
		int minO_id=0;
		try {
			while(crs.next()) {
				minO_id=crs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return minO_id;
	}

	//最大订单id
	@Override
	public int queryMaxOrder(int u_id) {
		// TODO Auto-generated method stub
		CachedRowSet crs=DBUtil.execQuery("select max(O_id) from orders as o inner join house as h on h.H_id=o.H_id  inner JOIN housetype as t on h.Ht_id=t.Ht_id where U_id=?",u_id);
		int maxO_id=0;
		try {
			while(crs.next()) {
				maxO_id=crs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return maxO_id;
	}


	/**
	 * 用户个人订单
	 */
	//分页
	public PageData userOrder(int pageNo, int pageSize,int u_id) {
		PageData pageData=null;
		CachedRowSet crs=DBUtil.execQuery("select * from orders as o inner join house as h on h.H_id=o.H_id  inner JOIN housetype as t on h.Ht_id=t.Ht_id where U_id=? limit ?,?", u_id,(pageNo-1)*pageSize,pageSize);
		List<Orders> data=new ArrayList<>();
		Orders orders=null;
		try {
			while(crs.next()) {
				int o_id=crs.getInt("o_id");
				int u_id1=crs.getInt("u_id");
				int h_id=crs.getInt("h_id");
			    String o_time=crs.getString("o_time");
			    double o_price=crs.getDouble("o_price");
				String ht_name=crs.getString("ht_name");
				double h_area=crs.getDouble("h_area");
				orders=new Orders(o_id,u_id1,h_id, o_time,o_price,ht_name,h_area);
				data.add(orders);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		CachedRowSet crs2=DBUtil.execQuery("select count(*) from orders as o inner join house as h on h.H_id=o.H_id  inner JOIN housetype as t on h.Ht_id=t.Ht_id where u_id=?",u_id);
		int totalCount=0;
		try {
			while(crs2.next()) {
				totalCount=crs2.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		 pageData=new PageData(data, pageNo, pageSize, totalCount);
		return pageData;
		
	};
	//添加order
	@Override
	public boolean addOrder(int u_id, int h_id, double price) {
		// TODO Auto-generated method stub
		System.out.println(u_id+"-"+h_id+"-"+price);
		return DBUtil.execUpdate("insert into orders values(null,?,?,now(),?)",u_id,h_id,price);
	}
}



	
	

