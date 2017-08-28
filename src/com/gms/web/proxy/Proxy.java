package com.gms.web.proxy;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import lombok.Getter;

public abstract class Proxy {
	@Getter HttpServletRequest request; //프록시에 세터가 있으면 패턴이 깨진다/ 이미 있는 정보를 가지고 와야하기 때문에 게터만 있어야 한다.
	public Proxy(HttpServletRequest request){
		this.request=request;
	}

}
	