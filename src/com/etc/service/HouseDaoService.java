package com.etc.service;

import java.util.List;

import com.etc.entity.Areas;
import com.etc.entity.House;
import com.etc.util.PageData;

public interface HouseDaoService {
	/**
	 * 查询所有房源
	 */
	public List<House> queryAll();
	/**
	 * 通过id查房源
	 */
	public House queryById(int id);
	/**
	 * 通过id改房源信息
	 */
	public boolean updateById(House h);
	/**
	 * 通过id查房源状态名
	 */
	public String querystateById(int id);
	/**
	 * 通过id查户型名
	 */
	public String queryUnitsById(int id);
	/**
	 * 通过id查房源类型名
	 */
	public String queryTypeById(int id);
	/**
	 * 通过id查地区名
	 */
	public String queryAreasNameById(int id);
	/**
	 * 查询所有类型
	 */
	public List<String> queryAlltype();
	/**
	 * 查所有户型
	 */
	public List<String> queryAllunits();
	/**
	 * 通过房源类型查房源
	 */
	public PageData queryByTypeName(String tname,int aid,int page,int pagesize);
	/**
	 * 通过房型查房源
	 */
	public PageData queryByUnitsName(String uname,int aid,int page,int pagesize);
	/**
	 * 查所有地区
	 */
	public List<Areas> queryAllAreas();
	/**
	 * 地区下的房源
	 */
	public List<House> queryByAreasId(int aid);
	/**
	 * 详情页
	 */
	public House houseXqById(int hid);
	/**
	 * 更改房子出售状态
	 */
	public boolean updataState(int hid);
}
