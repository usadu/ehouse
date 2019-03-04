package com.etc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.entity.Users;
import com.etc.service.impl.UserServiceImpl;

/**
 * Servlet implementation class DatumController
 */
@WebServlet("/DatumController")
public class DatumController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DatumController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String op = request.getParameter("op");
		
		if("payPwd".equals(op)) {
			payPwd(request,response);
		}else if ("icard".equals(op)) {
			icard(request,response);
		}else if ("bank".equals(op)) {
			bank(request,response);
		}else if ("pwdph".equals(op)) {
			pwdph(request,response);
		}
	}

	private void pwdph(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		//System.out.println("修改密码");
		response.setContentType("text/html");
		int u_id=Integer.parseInt(request.getParameter("u_id"));
		String pwd = request.getParameter("pwd");
		String phone = request.getParameter("phone");
		//System.out.println(pwd+phone+u_id);
		boolean flag =new UserServiceImpl().getUpdaPwdPh(pwd,phone,u_id);
		if (flag) {
			response.getWriter().println("<script>alert('登录密码和手机号码修改成功,请重新登录');location.href='front/login.jsp'</script>");
		}
	}

	private void bank(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		int u_id=Integer.parseInt(request.getParameter("u_id"));
		String paypwd1 = request.getParameter("paypwd1");
		String bankcard = request.getParameter("bankcard");
		boolean flag =new UserServiceImpl().getUpdaBankcard(bankcard,paypwd1,u_id);
		if (flag) {
			response.getWriter().println("<script>alert('绑定成功，银行卡信息将在下次登录后刷新');location.href='front/datum.jsp'</script>");
			
		}
	}

	private void icard(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		//System.out.println("dddd");
		//System.out.println(request.getParameter("u_id"));
		int u_id=Integer.parseInt(request.getParameter("u_id"));
		//System.out.println(u_id);
		String username = request.getParameter("username");
		String idcard = request.getParameter("idcard");
		boolean flag =new UserServiceImpl().getUpdaIdcard(username,idcard,u_id);
		if (flag) {
			response.getWriter().println("<script>alert('认证成功，身份信息将在下次登录后刷新');location.href='front/datum.jsp'</script>");
		
		}
	}

	private void payPwd(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		//System.out.println("lll");
		int u_id=Integer.parseInt(request.getParameter("u_id"));
		String paypwd1 = request.getParameter("paypwd1");
		//System.out.println(paypwd1+u_id);
		boolean flag =new UserServiceImpl().getUpdaPaypwd(paypwd1,u_id);
		if (flag) {
			response.getWriter().println("<script>alert('支付密码修改成功');location.href='front/datum.jsp'");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
