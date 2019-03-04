package com.etc.test;

import java.util.List;

import com.etc.dao.impl.HouseDaoImpl;
import com.etc.entity.House;
import com.etc.entity.Users;
import com.etc.service.impl.UserServiceImpl;

public class TestUser {

	public static void main(String[] args) {
		UserServiceImpl us=new UserServiceImpl();
		//添加用户
		/*Users u=new Users("ddd","454555",131313123);
		boolean flag=us.getRegisterUser(u);
		System.out.println(flag);*/
		
		//查询全部
		/*List<Users> list=us.getQueryUserAll();
		for (Users u : list) {
			System.out.println(u);
		}*/
		//删除
		/*boolean flag=us.getDeleUser(3);
		System.out.println(flag);*/
		
		//修改
		//System.out.println(us.getQueryByName("ddd"));
		
		//用户登录
		//System.out.println(us.getUserLogin("zxc", "123"));
		
		//根据用户名查询用户
		//System.out.println(us.getQueryByName("zxc"));
		
		
		//修改银行卡和支付密码
		//System.out.println(us.getUpdaBankcard("545646123131", "123456", 14));
		
		
		//增加房源
		HouseDaoImpl hdi=new HouseDaoImpl();
		
		for(int i=1;i<6;i++) {
			System.out.println(hdi.addHouse(new House("天朝2幢101", 3, 6, 30000, 150, 1, "../img/f5.jpg", 3)));
		}
	}
	
}
