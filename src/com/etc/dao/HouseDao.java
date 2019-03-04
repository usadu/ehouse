package com.etc.dao;

import java.util.List;

import com.etc.entity.Areas;
import com.etc.entity.House;
import com.etc.entity.HouseState;
import com.etc.entity.HouseType;
import com.etc.entity.Units;
import com.etc.util.PageData;

public interface HouseDao {
	/**
	 * ��ѯ���з�Դ
	 */
	public List<House> queryAll();
	/**
	 * ͨ��id�鷿Դ
	 */
	public House queryById(int id);
	/**
	 * ͨ��id�ķ�Դ��Ϣ
	 */
	public boolean updateById(House h);
	/**
	 * ͨ��id�鷿Դ״̬��
	 */
	public String querystateById(int id);
	/**
	 * ͨ��id�黧����
	 */
	public String queryUnitsById(int id);
	/**
	 * ͨ��id�鷿Դ������
	 */
	public String queryTypeById(int id);
	/**
	 * ͨ��id�������
	 */
	public String queryAreasNameById(int id);
	/**
	 * ��ѯ��������
	 */
	public List<String> queryAlltype();
	/**
	 * ͨ����Դ���Ͳ鷿Դ
	 */
	public PageData queryByTypeName(String name,int aid,int page,int pagesize);
	/**
	 * �����л���
	 */
	public List<String> queryAllunits();
	/**
	 * �����е���
	 */
	public List<Areas> queryAllAreas();
	/**
	 * ͨ�����Ͳ鷿Դ
	 */
	public PageData queryByUnitsName(String uname,int aid,int page,int pagesize);
	/**
	 * �����µķ�Դ
	 */
	public List<House> queryByAreasId(int aid);
	/**
	 * ����ҳ
	 */
	public House houseXqById(int hid);
	/**
	 * ���ķ��ӳ���״̬
	 */
	public boolean updataState(int hid);
	
}