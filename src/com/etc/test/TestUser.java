package com.etc.test;

import java.util.List;

import com.etc.dao.impl.HouseDaoImpl;
import com.etc.entity.House;
import com.etc.entity.Users;
import com.etc.service.impl.UserServiceImpl;

public class TestUser {

	public static void main(String[] args) {
		UserServiceImpl us=new UserServiceImpl();
		//����û�
		/*Users u=new Users("ddd","454555",131313123);
		boolean flag=us.getRegisterUser(u);
		System.out.println(flag);*/
		
		//��ѯȫ��
		/*List<Users> list=us.getQueryUserAll();
		for (Users u : list) {
			System.out.println(u);
		}*/
		//ɾ��
		/*boolean flag=us.getDeleUser(3);
		System.out.println(flag);*/
		
		//�޸�
		//System.out.println(us.getQueryByName("ddd"));
		
		//�û���¼
		//System.out.println(us.getUserLogin("zxc", "123"));
		
		//�����û�����ѯ�û�
		//System.out.println(us.getQueryByName("zxc"));
		
		
		//�޸����п���֧������
		//System.out.println(us.getUpdaBankcard("545646123131", "123456", 14));
		
		
		//���ӷ�Դ
		HouseDaoImpl hdi=new HouseDaoImpl();
		
		for(int i=1;i<6;i++) {
			System.out.println(hdi.addHouse(new House("�쳯2��101", 3, 6, 30000, 150, 1, "../img/f5.jpg", 3)));
		}
	}
	
}
