package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestBookDao;
import com.javaex.util.WebUtil;
import com.javaex.vo.GuestBookVo;

@WebServlet("/gbc")
public class GuestBookController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GuestBookDao guestBookDao = new GuestBookDao();
		String action = request.getParameter("action");
		
		
		    /**************** 리스트 ****************/
		if("addList".equals(action)) {
			System.out.println("[리스트]");
			
			List<GuestBookVo> guestList = guestBookDao.getGuestList();
			
			request.setAttribute("gList", guestList);
			WebUtil.forword(request, response, "/WEB-INF/addList.jsp");
			/**************** 등록 ****************/
		}else if("add".equals(action)) {
			System.out.println("[저장]");
			
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String content = request.getParameter("content");
		
			
			GuestBookVo guestBookVo = new GuestBookVo(name, password, content);
			guestBookDao.guestInsert(guestBookVo);
			
			WebUtil.redirect(request, response, "/guestbook2/gbc?action=addList");
			/**************** 삭제폼 ****************/
		}else if("deleteForm".equals(action)) {
			System.out.println("[삭제폼]");
			
			int no = Integer.parseInt(request.getParameter("no"));
			request.setAttribute("no", no);
			
			WebUtil.forword(request, response, "/WEB-INF/deleteForm.jsp");
			/**************** 삭제 ****************/
		}else if("delete".equals(action)) {
			String password = request.getParameter("password");
			int no = Integer.parseInt(request.getParameter("no"));

			int count = guestBookDao.guestDelete(no, password);
			WebUtil.redirect(request, response, "/guestbook2/gbc?action=addList");
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
