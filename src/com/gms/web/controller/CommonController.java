package com.gms.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gms.web.command.Command;
import com.gms.web.constant.Action;
import com.gms.web.constant.Servlet;
import com.gms.web.domain.MemberBean;
import com.gms.web.service.MemberService;
import com.gms.web.service.MemberServiceImpl;
import com.gms.web.util.DispatcherServlet;
import com.gms.web.util.Separator;



@WebServlet("/common.do")
public class CommonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("common controller get 진입");
		Separator.init(request);
		switch (request.getParameter(Action.CMD)) {
		case Action.MOVE:
			DispatcherServlet.send(request, response);
			break;
		case Action.LOGIN:
			MemberService service=MemberServiceImpl.getInstance();
			MemberBean member=new MemberBean();
			member.setId(request.getParameter("id"));
			member.setPw(request.getParameter("password"));
			Separator.cmd.setPage(service.login(member));
			Separator.cmd.process();
			DispatcherServlet.send(request, response);
			break;
		default:
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("common controller post 진입");
	}

}
