package com.DDot.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LogAop {

	@Around("within(com.DDot.dao.impl.*)")
	public Object loggerApp(ProceedingJoinPoint jp)throws Throwable {
		
		// 실행되는 메소드명
		String signatureStr = jp.getSignature().toShortString();		
		System.out.println("loggerApp:" + signatureStr + " 메소드 실행");
		
		Object obj = jp.proceed();		
		return obj;
	}
}







