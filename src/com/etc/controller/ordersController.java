package com.etc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.management.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.apache.taglibs.standard.tag.el.fmt.ParseNumberTag;

import com.etc.dao.impl.OrdersDaoImpl;
import com.etc.entity.Orders;
import com.etc.service.impl.HouseDaoServiceImpl;
import com.etc.service.impl.orderServiceImpl;
import com.etc.util.PageData;
import com.google.gson.Gson;

import sun.awt.OSInfo;

/**
 * Servlet implementation class ordersController
 */
@WebServlet("/ordersController")
public class ordersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ordersController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String op=request.getParameter("op");
		//System.out.println(op);
		if(op!=null) {
			if("query".equals(op)) {
				query(request,response);
			}else if("deleteorder".equals(op)) {
				deleteorder(request,response);
			}else if("queryByPage".equals(op)) {
				queryByPage(request,response);
			}else if ("queryById".equals(op)) {
				queryById(request,response);
			}else if ("queryPre".equals(op)) {
				queryPre(request,response);
			}else if ("queryNext".equals(op)) {
				queryNext(request,response);
			}else if("addorder".equals(op)) {
				addorder(request,response);
			}
		}
	}
	
	
	
	private void addorder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		int hid=Integer.parseInt(request.getParameter("hid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		double price=Double.parseDouble(request.getParameter("price"));
		orderServiceImpl osi=new orderServiceImpl();
		boolean flag=osi.addOrder(uid,hid,price);
		//System.out.println(flag);
		if(flag) {
			HouseDaoServiceImpl hds=new HouseDaoServiceImpl();
			if(hds.updataState(hid)) 
			{
			out.print("购买成功");
			}else {
			out.print("不在出售中");
			}
		}else {
			out.print("购买失败");
		}
		out.close();
	}

	private void queryNext(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		//System.out.println("跳转成功");
		PrintWriter out=response.getWriter();
		int o_id=Integer.parseInt(request.getParameter("o_id")) ;
		int u_id=Integer.parseInt(request.getParameter("u_id")) ;
		//System.out.println(articleId);
		orderServiceImpl osi=new orderServiceImpl();
		Orders order=osi.getQueryNext(o_id,u_id);
		int max=osi.getQueryMaxOrder(u_id);
		Gson gson=new Gson();
		String str=gson.toJson(order);
		List<Object> list=new ArrayList<Object>();
		list.add(max);
		list.add(str);
		
		out.println(list);
		out.close();
	}

	private void queryPre(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		//System.out.println("跳转成功");
		PrintWriter out=response.getWriter();
		int o_id=Integer.parseInt(request.getParameter("o_id")) ;
		int u_id=Integer.parseInt(request.getParameter("u_id")) ;
		//System.out.println(articleId);
		orderServiceImpl osi=new orderServiceImpl();
		Orders order=osi.getQueryPre(o_id,u_id);
		int min=osi.getQueryMinOrder(u_id);
		Gson gson=new Gson();
		String str=gson.toJson(order);
		List<Object> list=new ArrayList<Object>();
		list.add(min);
		list.add(str);
		
		out.println(list);
		out.close();
	}

	private void queryById(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		//System.out.println("跳转成功");
		PrintWriter out=response.getWriter();
		int o_id=Integer.parseInt(request.getParameter("o_id")) ;
		//System.out.println(articleId);
		orderServiceImpl osi=new orderServiceImpl();
		Orders order=osi.getQueryById(o_id);
		Gson gson=new Gson();
		String str=gson.toJson(order);
		List<Object> list=new ArrayList<Object>();
		list.add(str);
		
		out.println(list);
		out.close();
	}

	private void queryByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pageNo=1;//默认值
		int pageSize=5;//默认值
		int u_id=Integer.parseInt(request.getParameter("uid"));
		if(request.getParameter("pageNo")!=null) {
			pageNo=Integer.parseInt(request.getParameter("pageNo")) ;
		}
		if(request.getParameter("pageSize")!=null) {
			pageSize=Integer.parseInt(request.getParameter("pageSize")) ;
		}
		//调用分页业务层
		PageData  pageData =new orderServiceImpl().getUserOrder(pageNo, pageSize, u_id);
		request.setAttribute("pageData", pageData);
		request.getRequestDispatcher("front/dingdan.jsp").forward(request, response);
		/*PrintWriter out=response.getWriter();
		request.setAttribute("pageData", pageData);
		request.getRequestDispatcher("front/dingdan.jsp").forward(request, response);
		Gson gson=new Gson();
		String str=gson.toJson(pageData);
		out.print(str);
		out.close();*/
		
	}

	private void deleteorder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*int oid=Integer.parseInt(request.getParameter("o_id"));
		int uid=Integer.parseInt(request.getParameter("u_id"));
		orderServiceImpl osi=new orderServiceImpl();
		boolean flag=osi.getdelteorders(oid);
		if (flag) {
			response.getWriter().println("<script>alert('删除成功');location.href='ordersController?op=queryByPage&u_id='"+uid+"</script>");
		}else {
			response.getWriter().println("<script>alert('删除失败');location.href='ordersController?op=queryByPage&u_id='"+uid+"</script>");
		}*/
	}
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		orderServiceImpl osi=new orderServiceImpl();
		List<Orders> list=osi.getQueryOrders();
		request.setAttribute("list", list);
		request.getRequestDispatcher("front/dingdan.jsp").forward(request, response);
		//System.out.println(list);
		/*Gson gson=new Gson();
		String str=gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.print(str);
		
		System.out.println("list");
		request.setAttribute("list", list);
		request.getRequestDispatcher("front/dingdan.jsp").forward(request, response);
		out.close();*/
	}

	/**
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
