package com.etc.service;

import java.util.List;

import com.etc.entity.House;
import com.etc.entity.Orders;
import com.etc.util.PageData;

public interface orderService {
	//��ѯ�û�������
	public List<Orders> getQueryOrders();
	//ɾ��
	public boolean getdelteorders(int O_id);
	//��ҳ��ѯ
	public PageData getOrderByPage(int pageNo,int pageSize);
	
	//��һҳ
	public Orders getQueryPre(int o_id,int u_id);
	//��һҳ
	public Orders getQueryNext(int o_id,int u_id);
	//��С
	public int getQueryMinOrder(int u_id);
	//���
	public int getQueryMaxOrder(int u_id);
	//���ݶ���id��ѯ����
	public Orders getQueryById(int o_id);
	//���
		public boolean addOrder(int u_id,int h_id,double price);
		
	/**
	 * �û����˶���
	 */
	//��ҳ
	public PageData getUserOrder(int pageNo, int pageSize,int u_id);
}
