package com.gms.web.service;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gms.web.constant.Database;
import com.gms.web.dao.MemberDao;
import com.gms.web.dao.MemberDaoImpl;
import com.gms.web.domain.MemberBean;




public class MemberServiceImpl implements MemberService{
	
	public static MemberServiceImpl getInstance() {
		
		return new MemberServiceImpl();
	}
	MemberDao dao;
	private MemberServiceImpl() {
		//dao=new MemberDaoImpl();
	}
	@Override
	public String addMember(MemberBean member) {
		return (MemberDaoImpl.getInstance().insert(member).equals("0"))?"회원가입 실패":"회원가입 성공";
	}
	@Override
	public List<MemberBean> getMembers() {
		return MemberDaoImpl.getInstance().selectAll();
	}
	@Override
	public String countMembers() {
		return MemberDaoImpl.getInstance().count();
	}
	@Override
	public MemberBean memberById(String id) {
		return MemberDaoImpl.getInstance().selectById(id);
	}
	@Override
	public List<MemberBean> getMemberByName(String name) {
		return MemberDaoImpl.getInstance().selectByName(name);
	}
	@Override
	public String modify(MemberBean param) {
	
	return (MemberDaoImpl.getInstance().update(param).equals("0"))?"회원정보수정 실패":"회원정보수정 성공";
	}
	@Override
	public String remove(String id) {
		return (MemberDaoImpl.getInstance().delete(id).equals("0"))?"회원탈퇴실패":"회원탈퇴성공";
	}
	@Override
	public Map<String, Object> login(MemberBean member) {
		Map<String,Object> map = new HashMap<>();
		MemberBean m1=memberById(member.getId());
		String page=
		(m1!=null)?
				(member.getPw().equals(m1.getPw()))?
						"main":"login_fail":"join";
		map.put("page",page);
		map.put("user",m1);
		return map;
	}
	
}
