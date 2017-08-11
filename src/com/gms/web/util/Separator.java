package com.gms.web.util;

import javax.servlet.http.HttpServletRequest;

import com.gms.web.command.Command;
import com.gms.web.constant.Servlet;
import com.gms.web.factory.CommandFactory;

public class Separator {
	public static Command cmd=new Command();
	public static void init(HttpServletRequest request){
		String action=request.getParameter("action");
		
		String page=request.getParameter("page");
		System.out.println("action : "+action);
		String servletPath=request.getServletPath(); 
		 		System.out.println("servletPath :" + servletPath); 
		String dir= servletPath.substring(1,servletPath.indexOf(".")); 
		 		System.out.println("directory: " + dir); 
		 		System.out.println("page:"+ page);
		cmd=CommandFactory.createCommand(dir, action, page);
		 		

	}
}
