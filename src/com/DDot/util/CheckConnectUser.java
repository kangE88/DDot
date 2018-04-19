package com.DDot.util;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class CheckConnectUser implements HttpSessionBindingListener {

	  ServletContext context;
	  
	  public CheckConnectUser(ServletContext context) {
	    this.context = context;
	  }
	
	@Override
	public void valueBound(HttpSessionBindingEvent e) {
		context.log("세션바인딩리스너 생성");
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent e) {
		context.log("세션바인딩리스너 소멸");
	}

}
