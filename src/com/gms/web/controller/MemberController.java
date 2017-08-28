package com.gms.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gms.web.command.Command;
import com.gms.web.constant.Action;
import com.gms.web.dao.MemberDaoImpl;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.proxy.BlockHandler;
import com.gms.web.proxy.PageHandler;
import com.gms.web.proxy.PageProxy;
import com.gms.web.service.MemberService;
import com.gms.web.service.MemberServiceImpl;
import com.gms.web.util.DispatcherServlet;
import com.gms.web.util.ParamsIterator;
import com.gms.web.util.Separator;


@WebServlet("/member.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("member controller 진입");
		Separator.init(request);
		MemberBean member= new MemberBean();
		MemberService service=MemberServiceImpl.getInstance();
		Command cmd=new Command();
		PageProxy pxy=new PageProxy(request);
		pxy.setPageSize(5);
		pxy.setBlockSize(5);
		switch (request.getParameter(Action.CMD)) {
		case Action.MOVE:
			DispatcherServlet.send(request, response);
			break;
		case Action.ADD:
			System.out.println("add 진입");
			Map<?,?> map=ParamsIterator.execute(request);
			member.setId((String)map.get("id"));
			member.setPw((String)map.get("password"));
			member.setName((String)map.get("name"));
			member.setSsn((String)map.get("birthday"));
			member.setEmail((String)map.get("email"));
			member.setPhone((String)map.get("phone"));
			member.setProfile((String)map.get("profile"));
			// major 은 여러행을 입력해야함
		
			String[] subjects=((String)map.get("subject")).split(",");
			List<MajorBean> list= new ArrayList<>();
			MajorBean major=null;
		for(int i=0;i<subjects.length;i++){
				major=new MajorBean();
				major.setMajorId(String.valueOf((int)(Math.random()*1000)+1));
				major.setTitle((String)map.get("name"));	
				major.setId((String)map.get("id"));
				major.setSubjId(subjects[i]);
				list.add(major);
			}
				
			Map<String,Object>tempMap=new HashMap<>();
			tempMap.put("member", member);
			tempMap.put("major", list);
			service.add(tempMap);
			Separator.cmd.setDir("common");
			Separator.cmd.process();
			
			DispatcherServlet.send(request, response);
			break;
			
		case Action.LIST:
		System.out.println("member list 진입");
		
		pxy.setTheNumberOfRows(Integer.parseInt(service.countMembers(cmd)));
		pxy.setPageNumber(Integer.parseInt(request.getParameter("pageNumber")));
		pxy.execute(BlockHandler.attr(pxy), service.getMembers(PageHandler.attr(pxy)));
		DispatcherServlet.send(request, response);
		break;
		case Action.SEARCH:
			System.out.println("member search 진입");
			map=ParamsIterator.execute(request);
			pxy.setTheNumberOfRows(Integer.parseInt(service.countMembers(cmd)));
			cmd=PageHandler.attr(pxy);
			cmd.setColumn("name");
			cmd.setSearchWord(String.valueOf(map.get("search")));
			request.setAttribute("list", null);
			DispatcherServlet.send(request, response);
			break;
		case Action.UPDATE:
			cmd.setSearchWord(request.getParameter("id"));
			service.modify(service.memberById(cmd));
			DispatcherServlet.send(request, response);
			break;
		
		case Action.DELETE:
			//service.remove(request.getParameter("id"));
			response.sendRedirect(request.getContextPath()+"/member.do?action=list&page=member_list&pageNumber=1");
		
			break;
		
		case Action.DETAIL:
			cmd.setSearchWord(request.getParameter("id"));
			request.setAttribute("student", service.memberById(cmd));
			DispatcherServlet.send(request, response);
			break;
		
		default:System.out.println("command fail.........");
			break;
		}
	}
}
