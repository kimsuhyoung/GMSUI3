package com.gms.web.command;

public class SearchCommand extends Command {
	public SearchCommand(String dir,String action, String page, String pageNumber,String column, String searchWord){
		setDir(dir);
		setAction(action);
		setPage(page);
		setPageNumber(pageNumber);
		setColumn(column);
		setSearchWord(searchWord);
		process();
	}
}
