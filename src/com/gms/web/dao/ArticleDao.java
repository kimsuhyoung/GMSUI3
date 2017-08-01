package com.gms.web.dao;
import java.util.List;

import com.gms.web.domain.ArticleBean;


public interface ArticleDao {
	public String insert(ArticleBean article);
	public List<ArticleBean> selectAll();
	public List<ArticleBean> selectById(String id);
	public ArticleBean selectBySeq(String seq);
	public String update(ArticleBean article);
	public String delete(String seq);
	public String count();
}
