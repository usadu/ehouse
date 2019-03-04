package com.etc.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.rowset.CachedRowSet;
import com.etc.dao.IUserDao;
import com.etc.entity.Users;
import com.etc.util.DBUtil;
import com.etc.util.PageData;

public class UserDaoImpl implements IUserDao{
	//查询全部用户(不显示支付密码)
	public List<Users> queryUserAll(){
		CachedRowSet crs=DBUtil.execQuery("select * from users");
		List<Users> list=new ArrayList<>();
		Users user=null;
		try {
			while(crs.next()) {
				int u_id=crs.getInt(1);
				String u_nickname=crs.getString(2);
				String u_pwd=crs.getString(3);
				String u_name=crs.getString(4);
				String u_idcard=crs.getString(5);
				String u_phone=crs.getString(6);
				String u_paypwd=crs.getString(7);
				String u_bankcard=crs.getString(8);
				user=new Users(u_id,u_nickname,u_pwd,u_name,u_idcard,u_phone,u_paypwd,u_bankcard);
				list.add(user);	
		}
	}catch (SQLException e) {
		e.printStackTrace();
	}
		return list;	
	};
	
	//删除用户
	public boolean deleUser(int U_id){
		boolean flag=DBUtil.execUpdate("delete from users where U_id=?", U_id);
		return flag;
	};
	
	//修改用户信息(密码)
	public boolean updaUser(Users u) {
		return DBUtil.execUpdate("update users set U_pwd=? where U_id=?",u.getU_pwd(),u.getU_id());
		
	};
	
	//修改用户信息(密码,电话)
		public boolean updaUser2(Users u) {
			return DBUtil.execUpdate("update users set U_pwd=?,U_phone=? where U_id=?",u.getU_pwd(),u.getU_phone(),u.getU_id());
			
		};
	
	//注册(用户名，密码，手机号)
	@Override
	public boolean registerUser(Users u) {
		
		return DBUtil.execUpdate("insert into users values(null,?,?,null,null,?,null,null)",u.getU_nickname(),u.getU_pwd(),u.getU_phone());
	}
	
