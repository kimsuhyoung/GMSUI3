package com.gms.web.service;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.constant.Database;
import com.gms.web.dao.MemberDao;
import com.gms.web.dao.MemberDaoImpl;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;




public class MemberServiceImpl implements MemberService{
	
	public static MemberServiceImpl getInstance() {
		
		return new MemberServiceImpl();
	}
	MemberDao dao;
	private MemberServiceImpl() {
		//dao=new MemberDaoImpl();
	}
	@Override
	public String add(Map<String,Object> map) {
		System.out.println("member service 진입");
		MemberBean m=(MemberBean)map.get("member");
		System.out.println("넘어온 회원의 정보:"+m.toString());
		@SuppressWarnings("unchecked")
		List<MajorBean>list=(List<MajorBean>)map.get("major");
		System.out.println("넘어온 수강과목:"+list);
		MemberDaoImpl.getInstance().insert(map);
		return null; 
	}
	@Override
	public List<?> getMembers(Command cmd) {
		return MemberDaoImpl.getInstance().selectAll(cmd);
	}
	@Override
	public String countMembers(Command cmd) {
		return MemberDaoImpl.getInstance().count(cmd);
	}
	@Override
	public MemberBean memberById(Command cmd) {
		return MemberDaoImpl.getInstance().selectById(cmd);
	}
	@Override
	public List<StudentBean> getMemberByName(Command cmd) {
		return MemberDaoImpl.getInstance().selectByName(cmd);
	}
	@Override
	public String modify(MemberBean param) {
	
	return (MemberDaoImpl.getInstance().update(param).equals("0"))?"회원정보수정 실패":"회원정보수정 성공";
	}
	@Override
	public String remove(Command cmd) {
		return (MemberDaoImpl.getInstance().delete(cmd).equals("0"))?"회원탈퇴실패":"회원탈퇴성공";
	}
	@Override
	public Map<String, Object> login(MemberBean member) {
		Command cmd=new Command();
		Map<String,Object> map = new HashMap<>();
		cmd.setSearchWord(member.getId());
		MemberBean m1=memberById(cmd);
		String page=
		(m1!=null)?
				(member.getPw().equals(m1.getPw()))?
						"main":"login_fail":"join";
		map.put("page",page);
		map.put("user",m1);
		return map;
	}
	
}
