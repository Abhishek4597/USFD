package com.mvc.controller;

import java.io.IOException;
import java.sql.SQLException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import com.mvc.beans.USFD_menu_beans;
import com.mvc.dao.DDL;

@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("andar aa gaye");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		
String action="";
action=request.getParameter("action");

	
		
		if (action.equals("getUSFDHeadMenu")){
			int headid=Integer.parseInt(request.getParameter("headid"));
			
System.out.println("sfsf");
			
		List<USFD_menu_beans> cdwcl = null;
		try {
			cdwcl = DDL.getUSFDMenus(headid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(cdwcl, new TypeToken<List<USFD_menu_beans>>() {}.getType());
		JsonArray jsonArray = element.getAsJsonArray();
		response.setContentType("application/json");
		response.getWriter().print(jsonArray);
		}
		
	
		if (action.equals("getUSFDSubMenu")){
			int menuid=Integer.parseInt(request.getParameter("menuid"));
			
			System.out.println("inside submenu");
			
		List<USFD_menu_beans> cdwcl = null;
		try {
			cdwcl = DDL.getUSFDSubMenus(menuid);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(cdwcl, new TypeToken<List<USFD_menu_beans>>() {}.getType());
		JsonArray jsonArray = element.getAsJsonArray();
	
		response.setContentType("application/json");
		response.getWriter().print(jsonArray);
		}
	
	
		if (action.equals("processDropdownSelections")) {
			String selectedPath = request.getParameter("selectedPath");
		    JSONObject json = new JSONObject();
		    
		    try {
		        String message = DDL.getResult(selectedPath);
		        json.put("status", 1);
		        json.put("message", message);
			    System.out.println(message);

		    } catch (Exception e) {
		        json.put("status", 0);
		        json.put("message", "Error: " + e.getMessage());
		        e.printStackTrace();
		    }
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().print(json.toString());
		    
		    return;
		}
			
	}

}