	//根据姓名查询用户（判断用户名是否存在）
	@Override
	public Users queryById(int U_id) {
		CachedRowSet crs=DBUtil.execQuery("select * from users where U_id=?",U_id);
		Users user=null;
		 try {
				while(crs.next()) {
					int u_id=crs.getInt(1);
					String u_nickname=crs.getString(2);
					String u_pwd=crs.getString(3);
					String u_name=crs.getString(4);
					String u_idcard=crs.getString(5);
					String u_phone=crs.getString(6);
					String u_bankcard=crs.getString(8);
					user=new Users(u_id,u_nickname,u_pwd,u_name,u_idcard,u_phone,u_bankcard);
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return user;
	}
	
	//根据姓名查询用户（判断用户名是否存在）
	@Override
	public Users queryByName(String uname) {
		CachedRowSet crs=DBUtil.execQuery("select * from users where U_nickname=?",uname);
		Users user=null;
		boolean flag=false;
		 try {
				while(crs.next()) {
					int u_id=crs.getInt(1);
					String u_nickname=crs.getString(2);
					String u_pwd=crs.getString(3);
					String u_name=crs.getString(4);
					String u_idcard=crs.getString(5);
					String u_phone=crs.getString(6);
					String u_paypwd=crs.getString(7);
					String u_bankcard=crs.getString(8);
					user=new Users(u_id,u_nickname,u_pwd,u_name,u_idcard,u_phone,u_bankcard);
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return user;
	}
	
	//模糊查询用户
	@Override
	public List<Users> queryByLikeName(String uname) {
		List<Users> list=new ArrayList<>();
		CachedRowSet crs=DBUtil.execQuery("select * from users where u_nickname like ? or u_name like ? or u_idcard like ?","%"+uname+"%","%"+uname+"%","%"+uname+"%");
		Users user=null;
		 try {
				while(crs.next()) {
					int u_id=crs.getInt(1);
					String u_nickname=crs.getString(2);
					String u_pwd=crs.getString(3);
					String u_name=crs.getString(4);
					String u_idcard=crs.getString(5);
					String u_phone=crs.getString(6);
					String u_paypwd=crs.getString(7);
					String u_bankcard=crs.getString(8);
					user=new Users(u_id,u_nickname,u_pwd,u_name,u_idcard,u_phone,u_paypwd,u_bankcard);
					list.add(user);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return list;
	}
	
	//登录验证
	@Override
	public Users userLogin(String uName, String uPwd) {
		CachedRowSet crs=DBUtil.execQuery("select * from users where U_nickname=? and U_pwd=?", uName,uPwd);
		Users user=null;
		try {
			while(crs.next()) {
				int u_id=crs.getInt(1);
				String u_nickname=crs.getString(2);
				String u_pwd=crs.getString(3);
				String u_name=crs.getString(4);
				String u_idcard=crs.getString(5);
				String u_phone=crs.getString(6);
				String u_paypwd=crs.getString(7);
				String u_bankcard=crs.getString(8);
				user=new Users(u_id,u_nickname,u_pwd,u_name,u_idcard,u_phone,u_paypwd,u_bankcard);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	//实名认证
	public boolean updaIdcard(String u_name,String u_idcard,int u_id){
		return DBUtil.execUpdate("update users set U_name=?,U_idcard=? where U_id=?",u_name,u_idcard,u_id);
		
	}
	
	//修改支付密码
	public boolean updaPaypwd(String u_paypwd,int u_id){
		return DBUtil.execUpdate("update users set U_paypwd=? where U_id=?",u_paypwd,u_id);
		
	}
	//绑定银行卡
	public boolean updaBankcard(String u_bankcard,String u_paypwd,int u_id){
		return DBUtil.execUpdate("update users set U_bankcard=?,U_paypwd=? where U_id=?",u_bankcard,u_paypwd,u_id);
		
	}
	//修改登录密码和手机号
	@Override
	public boolean updaPwdPh(String u_pwd, String u_phone, int u_id) {
		return DBUtil.execUpdate("update users set U_pwd=?,U_phone=? where U_id=?", u_pwd,u_phone,u_id);
	}

	// 根据id得到上一页
	@Override
	public Users queryUsersPre(int UsersId) {
		CachedRowSet crs=DBUtil.execQuery("select * from users where U_id < ? order by U_id desc limit 0,1",UsersId);
		Users user=null;
		 try {
				while(crs.next()) {
					int u_id=crs.getInt(1);
					String u_nickname=crs.getString(2);
					String u_pwd=crs.getString(3);
					String u_name=crs.getString(4);
					String u_idcard=crs.getString(5);
					String u_phone=crs.getString(6);
					String u_paypwd=crs.getString(7);
					String u_bankcard=crs.getString(8);
					user=new Users(u_id,u_nickname,u_pwd,u_name,u_idcard,u_phone,u_paypwd,u_bankcard);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return user;
	}

	// 根据id得到下一页
	@Override
	public Users queryUsersNext(int UsersId) {
		CachedRowSet crs=DBUtil.execQuery("select * from users where U_id > ? order by U_id asc limit 0,1",UsersId);
		Users user=null;
		 try {
				while(crs.next()) {
					int u_id=crs.getInt(1);
					String u_nickname=crs.getString(2);
					String u_pwd=crs.getString(3);
					String u_name=crs.getString(4);
					String u_idcard=crs.getString(5);
					String u_phone=crs.getString(6);
					String u_paypwd=crs.getString(7);
					String u_bankcard=crs.getString(8);
					user=new Users(u_id,u_nickname,u_pwd,u_name,u_idcard,u_phone,u_paypwd,u_bankcard);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return user;
	}

	// 根据id得到第一页
	@Override
	public int queryMinUsers() {
		CachedRowSet crs = DBUtil.execQuery("select min(u_id) from users");
		int minU_id = 0;
		try {
			while (crs.next()) {
				minU_id=crs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return minU_id;
	}

	// 根据id得到最后一页
	@Override
	public int queryMaxUsers() {
		CachedRowSet crs = DBUtil.execQuery("select max(u_id) from users");
		int minU_id = 0;
		try {
			while (crs.next()) {
				minU_id=crs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return minU_id;
	}

	// 分页方法
	@Override
	public PageData queryUsersByPage(int pageNo, int pageSize) {
		List<Users> data = new ArrayList<Users>();
		CachedRowSet crs = DBUtil.execQuery("select * from users limit ?,?", (pageNo - 1) * pageSize, pageSize);
		try {
			while(crs.next()) {
				int u_id=crs.getInt(1);
				String u_nickname=crs.getString(2);
				String u_pwd=crs.getString(3);
				String u_name=crs.getString(4);
				String u_idcard=crs.getString(5);
				String u_phone=crs.getString(6);
				String u_paypwd=crs.getString(7);
				String u_bankcard=crs.getString(8);
				Users user=new Users(u_id,u_nickname,u_pwd,u_name,u_idcard,u_phone,u_paypwd,u_bankcard);
				data.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		CachedRowSet crs2 = DBUtil.execQuery("select count(*) from users");
		int totalCount = 0;
		try {
			while (crs2.next()) {
				totalCount = crs2.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		PageData pageData = new PageData(data, pageNo, pageSize, totalCount);
		return pageData;
	}

	// 模糊查询分页
	@Override
	public PageData queryLikeByPage(int pageNo, int pageSize, String search) {
		List<Users> data = new ArrayList<Users>();
		CachedRowSet crs = DBUtil.execQuery("select * from users where u_nickname like ? or u_name like ? or u_idcard like ? ORDER BY U_id desc limit ?,?",
				"%" + search + "%", "%" + search + "%", "%" + search + "%", (pageNo - 1) * pageSize, pageSize);
		try {
			while(crs.next()) {
				int u_id=crs.getInt(1);
				String u_nickname=crs.getString(2);
				String u_pwd=crs.getString(3);
				String u_name=crs.getString(4);
				String u_idcard=crs.getString(5);
				String u_phone=crs.getString(6);
				String u_paypwd=crs.getString(7);
				String u_bankcard=crs.getString(8);
				Users user=new Users(u_id,u_nickname,u_pwd,u_name,u_idcard,u_phone,u_paypwd,u_bankcard);
				data.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		CachedRowSet crs2 = DBUtil.execQuery("select count(*) from users where u_nickname like ? or u_name like ? or u_idcard like ?",
				"%" + search + "%", "%" + search + "%", "%" + search + "%");
		int totalCount = 0;
		try {
			while (crs2.next()) {
				totalCount = crs2.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		PageData pageData = new PageData(data, pageNo, pageSize, totalCount);
		return pageData;
	}
	

}