package com.etc.service.impl;

import java.util.List;

import com.etc.dao.impl.UserDaoImpl;
import com.etc.entity.Users;
import com.etc.service.IUserService;
import com.etc.util.PageData;

public class UserServiceImpl implements IUserService{

	UserDaoImpl ud=new UserDaoImpl();
	
	@Override
	public List<Users> getQueryUserAll() {
		// TODO Auto-generated method stub
		return ud.queryUserAll();
	}

	@Override
	public boolean getDeleUser(int U_id) {
		// TODO Auto-generated method stub
		return ud.deleUser(U_id);
	}

	@Override
	public boolean getUpdaUser(Users user) {
		// TODO Auto-generated method stub
		return ud.updaUser(user);
	}

	@Override
	public boolean getRegisterUser(Users user) {
		// TODO Auto-generated method stub
		return ud.registerUser(user);
	}

	@Override
	public Users getUserLogin(String uname, String upwd) {
		// TODO Auto-generated method stub
		return ud.userLogin(uname, upwd);
	}

	@Override
	public List<Users> getQueryByLikeName(String uname) {
		// TODO Auto-generated method stub
		return ud.queryByLikeName(uname);
	}

	@Override
	public Users getQueryByName(String uname) {
		// TODO Auto-generated method stub
		return ud.queryByName(uname);
	}

	@Override
	public Users getQueryById(int U_id) {
		// TODO Auto-generated method stub
		return ud.queryById(U_id);
	}

	@Override
	public boolean getUpdaIdcard(String u_name, String u_idcard, int u_id) {
		// TODO Auto-generated method stub
		return ud.updaIdcard(u_name, u_idcard, u_id);
	}

	@Override
	public boolean getUpdaPaypwd(String u_paypwd, int u_id) {
		// TODO Auto-generated method stub
		return ud.updaPaypwd(u_paypwd, u_id);
	}

	@Override
	public boolean getUpdaBankcard(String u_bankcard, String u_paypwd, int u_id) {
		// TODO Auto-generated method stub
		return ud.updaBankcard(u_bankcard, u_paypwd, u_id);
	}
	//修改登录密码和手机号
	@Override
	public boolean getUpdaPwdPh(String u_pwd, String u_phone, int u_id) {
		// TODO Auto-generated method stub
		return ud.updaPwdPh(u_pwd, u_phone, u_id);
	}

	@Override
	public boolean getUpdaUser2(Users user) {
		// TODO Auto-generated method stub
		return ud.updaUser2(user);
	}

	@Override
	public Users getQueryUsersPre(int UsersId) {
		// TODO Auto-generated method stub
		return ud.queryUsersPre(UsersId);
	}

	@Override
	public Users getQueryUsersNext(int UsersId) {
		// TODO Auto-generated method stub
		return ud.queryUsersNext(UsersId);
	}

	@Override
	public int getQueryMinUsers() {
		// TODO Auto-generated method stub
		return ud.queryMinUsers();
	}

	@Override
	public int getQueryMaxUsers() {
		// TODO Auto-generated method stub
		return ud.queryMaxUsers();
	}

	@Override
	public PageData getQueryUsersByPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return ud.queryUsersByPage(pageNo, pageSize);
	}

	@Override
	public PageData getQueryLikeByPage(int pageNo, int pageSize, String search) {
		// TODO Auto-generated method stub
		return ud.queryLikeByPage(pageNo, pageSize, search);
	}
}
