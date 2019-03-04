package com.etc.Filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		//System.out.println("进入访问控制器");
		
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)res;
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		
		//获取请求url
		String url=request.getServletPath();
		//System.out.println(url);
		
		if(session.getAttribute("u")!=null) {
			//放行
			chain.doFilter(req, res);
		}else{
			if("/front/denglu.jsp".equals(url) || "/front/regist.jsp".equals(url)) {
				//登录和注册界面放行
				chain.doFilter(req, res);
			}else {
				//如果没有登录就跳转到登录页面
				//response.sendRedirect("Login.jsp");
				chain.doFilter(req, res);//暂时放行
				//out.println("<script>alert('请先登录');location.href='denglu.jsp';</script>");
			}
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
