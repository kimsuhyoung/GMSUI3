package com.gms.web.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.gms.web.constant.*;

import lombok.Getter;
import lombok.Setter;
public class Command implements Commandable{
	@Getter 
	protected String action,pageNumber,view;

	@Getter @Setter
	protected String dir,startRow,endRow,page,searchWord,column;
	
	public void setPageNumber(){
		this.pageNumber = (pageNumber==null)? "1" : pageNumber;
		System.out.println("페이지번호 : " + pageNumber); //파라미터값이 존재하지 않으면 디폴트값을 주는 구조다
	}
	
	public void setAction(String action){
	this.action=this.view=(dir.equals(""))? "move" : action;
	System.out.println("엑션 : " + action);
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public void setPageNumber(String pageNumber) {
		this.pageNumber = pageNumber;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public void setColumn(String column){
		this.column = column;
	}
	@Override
	public void process() {
		this.view=(dir.equals("home"))? "/WEB-INF/view/common/home.jsp" : PATH.VIEW+dir+PATH.SEPARATOR+page+Extension.JSP;
	}
	
	@Override
	public String toString(){
		return "command [DEST="+dir+"/"+page+".jsp"+"ACTION"+action;
	}
}
