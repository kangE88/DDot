<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	

	System.out.println("paging1~~~~~~~~~~~~~~~~~~~~~:");
	
	int totalRecordCountc;		// 전체 글수
	int pageNumberc;				// 현재 페이지 번호
	int pageCountPerScreenc;		// 스크린당 페이지수 	
	int recordCountPerPagec;		// 페이지당 글수
		
	
	String st1 = request.getParameter("totalRecordCountc");
	if(st1 == null)	totalRecordCountc = 0;
	else			totalRecordCountc = Integer.parseInt(st1);
	
	String st2 = request.getParameter("pageNumberc");
	if(st2 == null)	pageNumberc = 0;
	else			pageNumberc = Integer.parseInt(st2);
	
	String st3 = request.getParameter("pageCountPerScreenc");
	if(st3 == null)	pageCountPerScreenc = 0;
	else			pageCountPerScreenc = Integer.parseInt(st3);
	
	String st4 = request.getParameter("recordCountPerPagec");
	if(st4 == null)	recordCountPerPagec = 0;
	else			recordCountPerPagec = Integer.parseInt(st4);
		
	int totalPageCountc = totalRecordCountc / recordCountPerPagec;	// 총페이지
	//		1		=		12					10
	
	if ((totalRecordCountc % recordCountPerPagec) != 0) {
		//	12					10	
		totalPageCountc++;		// 1 -> 2
	}
	
	int screenStartPageIndexc = ((pageNumberc+1) / pageCountPerScreenc) * pageCountPerScreenc;	
	//			0 =				0 + 1			10						10						
	int screenEndPageIndexc = (((pageNumberc+1) / pageCountPerScreenc) * pageCountPerScreenc) + pageCountPerScreenc;	
	//			20 = 			0 + 1			10						10						10								
	if (screenEndPageIndexc > totalPageCountc) screenEndPageIndexc = totalPageCountc;		// 페이지 블록을 10까지만 표시하려고 하는 처리
	//		10					2				2					2
	
	/* 
	System.out.println("totalRecordCountc:" + totalRecordCountc);
	System.out.println("pageNumberc:" + pageNumberc);
	System.out.println("pageCountPerScreenc:" + pageCountPerScreenc);
	System.out.println("recordCountPerPagec:" + recordCountPerPagec);
	System.out.println("totalPageCountc:" + totalPageCountc);
	System.out.println("screenStartPageIndexc:" + screenStartPageIndexc);
	System.out.println("screenEndPageIndexc:" + screenEndPageIndexc);
	 */

	/* 
	totalRecordCountc:12
	pageNumberc:0
	pageCountPerScreenc:10
	recordCountPerPagec:10
	totalPageCountc:2
	screenStartPageIndexc:0
	screenEndPageIndexc:2
	 */
	
	
	if (((pageNumberc+1) % pageCountPerScreenc) == 0)
	{
	    screenStartPageIndexc = (((pageNumberc+1) / pageCountPerScreenc) * pageCountPerScreenc) - pageCountPerScreenc;
	    screenEndPageIndexc = pageNumberc+1;
	}
%>
<div class="pagination pagination-centered">
	<div class="btn-toolbar" style="margin: 0;"> 
	totalPageCountc
	<%
		if (totalPageCountc > 1){
	%>
	<button class="btn"><a href="#none" title="처음페이지" onclick="goPagec('0');">&larr; 처음</a></button>&nbsp;
	<%
		}
		if (pageNumberc >= 1){
			%>
			<button class="btn"><a href="#none" title="이전페이지" onclick="goPagec('<%=pageNumberc-1%>');">이전</a></button>&nbsp;	
			<%
		}
		    	
		for (int i=screenStartPageIndexc; i<screenEndPageIndexc ;i++){
			if (i==pageNumberc){
		    	%>	
				<button class="btn"><span style="font-size:12pt; font-weight:bold;"><%=i+1%></span></button>&nbsp;
		    	<% 
			} else { 
		    	%>	
				<button class="btn"><a href="#none" title="<%=i+1%>페이지" onclick="goPagec(<%=i%>);" style="font-size:12pt; font-weight:normal;"><%=i+1%></a></button>&nbsp;
		    	<%		
		    }
		}
		    	
		if (pageNumberc+1 < totalPageCountc){
		    %>	
			<button class="btn"><a href="#none" title="다음페이지" onclick="goPagec(<%=pageNumberc+1 %>);">다음</a></button>&nbsp;
		    <%
		} // end if
		    
		int end_pagec = 0;
		if (totalPageCountc > 0){
			end_pagec = totalPageCountc - 1;
		}
		if (totalPageCountc > 1){
	%>	        	
	<button class="btn"><a href="#none" title="마지막페이지" onclick="goPagec(<%=end_pagec %>);" >마지막 &rarr;</a></button>
	<%
	}
	%>
	</div>		
</div>