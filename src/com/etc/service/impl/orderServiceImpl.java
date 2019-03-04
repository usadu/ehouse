package com.etc.service.impl;

import java.util.List;

import com.etc.dao.impl.OrdersDaoImpl;
import com.etc.entity.House;
import com.etc.entity.Orders;
import com.etc.service.orderService;
import com.etc.util.PageData;
import com.sun.org.apache.xml.internal.resolver.helpers.PublicId;

public class orderServiceImpl implements orderService {
	OrdersDaoImpl od= new OrdersDaoImpl();

	@Override
	public List<Orders> getQueryOrders() {
		// TODO Auto-generated method stub
		return od.queryOrder();
	}



	@Override
	public boolean getdelteorders(int O_id) {
		// TODO Auto-generated method stub
		return od.deleteOrders(O_id);
	}



	@Override
	public PageData getOrderByPage(int pageNo, int pageSize) {
		return od.queryByPage(pageNo, pageSize);
	}



	@Override
	public Orders getQueryPre(int o_id,int u_id) {
		// TODO Auto-generated method stub
		return od.queryPre(o_id,u_id);
	}



	@Override
	public Orders getQueryNext(int o_id,int u_id) {
		// TODO Auto-generated method stub
		return od.queryNext(o_id,u_id);
	}



	@Override
	public int getQueryMinOrder(int u_id) {
		// TODO Auto-generated method stub
		return od.queryMinOrder(u_id);
	}



	@Override
	public int getQueryMaxOrder(int u_id) {
		// TODO Auto-generated method stub
		return od.queryMaxOrder(u_id);
	}



	@Override
	public Orders getQueryById(int o_id) {
		// TODO Auto-generated method stub
		return od.queryById(o_id);
	}
	
	/**
	 * 用户个人订单
	 */
	//分页
	public PageData getUserOrder(int pageNo, int pageSize,int u_id) {
		return od.userOrder(pageNo, pageSize, u_id);
	}



	@Override
	public boolean addOrder(int u_id, int h_id, double price) {
		// TODO Auto-generated method stub
		return od.addOrder(u_id, h_id, price);
	};
	
}

