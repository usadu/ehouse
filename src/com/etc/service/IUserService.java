package com.etc.service;

import java.util.List;

import com.etc.entity.Users;
import com.etc.util.PageData;

public interface IUserService {
	
	//查询全部用户
	public List<Users> getQueryUserAll();
	
	//删除用户
	public boolean getDeleUser(int U_id);
	
	//修改用户
	public boolean getUpdaUser(Users user);
	
	//修改用户
	public boolean getUpdaUser2(Users user);
	
	//注册用户
	public boolean getRegisterUser(Users user);

	//模糊查询用户
	public List<Users> getQueryByLikeName(String uname);
	
	//根据用户名查询
	public Users getQueryByName(String uname);
	
	//用户登录
	public Users getUserLogin(String uname,String upwd);
	
	//根据用户id查询
	public Users getQueryById(int U_id);

	//实名认证
	public boolean getUpdaIdcard(String u_name,String u_idcard,int u_id);
	
	//修改支付密码
	public boolean getUpdaPaypwd(String u_paypwd,int u_id);
	//绑定银行卡
	public boolean getUpdaBankcard(String u_bankcard,String u_paypwd,int u_id);
	
	//修改登录密码和手机号
	public boolean getUpdaPwdPh(String u_pwd,String u_phone,int u_id);
	
	// 根据id得到上一页
	public Users getQueryUsersPre(int UsersId);
	
	// 根据id得到下一页
	public Users getQueryUsersNext(int UsersId);
	
	// 根据id得到第一页
	public int getQueryMinUsers();
	
	// 根据id得到最后一页
	public int getQueryMaxUsers();
	
	// 分页方法
	public PageData getQueryUsersByPage(int pageNo, int pageSize);
	
	// 模糊查询分页
	public PageData getQueryLikeByPage(int pageNo, int pageSize, String search);

}
