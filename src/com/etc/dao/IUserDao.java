package com.etc.dao;

import java.util.List;
import com.etc.entity.Users;
import com.etc.util.PageData;

public interface IUserDao {

		//��ѯȫ���û�
		public List<Users> queryUserAll();
		
		//ɾ���û�
		public boolean deleUser(int U_id);
		
		//�޸��û�
		public boolean updaUser(Users user);
		
		//�޸��û�
		public boolean updaUser2(Users user);
		
		//ע���û�
		public boolean registerUser(Users user);

		//ģ����ѯ�û�
		public List<Users> queryByLikeName(String uname);
		
		//�����û�����ѯ
		public Users queryByName(String uname);

		//�û���¼
		public Users userLogin(String uName, String uPwd);		

		//�����û�id��ѯ
		public Users queryById(int U_id);

		//ʵ����֤
		public boolean updaIdcard(String u_name,String u_idcard,int u_id);
		
		//�޸�֧������
		public boolean updaPaypwd(String u_paypwd,int u_id);
		
		//�����п�
		public boolean updaBankcard(String u_bankcard,String u_paypwd,int u_id);
		
		//�޸ĵ�¼������ֻ���
		public boolean updaPwdPh(String u_pwd,String u_phone,int u_id);
		
		// ����id�õ���һҳ
		public Users queryUsersPre(int UsersId);
		
		// ����id�õ���һҳ
		public Users queryUsersNext(int UsersId);
		
		// ����id�õ���һҳ
		public int queryMinUsers();
		
		// ����id�õ����һҳ
		public int queryMaxUsers();
		
		// ��ҳ����
		public PageData queryUsersByPage(int pageNo, int pageSize);
		
		// ģ����ѯ��ҳ
		public PageData queryLikeByPage(int pageNo, int pageSize, String search);
}
