package com.gms.web.service;
import java.util.List;
import java.util.Map;

import com.gms.web.domain.MemberBean;



public interface MemberService {
	public String addMember(MemberBean member);
	public List<MemberBean> getMembers();
	public List<MemberBean> getMemberByName(String name);
	public MemberBean memberById(String id);
	public String countMembers();
	public String modify(MemberBean member);
	public String remove(String id);
	public Map<String, Object> login(MemberBean member);//패스워드를 은닉화해야하기 때문에 멤버빈의 있는 패스워드를 호출하는 방식으로 해야하기 때문에 파라미터값을 멤버빈으로 한다.
}
