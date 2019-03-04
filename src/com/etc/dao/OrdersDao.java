package com.etc.dao;
import com.etc.entity.Orders;
import com.etc.util.DBUtil;
import com.etc.util.PageData;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.CachedRowSet;

import com.etc.entity.House;
import com.etc.entity.HouseType;;
public interface OrdersDao {
	//查询
	public List<Orders> queryOrder();
	//删除
	public boolean deleteOrders(int O_id);
	//分页
	public PageData queryByPage(int pageNo, int pageSize);
	//上一页
	public Orders queryPre(int o_id,int u_id);
	//下一页
	public Orders queryNext(int o_id,int u_id);
	//最小
	public int queryMinOrder(int u_id);
	//最大
	public int queryMaxOrder(int u_id);
	//根据订单id查询订单
	public Orders queryById(int o_id);
	//添加
	public boolean addOrder(int u_id,int h_id,double price);
	
	/**
	 * 用户个人订单
	 */
	//分页
	public PageData userOrder(int pageNo, int pageSize,int u_id);
}
