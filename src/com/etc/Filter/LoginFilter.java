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
		//System.out.println("������ʿ�����");
		
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)res;
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		
		//��ȡ����url
		String url=request.getServletPath();
		//System.out.println(url);
		
		if(session.getAttribute("u")!=null) {
			//����
			chain.doFilter(req, res);
		}else{
			if("/front/denglu.jsp".equals(url) || "/front/regist.jsp".equals(url)) {
				//��¼��ע��������
				chain.doFilter(req, res);
			}else {
				//���û�е�¼����ת����¼ҳ��
				//response.sendRedirect("Login.jsp");
				chain.doFilter(req, res);//��ʱ����
				//out.println("<script>alert('���ȵ�¼');location.href='denglu.jsp';</script>");
			}
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
