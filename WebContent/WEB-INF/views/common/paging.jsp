<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	

	System.out.println("paging~~~~~~~~~~~~~~~~~~~~~:");
	
	int totalRecordCount;		// 전체 글수
	int pageNumber;				// 현재 페이지 번호
	int pageCountPerScreen;		// 스크린당 페이지수 	
	int recordCountPerPage;		// 페이지당 글수
		
	
	String st1 = request.getParameter("totalRecordCount");
	if(st1 == null)	totalRecordCount = 0;
	else			totalRecordCount = Integer.parseInt(st1);
	
	String st2 = request.getParameter("pageNumber");
	if(st2 == null)	pageNumber = 0;
	else			pageNumber = Integer.parseInt(st2);
	
	String st3 = request.getParameter("pageCountPerScreen");
	if(st3 == null)	pageCountPerScreen = 0;
	else			pageCountPerScreen = Integer.parseInt(st3);
	
	String st4 = request.getParameter("recordCountPerPage");
	if(st4 == null)	recordCountPerPage = 0;
	else			recordCountPerPage = Integer.parseInt(st4);
		
	int totalPageCount = totalRecordCount / recordCountPerPage;	// 총페이지
	//		1		=		12					10
	
	if ((totalRecordCount % recordCountPerPage) != 0) {
		//	12					10	
		totalPageCount++;		// 1 -> 2
	}
	
	int screenStartPageIndex = ((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen;	
	//			0 =				0 + 1			10						10						
	int screenEndPageIndex = (((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;	
	//			20 = 			0 + 1			10						10						10								
	if (screenEndPageIndex > totalPageCount) screenEndPageIndex = totalPageCount;		// 페이지 블록을 10까지만 표시하려고 하는 처리
	//		10					2				2					2
			
	/* 
	System.out.println("totalRecordCount:" + totalRecordCount);
	System.out.println("pageNumber:" + pageNumber);
	System.out.println("pageCountPerScreen:" + pageCountPerScreen);
	System.out.println("recordCountPerPage:" + recordCountPerPage);
	System.out.println("totalPageCount:" + totalPageCount);
	System.out.println("screenStartPageIndex:" + screenStartPageIndex);
	System.out.println("screenEndPageIndex:" + screenEndPageIndex);
	 */

	/* 
	totalRecordCount:12
	pageNumber:0
	pageCountPerScreen:10
	recordCountPerPage:10
	totalPageCount:2
	screenStartPageIndex:0
	screenEndPageIndex:2
	 */
	
	
	if (((pageNumber+1) % pageCountPerScreen) == 0)
	{
	    screenStartPageIndex = (((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) - pageCountPerScreen;
	    screenEndPageIndex = pageNumber+1;
	}
%>
<div class="pagination pagination-centered">
	<div class="btn-toolbar" style="margin: 0;"> 
	totalPageCount
	<%
		if (totalPageCount > 1){
	%>
	<button class="btn"><a href="#none" title="처음페이지" onclick="goPage('0');">&larr; First</a></button>&nbsp;
	<%
		}
		if (pageNumber >= 1){
			%>
			<button class="btn"><a href="#none" title="이전페이지" onclick="goPage('<%=pageNumber-1%>');">Previous</a></button>&nbsp;	
			<%
		}
		    	
		for (int i=screenStartPageIndex; i<screenEndPageIndex ;i++){
			if (i==pageNumber){
		    	%>	
				<button class="btn"><span style="font-size:12pt; font-weight:bold;"><%=i+1%></span></button>&nbsp;
		    	<% 
			} else { 
		    	%>	
				<button class="btn"><a href="#none" title="<%=i+1%>페이지" onclick="goPage(<%=i%>);" style="font-size:12pt; font-weight:normal;"><%=i+1%></a></button>&nbsp;
		    	<%		
		    }
		}
		    	
		if (pageNumber+1 < totalPageCount){
		    %>	
			<button class="btn"><a href="#none" title="다음페이지" onclick="goPage(<%=pageNumber+1 %>);">next</a></button>&nbsp;
		    <%
		} // end if
		    
		int end_page = 0;
		if (totalPageCount > 0){
			end_page = totalPageCount - 1;
		}
		if (totalPageCount > 1){
	%>	        	
	<button class="btn"><a href="#none" title="마지막페이지" onclick="goPage(<%=end_page %>);" >Last &rarr;</a></button>
	<%
	}
	%>
	</div>		
</div>