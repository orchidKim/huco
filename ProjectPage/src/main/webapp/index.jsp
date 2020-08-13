<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	var filter = "win16|win32|win64|mac";
	if(navigator.platform){
		if(0 > filter.indexOf(navigator.platform.toLowerCase())){
			alert("Mobile");
			location.href='${pageContext.request.contextPath}/main/main.do';
		}else{
			alert("PC");
			location.href='${pageContext.request.contextPath}/main/main.do';
		}
	}	 
</script>  
<%-- <%
	response.sendRedirect(
			request.getContextPath()+"/main/main.do");
%> --%>



 
 
 
 
 
 
 
 