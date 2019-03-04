package com.etc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;

import com.sun.rowset.CachedRowSetImpl;

/**
 * 数据库通用工具,返回连接,通用的增加,删除,修改的操作,查询待定;释放资源
 * @author Administrator
 *
 */
public class DBUtil {
	private static final String url="jdbc:mysql://192.168.13.62:3306/exf?characterEncoding=utf-8";
	/*private static final String url = "jdbc:mysql://localhost:3306/exf?characterEncoding=utf-8 & useSSL = false & serverTimezone = GMT";*/
	private static final String user="root";
	private static final String password="root";
	
	/**
	 * 返回一个连接对象
	 * @return 
	 * @throws SQLException
	 */
	public static Connection getConn() throws SQLException {
		//加载驱动(可以省略)
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return DriverManager.getConnection(url, user, password);
	}

	/**
	 * 通用的增加,删除,修改的操作
	 * Object... params:可变参数的数组
	 */
	public static boolean execUpdate(String sql,Object... params) {
		Connection con=null;
		PreparedStatement p=null;
		int n=0;
		try {
			 con=getConn();
			 //通过Connection对象得到prepareStatement
			 p=con.prepareStatement(sql);
			 //给?赋值
			 setPreparedStatement( p,params);
			 //执行sql
			 n=p.executeUpdate();
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//释放资源
			closeAll(null,p,con);
		}
		return n>0;
	}
	/**
	 * 补齐占位符?的值
	 * @param PreparedStatement 对象
	 * @param params 可变参数(数组)
	 */
	public static void setPreparedStatement(PreparedStatement p,Object... params) {
		if(null!=params && null!=p) {
			for (int i = 0; i < params.length; i++) {
				try {
					p.setObject(i+1, params[i]);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}
	/**
	 * 查询员工
	 */
	public static CachedRowSet execQuery(String sql,Object... params) {
		Connection conn=null;
		PreparedStatement p=null;
		ResultSet rs=null;
		CachedRowSet crs=null;
		try {
			 crs=new CachedRowSetImpl();
			 conn=getConn();
			 //通过conn获取PreparedStatement
			 p=conn.prepareStatement(sql);
			 //给?赋值
			 setPreparedStatement(p,params);
			 //要执行sql语句
			  rs=p.executeQuery();
			  //ResultSet与CachedRowSet之间的转换
			  crs.populate(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeAll(rs, p, conn);
		}
		//返回的是一个CachedRowSet;
		return crs;
	}
	
	
	/**
	 * 释放资源
	 */
	public static void closeAll(ResultSet rs,PreparedStatement p,Connection con ) {
		try {
			if(null!=rs)
			 rs.close();
			if(null!=p)
			 p.close();
			if(null!=con)
			 con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
