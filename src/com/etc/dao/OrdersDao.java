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
	//��ѯ
	public List<Orders> queryOrder();
	//ɾ��
	public boolean deleteOrders(int O_id);
	//��ҳ
	public PageData queryByPage(int pageNo, int pageSize);
	//��һҳ
	public Orders queryPre(int o_id,int u_id);
	//��һҳ
	public Orders queryNext(int o_id,int u_id);
	//��С
	public int queryMinOrder(int u_id);
	//���
	public int queryMaxOrder(int u_id);
	//���ݶ���id��ѯ����
	public Orders queryById(int o_id);
	//���
	public boolean addOrder(int u_id,int h_id,double price);
	
	/**
	 * �û����˶���
	 */
	//��ҳ
	public PageData userOrder(int pageNo, int pageSize,int u_id);
}
