package com.etc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.entity.Areas;
import com.etc.entity.House;
import com.etc.entity.HouseState;
import com.etc.service.impl.HouseDaoServiceImpl;
import com.etc.util.PageData;
import com.google.gson.Gson;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/HouseController")
public class HouseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	HouseDaoServiceImpl hds=new HouseDaoServiceImpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HouseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String op=request.getParameter("op");
		if("houseType".equals(op)) {
			Alltype(request,response);
		}else if("queryhousebytname".equals(op)) {
			qhbytnam(request,response);
		}else if("houseunits".equals(op)) {
			Allunits(request,response);
		}else if("qbyuntisname".equals(op)){
			qbyuname(request,response);
		}else if("addoption".equals(op)) {
			Addoption(request,response);
		}else if("queryallbyareaid".equals(op)) {
			qAllbyaid(request,response);
		}else if("housebyid".equals(op)) {
			qhbyid(request,response);
		}
		
	}
	private void qhbyid(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int	hid=Integer.parseInt(request.getParameter("hid"));
		//通过id查房源
		House h=hds.houseXqById(hid);
		
		Gson gson=new Gson();
		String string=gson.toJson(h);
		PrintWriter out=response.getWriter();
		out.print(string);
		out.close();
		
		}

	private void qAllbyaid(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out=response.getWriter();
		int areaid=Integer.parseInt(request.getParameter("areaid"));
		List<House> list=hds.queryByAreasId(areaid);
		Gson gson=new Gson();
		String string=gson.toJson(list);
		
		out.print(string);
		out.close();
	}

	private void Addoption(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Areas> list=hds.queryAllAreas();
		Gson gson=new Gson();
		String string=gson.toJson(list);
		PrintWriter out=response.getWriter();
		out.print(string);
		out.close();
	}
	/**
	 * 地区下通过房型查房源
	 */
	private void qbyuname(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pageNo=1;
		int pageSizes=5;
		if(request.getParameter("page")!=null){
			//设置第几页
			int page=Integer.parseInt(request.getParameter("page"));
			pageNo=page;
		}
		String uname=request.getParameter("name");
		PrintWriter out=response.getWriter();
		int areaid=Integer.parseInt(request.getParameter("areaid"));
		
		PageData pd=hds.queryByUnitsName(uname,areaid,pageNo,pageSizes);
		Gson gson=new Gson();
		String string=gson.toJson(pd);
		out.print(string);
		out.close();
	}

	private void Allunits(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		List<String> list=hds.queryAllunits();
		Gson gson=new Gson();
		String string=gson.toJson(list);
		out.print(string);
		out.close();
	}

	/**
	 * 地区下通过类型名查房源
	 *
	 */
	private void qhbytnam(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pageNo=1;
		int pageSizes=5;
		if(request.getParameter("page")!=null){
			//设置第几页
			int page=Integer.parseInt(request.getParameter("page"));
			
			pageNo=page;
		}
		
		String tname=request.getParameter("name");
	
		PrintWriter out=response.getWriter();
		int areaid=Integer.parseInt(request.getParameter("areaid"));
		PageData pd=hds.queryByTypeName(tname,areaid,pageNo,pageSizes);
		Gson gson=new Gson();
		String string=gson.toJson(pd);
		out.print(string);
		out.close();
	}
	/**
	 * 差所有的房源类型
	 */
	private void Alltype(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		//HouseDaoServiceImpl hds=new HouseDaoServiceImpl();
		List<String> list=hds.queryAlltype();
		Gson gson=new Gson();
		String string=gson.toJson(list);
		PrintWriter out=response.getWriter();
		out.print(string);
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
