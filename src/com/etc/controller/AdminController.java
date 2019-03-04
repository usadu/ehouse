package com.etc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.etc.entity.Admins;
import com.etc.entity.Areas;
import com.etc.entity.House;
import com.etc.entity.HouseState;
import com.etc.entity.HouseType;
import com.etc.entity.Units;
import com.etc.entity.Users;
import com.etc.service.impl.AdminServiceImpl;
import com.etc.service.impl.UserServiceImpl;
import com.etc.util.PageData;
import com.google.gson.Gson;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<Users> list = new ArrayList<>();
	Users user; 
	PageData pageData;
	HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("unused")//����
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String op = request.getParameter("op");
		// ���û���Ϣ�洢��session������
		/*Object obj = session.getAttribute("ad");*/
		if ("login".equals(op)) {
			login(request, response);
		} else if ("qtLogout".equals(op)) {
			qtLogout(request, response);
		} else if ("register".equals(op)) {
			register(request, response);
		} else if (true/*null != obj*/) {
			if ("del".equals(op)) {
				del(request, response);
			} else if ("upd".equals(op)) {
				upd(request, response);
			}  else if ("addUser".equals(op)) {
				addUser(request, response);
			} else if ("queryLikeByPage".equals(op)) {
				queryLikeByPage(request, response);
			} else if ("checkUserName".equals(op)) {
				checkUserName(request, response);
			} else if ("adm".equals(op)) {
				adm(request, response);
			} else if ("delAdm".equals(op)) {
				delAdm(request, response);
			} else if ("updAdm".equals(op)) {
				updAdm(request, response);
			} else if ("houseShowByPage".equals(op)) {
				houseShowByPage(request, response);
			} else if ("delhouse".equals(op)) {
				delhouse(request, response);
			} else if ("queryHT".equals(op)) {
				queryHT(request, response);
			} else if ("queryHX".equals(op)) {
				queryHX(request, response);
			} else if ("queryHA".equals(op)) {
				queryHA(request, response);
			} else if ("queryHS".equals(op)) {
				queryHS(request, response);
			} else if ("addHouse".equals(op)) {
				addHouse(request, response);
			} else if ("updHouse".equals(op)) {
				updHouse(request, response);
			} else if ("ordersShowByPage".equals(op)) {
				ordersShowByPage(request, response);
			} else if ("delOrder".equals(op)) {
				delOrder(request, response);
			} else if ("delHT".equals(op)) {
				delHT(request, response);
			} else if ("delHX".equals(op)) {
				delHX(request, response);
			} else if ("delHA".equals(op)) {
				delHA(request, response);
			} else if ("delHS".equals(op)) {
				delHS(request, response);
			} else if ("addHT".equals(op)) {
				addHT(request, response);
			} else if ("addHX".equals(op)) {
				addHX(request, response);
			} else if ("addHA".equals(op)) {
				addHA(request, response);
			} else if ("addHS".equals(op)) {
				addHS(request, response);
			} 
		}else if ("checkName".equals(op)) {
			checkName(request,response);
		} else {
			response.sendRedirect("${pageContext.request.contextPath}/mvc/sign.jsp");
		}
	}

	private void addHS(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ���״̬
		response.setContentType("application/json");
		String hs=request.getParameter("hs");
		new AdminServiceImpl().addHS(hs);
		List<HouseState> list = new AdminServiceImpl().queryAllHState();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
		
	}

	private void addHA(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ��ӵ���
		response.setContentType("application/json");
		String ha=request.getParameter("ha");
		new AdminServiceImpl().addHA(ha);
		List<Areas> list = new AdminServiceImpl().queryAllHArea();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
		
	}

	private void addHX(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ��ӻ���
		response.setContentType("application/json");
		String hx=request.getParameter("hx");
		String ph=request.getParameter("ph");
		new AdminServiceImpl().addHX(hx, ph);
		List<Units> list = new AdminServiceImpl().queryAllHx();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
		
	}

	private void addHT(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// �������
		response.setContentType("application/json");
		String ht=request.getParameter("ht");
		new AdminServiceImpl().addHT(ht);
		List<HouseType> list = new AdminServiceImpl().queryAllHtype();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
		
	}

	private void delHS(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ɾ��״̬
		response.setContentType("application/json");
		int id =Integer.parseInt(request.getParameter("id"));
		new AdminServiceImpl().delHS(id);
		List<HouseState> list = new AdminServiceImpl().queryAllHState();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
		
	}

	private void delHA(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ɾ������
		response.setContentType("application/json");
		int id =Integer.parseInt(request.getParameter("id"));
		new AdminServiceImpl().delHA(id);
		List<Areas> list = new AdminServiceImpl().queryAllHArea();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
		
	}

	private void delHX(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ɾ������
		response.setContentType("application/json");
		int id =Integer.parseInt(request.getParameter("id"));
		new AdminServiceImpl().delHx(id);
		List<Units> list = new AdminServiceImpl().queryAllHx();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
		
	}

	private void delHT(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ɾ������
		response.setContentType("application/json");
		int id =Integer.parseInt(request.getParameter("id"));
		new AdminServiceImpl().delHT(id);
		List<HouseType> list = new AdminServiceImpl().queryAllHtype();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
		
	}

	private void delOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ɾ������
		response.setContentType("application/json");
		int id =Integer.parseInt(request.getParameter("id"));
		new AdminServiceImpl().delOrder(id);
		String search = "";// Ĭ��ֵ
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		pageData = new AdminServiceImpl().queryOLikeByPage(1, 7, search);
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(pageData);
		out.print(str);
		out.close();
		
	}

	private void ordersShowByPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ����ģ����ѯ��ҳ
		response.setContentType("application/json");
		int pageNo = 1;// Ĭ��ֵ
		int pageSize = 7;// Ĭ��ֵ
		String search = "";// Ĭ��ֵ
		if (request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		if (request.getParameter("pageSize") != null) {
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		}
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		pageData = new AdminServiceImpl().queryOLikeByPage(pageNo, pageSize, search);
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(pageData);
		out.print(str);
		out.close();
		
	}

	private void checkName(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("aaaa");
		//�жϹ���Ա���Ƿ��ظ�
		response.setContentType("text/html");
		String a_name = request.getParameter("ureName");
		PrintWriter out = response.getWriter();
		Admins admins=new AdminServiceImpl().getQueryByName(a_name);
		if (null != admins) {
			out.print("�û����Ѵ��ڣ�");
		} else {
			out.print("�û�������");
		}
	}

	private void addHouse(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/// ��ӷ���
		response.setContentType("application/json");
		String H_name=request.getParameter("H_name");
		int Ht_id =Integer.parseInt(request.getParameter("Ht_id"));
		int Un_id =Integer.parseInt(request.getParameter("Un_id"));
		double H_unitprice=Double.parseDouble(request.getParameter("H_unitprice"));
		double H_area=Double.parseDouble(request.getParameter("H_area"));
		int Hs_id =Integer.parseInt(request.getParameter("Hs_id"));
		String H_time=request.getParameter("H_time");
		String H_photo=request.getParameter("H_photo");
		int Areas_id =Integer.parseInt(request.getParameter("Areas_id"));
		House h=new House(H_name,Ht_id,Un_id,H_unitprice,H_area,Hs_id,H_time,H_photo,Areas_id);
		new AdminServiceImpl().addHouse(h);
		String search = "";// Ĭ��ֵ
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		pageData = new AdminServiceImpl().queryHLikeByPage(1, 7, search);
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(pageData);
		out.print(str);
		out.close();
		
	}

	private void updHouse(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/// �޸ķ���
		response.setContentType("application/json");
		int H_id =Integer.parseInt(request.getParameter("H_id"));
		String H_name=request.getParameter("H_name");
		int Ht_id =Integer.parseInt(request.getParameter("Ht_id"));
		int Un_id =Integer.parseInt(request.getParameter("Un_id"));
		double H_unitprice=Double.parseDouble(request.getParameter("H_unitprice"));
		double H_area=Double.parseDouble(request.getParameter("H_area"));
		int Hs_id =Integer.parseInt(request.getParameter("Hs_id"));
		String H_time=request.getParameter("H_time");
		String H_photo=request.getParameter("H_photo");
		int Areas_id =Integer.parseInt(request.getParameter("Areas_id"));
		House h=new House(H_id,H_name,Ht_id,Un_id,H_unitprice,H_area,Hs_id,H_time,H_photo,Areas_id);
		new AdminServiceImpl().updHouse(h);
		String search = "";// Ĭ��ֵ
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		pageData = new AdminServiceImpl().queryHLikeByPage(1, 7, search);
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(pageData);
		out.print(str);
		out.close();
	}

	private void queryHS(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ��ѯ���з���״̬
		response.setContentType("application/json");
		List<HouseState> list = new AdminServiceImpl().queryAllHState();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
		
	}

	private void queryHA(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ��ѯ���з��ӵ���
		response.setContentType("application/json");
		List<Areas> list = new AdminServiceImpl().queryAllHArea();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
		
	}

	private void queryHX(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ��ѯ���з��ӻ���
		response.setContentType("application/json");
		List<Units> list = new AdminServiceImpl().queryAllHx();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
		
	}

	private void queryHT(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ��ѯ���з�������
		response.setContentType("application/json");
		List<HouseType> list = new AdminServiceImpl().queryAllHtype();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
	}

	private void delhouse(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ɾ������
		response.setContentType("application/json");
		int id =Integer.parseInt(request.getParameter("id"));
		new AdminServiceImpl().delHouse(id);
		String search = "";// Ĭ��ֵ
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		pageData = new AdminServiceImpl().queryHLikeByPage(1, 7, search);
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(pageData);
		out.print(str);
		out.close();
		
	}

	private void houseShowByPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ģ����ѯ���ӷ�ҳ
		response.setContentType("application/json");
		int pageNo = 1;// Ĭ��ֵ
		int pageSize = 7;// Ĭ��ֵ
		String search = "";// Ĭ��ֵ
		if (request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		if (request.getParameter("pageSize") != null) {
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		}
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		pageData = new AdminServiceImpl().queryHLikeByPage(pageNo, pageSize, search);
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(pageData);
		out.print(str);
		out.close();
		
	}

	private void updAdm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ����Ա�޸�
		response.setContentType("application/json");
		int id =Integer.parseInt(request.getParameter("id"));
		String pwd=request.getParameter("pwd");
		Admins ad=new Admins(id, null, pwd);
		new AdminServiceImpl().getUpdaAdmin(ad);
		List<Admins> list = new AdminServiceImpl().getQueryAdminAll();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
		
	}

	private void delAdm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ����Աɾ��
		response.setContentType("application/json");
		int id =Integer.parseInt(request.getParameter("id"));
		new AdminServiceImpl().getDeleAdmin(id);
		List<Admins> list = new AdminServiceImpl().getQueryAdminAll();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
		
	}

	private void adm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ����Ա����
		response.setContentType("application/json");
		List<Admins> list = new AdminServiceImpl().getQueryAdminAll();
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(list);
		out.print(str);
		out.close();
	}
	private void checkUserName(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// �ж��û��˺��Ƿ��ظ�
		response.setContentType("text/html");
		String unickname = request.getParameter("unickname");
		PrintWriter out = response.getWriter();
		Users us = new UserServiceImpl().getQueryByName(unickname);
		if (null != us) {
			out.print("�û����Ѵ��ڣ�");
		} else {
			out.print("�û�������");
		}
		
	}

	private void queryLikeByPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ģ����ѯ�û���ҳ
		response.setContentType("application/json");
		int pageNo = 1;// Ĭ��ֵ
		int pageSize = 7;// Ĭ��ֵ
		String search = "";// Ĭ��ֵ
		if (request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		if (request.getParameter("pageSize") != null) {
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		}
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		pageData = new UserServiceImpl().getQueryLikeByPage(pageNo, pageSize, search);
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(pageData);
		out.print(str);
		out.close();
	}

	private void addUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ����û�
		response.setContentType("application/json");
		String nickname=request.getParameter("nickname");
		String pwd=request.getParameter("pwd");
		String uphone=request.getParameter("uphone");
		user=new Users(nickname,pwd, null, null, uphone, null, null);
		new UserServiceImpl().getRegisterUser(user);
		String search = "";// Ĭ��ֵ
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		pageData = new UserServiceImpl().getQueryLikeByPage(1, 7, search);
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(pageData);
		out.print(str);
		out.close();
		
	}

	private void upd(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// �޸��û�
		response.setContentType("application/json");
		int id =Integer.parseInt(request.getParameter("id"));
		String pwd=request.getParameter("pwd");
		String phone=request.getParameter("phone");
		user=new Users(id,null,pwd, null, null, phone, null, null);
		new UserServiceImpl().getUpdaUser2(user);
		String search = "";// Ĭ��ֵ
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		pageData = new UserServiceImpl().getQueryLikeByPage(1, 7, search);
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(pageData);
		out.print(str);
		out.close();		
	}

	private void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ɾ���û�
		response.setContentType("application/json");
		int id =Integer.parseInt(request.getParameter("id"));
		new UserServiceImpl().getDeleUser(id);
		String search = "";// Ĭ��ֵ
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		pageData = new UserServiceImpl().getQueryLikeByPage(1, 7, search);
		PrintWriter out = response.getWriter();
		String str = new Gson().toJson(pageData);
		out.print(str);
		out.close();	
	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ע���û�
		response.setContentType("text/html");
		String uname = request.getParameter("ureName");
		String upwd = request.getParameter("urePwd");
		Admins ad = new Admins(uname, upwd);
		boolean flag = new AdminServiceImpl().getAddAdmin(ad);
		if (flag) {
			response.getWriter().println("<script>alert('ע��ɹ�');location.href='mvc/sign.jsp'</script>");
		}
	}

	private void qtLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// �˳���¼
		request.getSession().removeAttribute("ad");
		response.sendRedirect("${pageContext.request.contextPath}/mvc/sign.jsp");

	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ����Ա��¼
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		AdminServiceImpl as = new AdminServiceImpl();
		Admins ad = as.getAdminLogin(userName, userPwd);
		if (null != ad) {
			// �ж��û��Ƿ�ѡ���˼�ס����
			String remePwd = request.getParameter("remember-me");
			if (remePwd != null && remePwd.equals("remember-me")) {
				System.out.println("�û�ѡ���ס����" + remePwd);
				Cookie cookie1 = new Cookie("userName", URLEncoder.encode(ad.getA_name(), "utf-8"));
				Cookie cookie2 = new Cookie("userPwd", ad.getA_pwd());
				Cookie cookie3 = new Cookie("isChecked", "checked");
				response.addCookie(cookie1);
				response.addCookie(cookie2);
				response.addCookie(cookie3);
				// ����Ա��½�ɹ���ʾ��̨���¹������
				request.getRequestDispatcher("mvc/admIndex.jsp").forward(request, response);
				// ���������ʿ���-����¼�ɹ�Ӧ��ͨ��session�洢�û���¼��Ϣ
				session = request.getSession();
				// ���û���Ϣ�洢��session������
				session.setAttribute("ad", ad);
			} else {
				// ����Ա��½�ɹ���ʾ��̨���¹������
				request.getRequestDispatcher("mvc/admIndex.jsp").forward(request, response);
				// ���������ʿ���-����¼�ɹ�Ӧ��ͨ��session�洢�û���¼��Ϣ
				session = request.getSession();
				// ���û���Ϣ�洢��session������
				session.setAttribute("ad", ad);
			}
		} else {
			response.sendRedirect("mvc/sign.jsp");
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
