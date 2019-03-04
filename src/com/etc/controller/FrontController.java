package com.etc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.entity.Users;
import com.etc.service.impl.UserServiceImpl;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String op = request.getParameter("op");
		// 将用户信息存储在session对象中
	//	Object obj = session.getAttribute("u");
		if ("login".equals(op)) {
			login(request, response);
		} 
		/*else if (null != obj) {
			if ("query".equals(op)) {
			}
		} */
		else if ("Logout".equals(op)) {// 退出登录
			Logout(request, response);
		} else if ("checkName".equals(op)) {// 判断用户名是否重复
			checkName(request, response);
		} else if ("register".equals(op)) {// 注册用户
			register(request, response);
		} else {
			response.sendRedirect("front/login.jsp");
		}

	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		String uname = request.getParameter("ureName");
		String upwd = request.getParameter("urePwd");
		String phone = request.getParameter("phone");
		//System.out.println(uname+upwd+phone);
		boolean flag = new UserServiceImpl().getRegisterUser(new Users(uname, upwd, phone));
		if (flag) {
			response.getWriter().println("<script>alert('注册成功,请登录');location.href='front/login.jsp'</script>");
		}else {
			response.getWriter().println("<script>alert('注册失败,请重新注册');location.href='front/login.jsp'</script>");
		}

	}

	private void checkName(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// System.out.println("ddddd");
		response.setContentType("text/html");
		String uname = request.getParameter("ureName");
		// System.out.println(uname);
		PrintWriter out = response.getWriter();
		// 调用数据库
		Users user = new UserServiceImpl().getQueryByName(uname);
		// System.out.println(user);
		// 判断u是否存在
		if (null != user) {
			out.print("用户名已存在！");
		} else {
			out.print("用户名可用");
		}

	}

	private void Logout(HttpServletRequest request, HttpServletResponse response) throws IOException {

		request.getSession().removeAttribute("u");
		response.sendRedirect("front/login.jsp");

	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		UserServiceImpl us = new UserServiceImpl();
		//System.out.println(userName + userPwd);
		// 调用业务层
		Users u = us.getUserLogin(userName, userPwd);
		if (null != u) {
			
			// 判断用户是否选择了记住密码
			String remePwd = request.getParameter("remember-me");
			if (remePwd != null && remePwd.equals("remember-me")) {
				//System.out.println("用户选择记住密码" + remePwd);
				// 存
				Cookie cookie1 = new Cookie("userName", URLEncoder.encode(u.getU_nickname(), "utf-8"));
				Cookie cookie2 = new Cookie("userPwd", u.getU_pwd());
				Cookie cookie3 = new Cookie("isChecked", "checked");
				response.addCookie(cookie1);
				response.addCookie(cookie2);
				response.addCookie(cookie3);
			} 
			// 提升：访问控制-》登录成功应该通过session存储用户登录信息
			session = request.getSession();
			// 将用户信息存储在session对象中
			session.setAttribute("u", u);
			//String t_name=u.getU_nickname();
			
			// 管理员登陆成功显示后台文章管理界面
			request.getRequestDispatcher("front/sy.jsp").forward(request, response);
		} else {
			
			response.sendRedirect("front/login.jsp");
			
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
