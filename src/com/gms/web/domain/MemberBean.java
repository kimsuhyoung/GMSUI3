package com.gms.web.domain;

import java.io.Serializable;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class MemberBean{
	private static final long serialVersionUID=1L;
	private String id,pw,ssn,name,regdate,email,major,subject,phone,profile,addr ;
	
	public String toString(){
		return String.format("ID : %s, PW : %s, NAME : %s SSN : %s , REGDATE : %s \n ", id,pw,name,ssn,regdate);
	}
}
