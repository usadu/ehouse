package com.etc.service;

import java.util.List;

import com.etc.entity.Users;
import com.etc.util.PageData;

public interface IUserService {
	
	//��ѯȫ���û�
	public List<Users> getQueryUserAll();
	
	//ɾ���û�
	public boolean getDeleUser(int U_id);
	
	//�޸��û�
	public boolean getUpdaUser(Users user);
	
	//�޸��û�
	public boolean getUpdaUser2(Users user);
	
	//ע���û�
	public boolean getRegisterUser(Users user);

	//ģ����ѯ�û�
	public List<Users> getQueryByLikeName(String uname);
	
	//�����û�����ѯ
	public Users getQueryByName(String uname);
	
	//�û���¼
	public Users getUserLogin(String uname,String upwd);
	
	//�����û�id��ѯ
	public Users getQueryById(int U_id);

	//ʵ����֤
	public boolean getUpdaIdcard(String u_name,String u_idcard,int u_id);
	
	//�޸�֧������
	public boolean getUpdaPaypwd(String u_paypwd,int u_id);
	//�����п�
	public boolean getUpdaBankcard(String u_bankcard,String u_paypwd,int u_id);
	
	//�޸ĵ�¼������ֻ���
	public boolean getUpdaPwdPh(String u_pwd,String u_phone,int u_id);
	
	// ����id�õ���һҳ
	public Users getQueryUsersPre(int UsersId);
	
	// ����id�õ���һҳ
	public Users getQueryUsersNext(int UsersId);
	
	// ����id�õ���һҳ
	public int getQueryMinUsers();
	
	// ����id�õ����һҳ
	public int getQueryMaxUsers();
	
	// ��ҳ����
	public PageData getQueryUsersByPage(int pageNo, int pageSize);
	
	// ģ����ѯ��ҳ
	public PageData getQueryLikeByPage(int pageNo, int pageSize, String search);

}
