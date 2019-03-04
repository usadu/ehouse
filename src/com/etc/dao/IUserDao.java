package com.etc.dao;

import java.util.List;
import com.etc.entity.Users;
import com.etc.util.PageData;

public interface IUserDao {

		//查询全部用户
		public List<Users> queryUserAll();
		
		//删除用户
		public boolean deleUser(int U_id);
		
		//修改用户
		public boolean updaUser(Users user);
		
		//修改用户
		public boolean updaUser2(Users user);
		
		//注册用户
		public boolean registerUser(Users user);

		//模糊查询用户
		public List<Users> queryByLikeName(String uname);
		
		//根据用户名查询
		public Users queryByName(String uname);

		//用户登录
		public Users userLogin(String uName, String uPwd);		

		//根据用户id查询
		public Users queryById(int U_id);

		//实名认证
		public boolean updaIdcard(String u_name,String u_idcard,int u_id);
		
		//修改支付密码
		public boolean updaPaypwd(String u_paypwd,int u_id);
		
		//绑定银行卡
		public boolean updaBankcard(String u_bankcard,String u_paypwd,int u_id);
		
		//修改登录密码和手机号
		public boolean updaPwdPh(String u_pwd,String u_phone,int u_id);
		
		// 根据id得到上一页
		public Users queryUsersPre(int UsersId);
		
		// 根据id得到下一页
		public Users queryUsersNext(int UsersId);
		
		// 根据id得到第一页
		public int queryMinUsers();
		
		// 根据id得到最后一页
		public int queryMaxUsers();
		
		// 分页方法
		public PageData queryUsersByPage(int pageNo, int pageSize);
		
		// 模糊查询分页
		public PageData queryLikeByPage(int pageNo, int pageSize, String search);
}
