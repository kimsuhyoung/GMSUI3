package com.gms.web.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.gms.web.constant.*;
public class Command implements Commandable{
	protected String dir,action,page,view;

	public String getView() {
		return view;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	@Override
	public void process() {
		// TODO Auto-generated method stub
		this.view=PATH.VIEW+dir+PATH.SEPARATOR+page+Extension.JSP;
			
	}
	
	@Override
	public String toString(){
		return "command [DEST="+dir+"/"+page+".jsp"+"ACTION"+action;
	}
}
