package com.etc.service;

import java.util.List;

import com.etc.entity.House;
import com.etc.entity.Orders;
import com.etc.util.PageData;

public interface orderService {
	//查询用户订单号
	public List<Orders> getQueryOrders();
	//删除
	public boolean getdelteorders(int O_id);
	//分页查询
	public PageData getOrderByPage(int pageNo,int pageSize);
	
	//上一页
	public Orders getQueryPre(int o_id,int u_id);
	//下一页
	public Orders getQueryNext(int o_id,int u_id);
	//最小
	public int getQueryMinOrder(int u_id);
	//最大
	public int getQueryMaxOrder(int u_id);
	//根据订单id查询订单
	public Orders getQueryById(int o_id);
	//添加
		public boolean addOrder(int u_id,int h_id,double price);
		
	/**
	 * 用户个人订单
	 */
	//分页
	public PageData getUserOrder(int pageNo, int pageSize,int u_id);
}
